# coding=utf-8

from __future__ import absolute_import

from talos.db.crud import ResourceBase

from cms.db import models


class User(ResourceBase):
    orm_meta = models.User
    _primary_keys = 'id'

    # def create(self, resource, validate=True, detail=True):
        # resource['id'] = uuid.uuid4().hex
        # super(User, self).create(resource, validate=validate, detail=validate)


class UserPhoneNum(ResourceBase):
    orm_meta = models.PhoneNum
    _primary_keys = ('user_id', 'phone')
