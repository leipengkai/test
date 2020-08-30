# coding=utf-8

from __future__ import absolute_import

from talos.common.controller import CollectionController
from talos.common.controller import ItemController
from cms.apps.user import api as user_api
from cms.db.resource import *
import falcon


class CollectionUSER(CollectionController):
    name = 'cms.users'
    resource = user_api.Resource
    def on_get(self, req, resp, **kwargs):
        print User().count()


    def create(self, req, data, **kwargs):
        """
        创建资源

        :param req: 请求对象
        :type req: Request
        :param data: 资源的内容
        :type data: dict
        :returns: 创建后的资源信息
        :rtype: dict
        """
        return self.make_resource(req).create(data)

    def on_post(self, req, resp, **kwargs):
        """
        处理POST请求

        :param req: 请求对象
        :type req: Request
        :param resp: 相应对象
        :type resp: Response
        """
        print User().list()
        self._validate_method(req)
        self._validate_data(req)
        resp.json = self.create(req, req.json, **kwargs)
        resp.status = falcon.HTTP_201


class ItemUSER(ItemController):
    name = 'cms.user'
    resource = user_api.Resource
