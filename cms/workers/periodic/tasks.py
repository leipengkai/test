# coding=utf-8
from time import time

from talos.common import celery


@celery.app.task

def test_add(x, y):
    time().sleep(1)
    return x + y


