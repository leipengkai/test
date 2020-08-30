# coding=utf-8

from __future__ import absolute_import

import os
import sys
from talos.server import base
# from talos.core import config

BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
# 将应用包加入系统变量，便于模块导入
sys.path.insert(0, BASE_DIR)
print(BASE_DIR)
sys.path.insert(0, os.path.join(BASE_DIR, 'cms'))
# sys.path.insert(0, os.path.join(BASE_DIR, 'extra_apps'))



# @config.intercept('db_password', 'other_password')
# def get_password(value, origin_value):
#     """value为上一个拦截器处理后的值（若此函数为第一个拦截器，等价于origin_value）
#        origin_value为原始配置文件的值
#        没有拦截的变量talos将自动使用原始值，因此定义一个拦截器是很关键的
#        函数处理后要求必须返回一个值
#     """
#     # 演示使用不安全的base64，请使用你认为安全的算法进行处理
#     return base64.b64decode(origin_value)


print(os.path.abspath('./etc/cms.conf'))    # new/test/etc/cms.conf
# base.initialize_config(os.path.abspath('./etc/cms.conf'),
                       # #conf_dir=os.path.abspath('./etc/cms.conf')
                       # )
# print("11")
# print(os.path.join(BASE_DIR, 'etc/cms.conf'))
base.initialize_config(os.path.join(BASE_DIR, 'etc/cms.conf'),
                       #conf_dir=os.path.abspath('./etc/cms.conf')
                       )
base.initialize_i18n('cms')
# not allowed database connections by default, if you want to use db features, pls remove '#'
# base.initialize_db()
# import celery later, after initialize config
from talos.common import celery
app = celery.app


