# coding=utf-8

from __future__ import absolute_import

import logging
from cms.db.resource import *

LOG = logging.getLogger(__name__)

class Resource(object):
    def create(self, data):
        data = User().create({ 'name': 'femn'})
        print data
        return data

    def list(self, filters=None, orders=None, offset=None, limit=None):
        return [{'id': 1, 'name': ':wworld'}]

    def count(self, filters=None, offset=None, limit=None):
        return 1

    def update(self, rid, data):
        return data, data

    def get(self, rid):
        return {'id': 1, 'name': 'helloworld'}

    def delete(self, rid):
        return 0, None
