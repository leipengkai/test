# coding=utf-8

from talos.common import celery
from talos.common import async_helper
from cms.workers.user import callback


@celery.app.task
def add(data, task_id):
    result = {'result': data['x'] + data['y']}
    remote_result = callback.update_task.remote(result, task_id=task_id)
    return result

