# coding=utf-8


from talos.common import async_helper
# data是强制参数，task_id为url强制参数(如果url没有参数，则函数也无需task_id)
# task_id为url强制参数，默认类型是字符串(比如/callback/add/{x}/{y}，函数内直接执行x+y结果会是字符串拼接，因为由于此参数从url中提取，所以默认类型为str，需要特别注意)
@async_helper.callback('/callback/add/{task_id}')
def update_task(data, task_id):
    # 远程调用真正执行方在api server服务，因此默认可以使用数据库操作
    res_before,res_after = task_db_api().update(task_id, data)
    # 函数可返回可json化的数据，并返回到调用客户端去
    return res_after
