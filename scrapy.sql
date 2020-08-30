/*
 Navicat Premium Data Transfer

 Source Server         : local_3307(scrapy,leare db)
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3307
 Source Schema         : scrapy

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 30/08/2020 17:01:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of address
-- ----------------------------
BEGIN;
INSERT INTO `address` VALUES (1, '北海', 1);
COMMIT;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
BEGIN;
INSERT INTO `alembic_version` VALUES ('c2ad8d1cb838');
COMMIT;

-- ----------------------------
-- Table structure for areas
-- ----------------------------
DROP TABLE IF EXISTS `areas`;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  CONSTRAINT `areas_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `areas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptno` int(2) NOT NULL AUTO_INCREMENT,
  `dname` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loc` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dept
-- ----------------------------
BEGIN;
INSERT INTO `dept` VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO `dept` VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO `dept` VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO `dept` VALUES (40, 'OPERATIONS', 'BOSTON');
COMMIT;

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `empno` int(4) NOT NULL AUTO_INCREMENT,
  `ename` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mgr` int(4) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `sal` double(7,2) DEFAULT NULL,
  `comm` double(7,2) DEFAULT NULL,
  `deptno` int(2) NOT NULL,
  PRIMARY KEY (`empno`),
  KEY `deptno` (`deptno`),
  CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`deptno`) REFERENCES `dept` (`deptno`)
) ENGINE=InnoDB AUTO_INCREMENT=7935 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of emp
-- ----------------------------
BEGIN;
INSERT INTO `emp` VALUES (7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20);
INSERT INTO `emp` VALUES (7499, 'ALLEN', 'SALESMAN', 7698, '1981-02-20', 1600.00, 300.00, 30);
INSERT INTO `emp` VALUES (7521, 'WARD', 'SALESMAN', 7698, '1981-02-22', 1250.00, 500.00, 30);
INSERT INTO `emp` VALUES (7566, 'JONES', 'MANAGER', 7839, '1981-04-02', 2975.00, NULL, 20);
INSERT INTO `emp` VALUES (7654, 'MARTIN', 'SALESMAN', 7698, '1981-09-28', 1250.00, 1400.00, 30);
INSERT INTO `emp` VALUES (7698, 'BLAKE', 'MANAGER', 7839, '1981-05-01', 2850.00, NULL, 30);
INSERT INTO `emp` VALUES (7782, 'CLARK', 'MANAGER', 7839, '1981-06-09', 2450.00, NULL, 10);
INSERT INTO `emp` VALUES (7788, 'SCOTT', 'ANALYST', 7566, '1987-04-19', 3000.00, NULL, 20);
INSERT INTO `emp` VALUES (7839, 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000.00, NULL, 10);
INSERT INTO `emp` VALUES (7844, 'TURNER', 'SALESMAN', 7698, '1981-09-08', 1500.00, 0.00, 30);
INSERT INTO `emp` VALUES (7876, 'ADAMS', 'CLERK', 7788, '1987-05-23', 1100.00, NULL, 20);
INSERT INTO `emp` VALUES (7900, 'JAMES', 'CLERK', 7698, '1981-12-03', 950.00, NULL, 30);
INSERT INTO `emp` VALUES (7902, 'FORD', 'ANALYST', 7566, '1981-12-03', 3000.00, NULL, 20);
INSERT INTO `emp` VALUES (7934, 'MILLER', 'CLERK', 7782, '1982-01-23', 1300.00, NULL, 10);
COMMIT;

-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of phone
-- ----------------------------
BEGIN;
INSERT INTO `phone` VALUES (1, '18977941970', 1);
INSERT INTO `phone` VALUES (2, '15107792139', 1);
COMMIT;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  CONSTRAINT `resource_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for salgrade
-- ----------------------------
DROP TABLE IF EXISTS `salgrade`;
CREATE TABLE `salgrade` (
  `grade` int(11) NOT NULL AUTO_INCREMENT,
  `losal` int(11) DEFAULT NULL,
  `hisal` int(11) DEFAULT NULL,
  PRIMARY KEY (`grade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of salgrade
-- ----------------------------
BEGIN;
INSERT INTO `salgrade` VALUES (1, 700, 1200);
INSERT INTO `salgrade` VALUES (2, 1201, 1400);
INSERT INTO `salgrade` VALUES (3, 1401, 2000);
INSERT INTO `salgrade` VALUES (4, 2001, 3000);
INSERT INTO `salgrade` VALUES (5, 3001, 9999);
COMMIT;

-- ----------------------------
-- Table structure for scores
-- ----------------------------
DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL,
  `subid` int(11) DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stuid` (`stuid`),
  KEY `subid` (`subid`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`stuid`) REFERENCES `stu` (`id`),
  CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`subid`) REFERENCES `subjects` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of scores
-- ----------------------------
BEGIN;
INSERT INTO `scores` VALUES (1, 1, 1, 80.00);
INSERT INTO `scores` VALUES (2, 2, 2, 60.00);
INSERT INTO `scores` VALUES (3, 2, 3, 70.00);
INSERT INTO `scores` VALUES (4, 3, 1, 90.00);
INSERT INTO `scores` VALUES (5, 4, 4, 60.00);
INSERT INTO `scores` VALUES (6, 5, 2, 75.00);
COMMIT;

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `isdelete` tinyint(1) DEFAULT NULL,
  `hometown` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fscore` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of stu
-- ----------------------------
BEGIN;
INSERT INTO `stu` VALUES (1, '小明', '2008-01-01', 0, 0, '北京', 90);
INSERT INTO `stu` VALUES (2, '小红', '2007-01-01', 1, 0, '上海', 80);
INSERT INTO `stu` VALUES (3, '小兰', '2006-01-01', 1, 0, '广州', 100);
INSERT INTO `stu` VALUES (4, '小王', '2005-01-01', 0, 0, '深圳', 20);
INSERT INTO `stu` VALUES (5, '老王', '2009-01-01', 0, 0, NULL, 30);
INSERT INTO `stu` VALUES (6, '老刘', '2004-01-01', 0, 0, NULL, 40);
INSERT INTO `stu` VALUES (7, '小丽', '2003-01-01', 1, 0, '东莞', 50);
INSERT INTO `stu` VALUES (8, '小芳', '2002-01-01', 1, 0, '福建', 60);
INSERT INTO `stu` VALUES (9, '小粒', '2001-01-01', 0, 0, '福州', 70);
COMMIT;

-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of subjects
-- ----------------------------
BEGIN;
INSERT INTO `subjects` VALUES (1, '语文');
INSERT INTO `subjects` VALUES (2, '数学');
INSERT INTO `subjects` VALUES (3, '英语');
INSERT INTO `subjects` VALUES (4, '科学');
COMMIT;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `res_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'femn');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
