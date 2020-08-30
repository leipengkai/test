# coding=utf-8

from __future__ import absolute_import

from cms.apps.user import controller
from talos.common import async_helper
# from project_name.workers.app_name import callback
# from project_name.workers.app_name import callback


def add_routes(api):
    api.add_route('/v1/cms/users', controller.CollectionUSER())
    api.add_route('/v1/cms/users/{rid}', controller.ItemUSER())
    # async_helper.add_callback_route(api, callback.callback_add)

