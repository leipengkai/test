
[教程](https://gitee.com/wu.jianjun/talos)

```
vim cms/cms/server/simple_server.py

from cms.server.wsgi_server import application
# 改成:
from wsgi_server import application

vim cms/cms/server/wsgi_server.py


application = base.initialize_server('cms',
                                     os.path.abspath('../../etc/cms.conf'),
                                     conf_dir=os.path.abspath('../../etc/cms.conf'))
```


配置好难搞啊,多一个逗号就报错


celery指令应在celery_tasks的上一级文件夹下执行，通常为项目文件夹下执行才行

```
pip install -U "celery[redis]"


# 创建一个新队列
docker exec -it scrapy_mq_1 bash
rabbitmqadmin declare queue --vhost=/ name=cms-test durable=true --username=rabbitmq --password=rabbitmq
rabbitmqctl list_queues

# 启动beat
cd ~/Downloads/github/work/new/test/cms
celery -A cms.server.celery_worker beat --loglevel=DEBUG

注意celery_worker中的路径,是跟执行上面的命令相关的

    "celery": {
        "worker_concurrency": 8,

        "broker_url": "pyamqp://rabbitmq:rabbitmq@127.0.0.1:5677//",
        "result_backend": "redis://127.0.0.1/4",
        
        # 导致找不到 ImportError: No module named workers.user.tasks
        "imports": [
            "cms.workers.user.tasks"
        ],
        # 导致找不到
        
        "beat_schedule": {
            "test_every_5s": {
                "task": "cms.workers.periodic.tasks.test_add",
                "schedule": 5,
                "args": [3,6] 
                }
        },
        "task_serializer": "json",
        "result_serializer": "json",
        "accept_content": ["json"],
        "worker_prefetch_multiplier": 1,
        "task_routes": [{
            "cms.workers.*": {"queue": "cms-test"}
            }]
        },
        "worker": {
            "callback": {
                "strict_client": true,
                "allow_hosts": ["127.0.0.1"]
            }
        }
        
        
# 启动worker
celery -A cms.server.celery_worker worker --loglevel=DEBUG -Q cms-test

pip install flower
celery flower -A cms.server.celery_worker --broker=pyamqp://rabbitmq:rabbitmq@127.0.0.1:5677// 





```

