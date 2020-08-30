# coding=utf-8

from __future__ import absolute_import

from sqlalchemy import String, ForeignKey, Column, Integer
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.mysql import DOUBLE,INTEGER,DECIMAL
from talos.db.dictbase import DictBase
#
#
DbBase = declarative_base()
metadata = DbBase .metadata
#
#
# def get_names():
#     """
#     获取所有Model类名
#     """
#     return Base._decl_class_registry.keys()
#
#
# def get_class_by_name(name):
#     """
#     根据Model类名获取类
#
#     :param name: Model类名
#     :type name: str
#     :returns: Model类
#     :rtype: class
#     """
#     return Base._decl_class_registry.get(name, None)
#
#
# def get_class_by_tablename(tablename):
#     """
#     根据表名获取类
#
#     :param tablename: 表名
#     :type tablename: str
#     :returns: Model类
#     :rtype: class
#     """
#     for c in Base._decl_class_registry.values():
#         if hasattr(c, '__tablename__') and c.__tablename__ == tablename:
#             return c
#
#
# def get_tablename_by_name(name):
#     """
#     根据Model类名获取表名
#
#     :param name: Model类名
#     :type name: str
#     :returns: 表名
#     :rtype: str
#     """
#     return Base._decl_class_registry.get(name, None).__tablename__
#
#
# def get_name_by_class(modelclass):
#     """
#     根据Model类获取类名
#
#     :param modelclass: Model类
#     :type modelclass: class
#     :returns: 类名
#     :rtype: str
#     """
#     for n, c in Base._decl_class_registry.items():
#         if c == modelclass:
#             return n
#
#
# class User(Base, DictBase):
#     __tablename__ = 'user'
#
#     id = Column(String(32), primary_key=True)
#     name = Column(String(64))
#     email = Column(String(64))






class Address(DbBase):
    __tablename__ = 'address'
    attributes = ['id', 'location', 'user_id']
    detail_attributes = attributes
    summary_attributes = ['location']

    id = Column(INTEGER(11), primary_key=True, autoincrement=True)
    location = Column(String(255), nullable=False)
    user_id = Column(ForeignKey(u'user.id'), nullable=False)

    # 只是方便引用,写在那边无所谓,单方引用
    user = relationship(u'User')    # , uselist=False

    def __repr__(self):
        return "<Address(id={},location={})>".format(self.id,self.location)

class PhoneNum(DbBase):
    __tablename__ = 'phone'
    attributes = ['id', 'number', 'user_id']
    detail_attributes = attributes
    summary_attributes = ['number']

    id = Column(INTEGER(11), primary_key=True, autoincrement=True)
    number = Column(String(255), nullable=False)
    user_id = Column(ForeignKey(u'user.id'), nullable=False)

    user = relationship(u'User')

    def __repr__(self):
        return "<PhoneNum(id={},number={})>".format(self.id,self.number)


class User(DbBase):
    __tablename__ = 'user'
    attributes = ['id', 'name', 'addresses', 'phonenums']
    detail_attributes = attributes
    summary_attributes = ['name']

    id = Column(INTEGER(11), primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)

    # 只是方便引用,写在那边无所谓,单方引用
    addresses = relationship(u'Address', back_populates=u'user', lazy=False, uselist=True, viewonly=True)
    phonenums = relationship(u'PhoneNum', back_populates=u'user', lazy=False, uselist=True, viewonly=True)
    # lazy=False,一次性加载出来phonenums的值,这样就可以让信息在一次sql查询中加载出来，而不是每次访问外键属性再发起一次查询。问题在于，lazy=False时sql被组合为一个SQL语句，relationship每级嵌套会被展开，实际数据库查询结果将是乘数级
    # uselist=False,addresses=add1可以插入,但为True的话,报错:not list-like
    # uselist=True, 必须以列表的形式添加: user1.phonenums = [phn1, phn2]


    def __repr__(self):
        return "<User(id={},name={},addresses={},phonenums={})>".format(self.id,self.name, self.addresses, self.phonenums)

class Tag(DbBase):
    __tablename__ = 'tag'
    attributes = ['id', 'res_id', 'key', 'value']
    detail_attributes = attributes
    summary_attributes = ['key', 'value']

    id = Column(INTEGER(11), primary_key=True, autoincrement=True)
    res_id = Column(String(36), nullable=False)
    key = Column(String(36), nullable=False)
    value = Column(String(36), nullable=False)

    def __repr__(self):
        return "<Tag(id={},res_id={},key={},value={})>".format(self.id,self.res_id,self.key,self.value)


class Region(DbBase):
    '''
    地区表,一个地区可以有多个标签
    '''
    __tablename__ = 'region'
    attributes = ['id', 'name', 'desc', 'tags', 'user_id', 'user']
    detail_attributes = attributes
    summary_attributes = ['name', 'desc']

    id = Column(INTEGER(11), primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    desc = Column(String(255), nullable=True)
    user_id = Column(ForeignKey(u'user.id'), nullable=True)
    user = relationship(u'User')

    # alembic revision --autogenerate -m "work"
    # 对下面这个没生效
    tags = relationship(u'Tag', primaryjoin='foreign(Region.id) == Tag.res_id',
                        lazy=False, viewonly=True, uselist=True)
    # https://www.osgeo.cn/sqlalchemy/orm/join_conditions.html
    def __repr__(self):
        return "<Region(id={},name={},user={},tags={})>".format(self.id,self.name,self.user,self.tags)

class Resource(DbBase):
    '''
    资源表,一个资源可以有多个标签
    '''
    __tablename__ = 'resource'
    attributes = ['id', 'name', 'desc', 'tags', 'user_id', 'user', 'region_id', 'region']
    detail_attributes = attributes
    summary_attributes = ['name', 'desc']

    id = Column(INTEGER(11), primary_key=True, autoincrement=True)
    name = Column(String(255), nullable=False)
    desc = Column(String(255), nullable=True)
    user_id = Column(ForeignKey(u'user.id'), nullable=True)
    region_id = Column(ForeignKey(u'region.id'), nullable=True)
    user = relationship(u'User')
    region = relationship(u'Region')

    tags = relationship(u'Tag', primaryjoin='foreign(Resource.id) == Tag.res_id',
                        lazy=False, viewonly=True, uselist=True)
    def __repr__(self):
        return "<Resource(id={},name={},user={},region={},tags={})>".format(self.id,self.name,self.user,self.region,self.tags)

