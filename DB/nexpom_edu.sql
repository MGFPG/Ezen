/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.100.252
 Source Server Type    : MariaDB
 Source Server Version : 100600
 Source Host           : 192.168.100.252:3306
 Source Schema         : nexpom_edu

 Target Server Type    : MariaDB
 Target Server Version : 100600
 File Encoding         : 65001

 Date: 14/01/2022 14:31:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for n_code
-- ----------------------------
DROP TABLE IF EXISTS `n_code`;
CREATE TABLE "n_code" (
  "seq" int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  "p_code" varchar(10) DEFAULT NULL,
  "code" varchar(100) NOT NULL,
  "code_nm" varchar(255) DEFAULT NULL,
  "create_time" datetime DEFAULT NULL,
  "create_user" varchar(255) DEFAULT NULL,
  "update_time" datetime DEFAULT NULL,
  "update_user" varchar(255) DEFAULT NULL,
  "use_yn" varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY ("seq") USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of n_code
-- ----------------------------
BEGIN;
INSERT INTO `n_code` VALUES (00000000001, 'ROOT', 'AC-0000', '알람유형', '2019-08-01 17:31:14', 'super', '2019-08-01 17:54:36', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000002, 'AC-0000', 'AC-0001', '순간정지', '2019-08-01 17:58:02', 'super', '2019-08-01 17:58:02', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000003, 'WC-0000', 'WC-0011', '질산탱크실', '2021-03-08 20:15:21', 'riverjjang', '2021-03-08 20:15:21', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000004, 'WC-0000', 'WC-0008', '소방감지실', '2021-03-08 20:16:21', 'riverjjang', '2021-03-08 20:16:21', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000005, 'ROOT', 'AT-0000', '알람타입', '2019-09-24 15:16:43', 'super', '2019-09-24 15:16:43', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000006, 'AT-0000', 'AT-0001', '시간횟수', '2019-09-24 15:17:18', 'super', '2019-09-24 15:17:18', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000007, 'AT-0000', 'AT-0002', '연속횟수', '2019-09-24 15:22:41', 'super', '2019-09-24 15:22:41', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000008, 'ROOT', 'ST-0000', '스펙종류', '2019-09-24 15:24:35', 'super', '2019-09-24 15:24:35', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000009, 'ST-0000', 'ST-0002', '주의심각', '2019-09-24 15:24:52', 'super', '2019-09-24 15:24:52', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000010, 'ST-0000', 'ST-0001', '없음', '2019-09-24 15:26:32', 'super', '2019-09-24 15:26:32', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000011, 'ST-0000', 'ST-0003', '주의', '2019-09-30 09:36:00', 'super', '2019-09-30 09:36:00', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000012, 'ST-0000', 'ST-0004', '심각', '2019-09-30 09:36:16', 'super', '2019-09-30 09:36:16', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000013, 'ROOT', 'ET-0000', '설비타입', '2019-10-06 10:55:05', 'super', '2019-10-06 10:55:05', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000014, 'ROOT', 'DT-0000', '데이터타입', '2019-10-06 10:59:57', 'super', '2019-10-06 10:59:57', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000015, 'DT-0000', 'ANALOG', '아날로그(센서)데이터', '2019-10-06 11:00:24', 'super', '2019-10-06 11:00:24', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000016, 'DT-0000', 'PROCESS', '아날로그(공정)데이터', '2019-10-06 11:00:57', 'super', '2019-10-06 11:00:57', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000017, 'DT-0000', 'DIGITAL', '디지털(정지알람)데이터', '2019-10-06 11:01:21', 'super', '2019-10-06 11:01:21', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000018, 'ROOT', 'EV-0000', '이벤트타입', '2019-10-18 19:04:49', 'super', '2019-10-18 19:04:49', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000019, 'EV-0000', 'EV-0001', '정지알람', '2019-10-18 19:05:36', 'super', '2019-10-18 19:05:36', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000020, 'EV-0000', 'EV-0002', '이벤트알람', '2019-10-18 19:06:01', 'super', '2019-10-18 19:06:01', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000021, 'EV-0000', 'EV-0003', '조건알람', '2019-10-18 19:06:33', 'super', '2019-10-18 19:06:33', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000022, 'EV-0000', 'EV-0004', '이메일알람', '2020-01-10 15:04:28', 'super', '2020-01-10 15:04:28', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000023, 'ROOT', 'FT-0000', '공장', '2021-01-21 19:49:53', 'super', '2021-01-21 19:49:53', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000024, 'FT-0000', 'FT-0001', '1공장', '2021-01-21 19:50:24', 'super', '2021-01-21 19:50:24', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000025, 'FT-0000', 'FT-0002', '2공장', '2021-01-21 19:50:47', 'super', '2021-01-21 19:50:47', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000026, 'FT-0000', 'FT-0003', '3공장', '2021-01-21 19:51:03', 'super', '2021-01-21 19:51:03', 'super', 'Y');
INSERT INTO `n_code` VALUES (00000000027, 'ET-0000', 'ET-0001', '가스감지기', '2021-03-08 19:59:21', 'riverjjang', '2021-03-08 19:59:21', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000028, 'ET-0000', 'ET-0002', '가스측정계', '2021-03-08 19:59:45', 'riverjjang', '2021-03-08 19:59:45', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000029, 'ET-0000', 'ET-0005', '수위계', '2021-03-08 20:00:41', 'riverjjang', '2021-03-08 20:00:41', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000030, 'ET-0000', 'ET-0007', '온도계', '2021-03-08 20:01:35', 'riverjjang', '2021-03-08 20:01:35', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000031, 'ET-0000', 'ET-0003', '누수감지계', '2021-03-08 20:00:05', 'riverjjang', '2021-03-08 20:00:05', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000032, 'ET-0000', 'ET-0004', '소방수신기', '2021-03-08 20:00:24', 'riverjjang', '2021-03-08 20:00:24', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000033, 'ET-0000', 'ET-0006', '수질측정계', '2021-03-08 20:00:58', 'riverjjang', '2021-03-08 20:00:58', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000034, 'ET-0000', 'ET-0008', '온습도계', '2021-03-08 20:01:51', 'riverjjang', '2021-03-08 20:01:51', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000035, 'ET-0000', 'ET-0009', '용사감지기', '2021-03-08 20:02:07', 'riverjjang', '2021-03-08 20:02:07', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000036, 'ET-0000', 'ET-0010', '유량계', '2021-03-08 20:02:27', 'riverjjang', '2021-03-08 20:02:27', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000037, 'ET-0000', 'ET-0011', '전력량계', '2021-03-08 20:02:47', 'riverjjang', '2021-03-08 20:02:47', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000038, 'ET-0000', 'ET-0012', 'PLC', '2021-03-08 20:03:04', 'riverjjang', '2021-03-08 20:03:04', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000039, 'ET-0000', 'ET-0013', 'UPS', '2021-03-08 20:03:22', 'riverjjang', '2021-03-08 20:03:22', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000040, 'ET-0000', 'ET-00XX', '카운터계', '2021-03-08 20:03:44', 'riverjjang', '2021-03-08 20:03:44', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000041, 'ROOT', 'WC-0000', '구역코드', '2021-03-08 20:12:27', 'riverjjang', '2021-03-08 20:12:27', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000042, 'WC-0000', 'WC-0001', '상수도', '2021-03-08 20:12:44', 'riverjjang', '2021-03-08 20:12:44', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000043, 'WC-0000', 'WC-0003', '용사실', '2021-03-08 20:13:18', 'riverjjang', '2021-03-08 20:13:18', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000044, 'WC-0000', 'WC-0004', 'SCRUBBER실', '2021-03-08 20:13:37', 'riverjjang', '2021-03-08 20:13:37', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000045, 'WC-0000', 'WC-0006', '약액저장실', '2021-03-08 20:14:19', 'riverjjang', '2021-03-08 20:14:19', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000046, 'WC-0000', 'WC-0007', '위탁탱크실', '2021-03-08 20:16:06', 'riverjjang', '2021-03-08 20:16:06', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000047, 'WC-0000', 'WC-0009', 'UPS실', '2021-03-08 20:16:36', 'riverjjang', '2021-03-08 20:16:36', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000048, 'WC-0000', 'WC-0010', '순수제조실', '2021-03-08 20:16:49', 'riverjjang', '2021-03-08 20:16:49', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000049, 'WC-0000', 'WC-0002', 'Blast실', '2021-03-08 20:13:02', 'riverjjang', '2021-03-08 20:13:02', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000050, 'WC-0000', 'WC-0005', '폐수처리장', '2021-03-08 20:14:01', 'riverjjang', '2021-03-08 20:14:01', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000051, 'ROOT', 'CV-0000', '차트버전', '2021-08-31 13:42:11', 'riverjjang', '2021-08-31 13:42:11', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000052, 'CV-0000', 'v1.0', 'Chart Version 1', '2021-08-31 13:46:09', 'riverjjang', '2021-08-31 13:46:09', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000053, 'CV-0000', 'v2.0', 'Chart Version 2', '2021-08-31 13:46:23', 'riverjjang', '2021-08-31 13:46:23', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000054, 'CV-0000', 'v3.0', 'Chart Version 3', '2021-08-31 13:46:45', 'riverjjang', '2021-08-31 13:46:45', 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000064, 'ROOT', 'WF000', '아이콘', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000065, 'WF000', 'fa fa-glass', 'Glass', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000066, 'WF000', 'fa fa-home', 'Home', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000067, 'WF000', 'fa fa-sliders', 'Sliders', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000068, 'WF000', 'fa fa-tasks', 'Tasks', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000069, 'WF000', 'fa fa-random', 'Random', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000070, 'WF000', 'fa fa-search', 'Search', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000071, 'WF000', 'fa fa-user', 'User', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000072, 'WF000', 'fa fa-dashboard', 'Dashboard', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000073, 'WF000', 'fa fa-cogs', 'Cogs', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000074, 'WF000', 'fa fa-cube', 'Cube', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000075, 'WF000', 'fa fa-file-text-o', 'File text', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000076, 'WF000', 'fa fa-bars', 'Bars', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000077, 'WF000', 'fa fa-users', 'Users', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000078, 'WF000', 'fa fa-book', 'Book', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000079, 'WF000', 'fa fa-briefcase', 'Briefcase', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000080, 'WF000', 'fa fa-bar-chart-o', 'Bar chart', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
INSERT INTO `n_code` VALUES (00000000081, 'WF000', 'fa fa-bolt', 'Bolt', NULL, 'riverjjang', NULL, 'riverjjang', 'Y');
COMMIT;

-- ----------------------------
-- Table structure for n_dashboard_show
-- ----------------------------
DROP TABLE IF EXISTS `n_dashboard_show`;
CREATE TABLE "n_dashboard_show" (
  "seq" int(11) NOT NULL AUTO_INCREMENT,
  "user_id" varchar(100) NOT NULL,
  "app_nm" varchar(100) NOT NULL,
  "interval_time" int(11) DEFAULT NULL,
  "create_user" varchar(100) DEFAULT NULL,
  "create_date" datetime DEFAULT NULL,
  "update_user" varchar(100) DEFAULT NULL,
  "update_date" datetime DEFAULT NULL,
  "use_yn" char(1) DEFAULT NULL,
  PRIMARY KEY ("seq") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_dashboard_show_d
-- ----------------------------
DROP TABLE IF EXISTS `n_dashboard_show_d`;
CREATE TABLE "n_dashboard_show_d" (
  "seq" int(11) NOT NULL AUTO_INCREMENT,
  "p_seq" int(11) NOT NULL,
  "dashboard_nm" varchar(200) NOT NULL,
  "dashboard_order" int(11) DEFAULT NULL,
  "create_user" varchar(100) DEFAULT NULL,
  "create_date" datetime DEFAULT NULL,
  "update_user" varchar(100) DEFAULT NULL,
  "update_date" datetime DEFAULT NULL,
  "use_yn" char(1) DEFAULT NULL,
  "dashboard_url" varchar(200) DEFAULT NULL,
  PRIMARY KEY ("seq") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_data_spec
-- ----------------------------
DROP TABLE IF EXISTS `n_data_spec`;
CREATE TABLE "n_data_spec" (
  "seq" int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  "dm_code" varchar(35) DEFAULT NULL,
  "e_code" varchar(20) NOT NULL,
  "m_code" varchar(5) NOT NULL,
  "d_code" varchar(20) NOT NULL,
  "rev" int(11) DEFAULT 0,
  "std" varchar(100) DEFAULT NULL,
  "w_utol" varchar(100) DEFAULT NULL,
  "w_ltol" varchar(100) DEFAULT NULL,
  "c_utol" varchar(100) DEFAULT NULL,
  "c_ltol" varchar(100) DEFAULT NULL,
  "create_user" varchar(100) DEFAULT NULL,
  "create_time" timestamp NULL DEFAULT current_timestamp(),
  "update_user" varchar(100) DEFAULT NULL,
  "update_time" timestamp NULL DEFAULT current_timestamp(),
  "use_yn" char(1) DEFAULT 'Y',
  PRIMARY KEY ("seq","e_code","m_code","d_code") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_data_spec_history
-- ----------------------------
DROP TABLE IF EXISTS `n_data_spec_history`;
CREATE TABLE "n_data_spec_history" (
  "seq" int(11) NOT NULL AUTO_INCREMENT,
  "mseq" int(11) NOT NULL,
  "e_code" varchar(20) NOT NULL,
  "m_code" varchar(5) NOT NULL,
  "d_code" varchar(20) NOT NULL,
  "std" varchar(100) DEFAULT NULL,
  "w_utol" varchar(100) DEFAULT NULL,
  "w_ltol" varchar(100) DEFAULT NULL,
  "c_utol" varchar(100) DEFAULT NULL,
  "c_ltol" varchar(100) DEFAULT NULL,
  "std_old" varchar(100) DEFAULT NULL,
  "w_utol_old" varchar(100) DEFAULT NULL,
  "w_ltol_old" varchar(100) DEFAULT NULL,
  "c_utol_old" varchar(100) DEFAULT NULL,
  "c_ltol_old" varchar(100) DEFAULT NULL,
  "comment" text DEFAULT NULL,
  "create_user" varchar(100) DEFAULT NULL,
  "create_time" timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("seq","mseq","e_code","m_code","d_code") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_dia_d
-- ----------------------------
DROP TABLE IF EXISTS `n_dia_d`;
CREATE TABLE "n_dia_d" (
  "d_seq" int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  "d_code" varchar(20) NOT NULL,
  "d_name" varchar(100) NOT NULL,
  "d_type" varchar(10) NOT NULL,
  "m_code" varchar(5) NOT NULL,
  "create_user" varchar(100) DEFAULT NULL,
  "create_time" timestamp NULL DEFAULT current_timestamp(),
  "update_user" varchar(100) DEFAULT NULL,
  "update_time" timestamp NULL DEFAULT current_timestamp(),
  "use_yn" char(1) DEFAULT 'Y',
  PRIMARY KEY ("d_seq","d_code","d_name","d_type","m_code") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_dia_m
-- ----------------------------
DROP TABLE IF EXISTS `n_dia_m`;
CREATE TABLE "n_dia_m" (
  "m_code" varchar(5) NOT NULL,
  "m_name" varchar(100) NOT NULL,
  "m_category" varchar(10) NOT NULL,
  "create_user" varchar(100) DEFAULT NULL,
  "create_time" timestamp NULL DEFAULT current_timestamp(),
  "update_user" varchar(100) DEFAULT NULL,
  "update_time" timestamp NULL DEFAULT current_timestamp(),
  "use_yn" char(1) DEFAULT 'Y',
  PRIMARY KEY ("m_code","m_category") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_equip
-- ----------------------------
DROP TABLE IF EXISTS `n_equip`;
CREATE TABLE "n_equip" (
  "e_code" varchar(20) NOT NULL COMMENT '설비코드',
  "e_name" varchar(100) NOT NULL,
  "f_code" varchar(100) DEFAULT NULL,
  "w_code" varchar(100) DEFAULT NULL,
  "l_code" varchar(100) DEFAULT NULL,
  "e_type" varchar(50) NOT NULL,
  "e_number" varchar(100) DEFAULT NULL,
  "interval" int(11) DEFAULT NULL,
  "create_user" varchar(100) DEFAULT NULL,
  "create_time" timestamp NULL DEFAULT current_timestamp(),
  "update_user" varchar(100) DEFAULT NULL,
  "update_time" timestamp NULL DEFAULT current_timestamp(),
  "use_yn" char(1) DEFAULT 'Y',
  PRIMARY KEY ("e_code","e_name","e_type") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_equip_dia
-- ----------------------------
DROP TABLE IF EXISTS `n_equip_dia`;
CREATE TABLE "n_equip_dia" (
  "seq" int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  "e_code" varchar(40) NOT NULL COMMENT '설비코드',
  "m_code" varchar(5) NOT NULL COMMENT '항목코드',
  "d_code" varchar(20) NOT NULL COMMENT '세부항목코드',
  "type" varchar(10) NOT NULL COMMENT '데이터타입(DIGITAL, ANALOG)',
  "category" varchar(10) NOT NULL COMMENT '구분(ETC,UTILITY)',
  "sub_category" varchar(10) DEFAULT NULL COMMENT '공정데이터(PROCESS), 아날로그(ANALOG), 디지털(DIGITAL)',
  "description" varchar(255) DEFAULT NULL COMMENT '설명',
  "unit" varchar(10) DEFAULT NULL COMMENT '단위',
  "alarm_cd" varchar(10) DEFAULT NULL COMMENT '알람코드',
  "alarm_yn" char(1) DEFAULT 'N' COMMENT '이메일알람 여부(Y,N)',
  "view_alarm_yn" char(1) DEFAULT 'N' COMMENT '대시보드 알람 여부(Y,N)',
  "alarm_type_one" char(1) DEFAULT 'N' COMMENT '단발성알람사용여부',
  "alarm_type_case" char(1) DEFAULT 'N' COMMENT '조건부알람사용여부',
  "spec_type" varchar(10) DEFAULT NULL,
  "alarm_type" varchar(10) DEFAULT NULL COMMENT '알람타입',
  "alarm_std_time" int(11) DEFAULT NULL COMMENT '알람발생기준시간',
  "alarm_std_cnt" int(11) DEFAULT NULL COMMENT '알람발생횟수',
  "alarm_warning_std_time" int(11) DEFAULT NULL COMMENT '주의단계 기준 시간',
  "alarm_warning_std_cnt" int(11) DEFAULT NULL COMMENT '주의단계 기준 횟수',
  "alarm_critical_std_cnt" int(11) DEFAULT NULL COMMENT '심각단계 기준 횟수',
  "alarm_critical_std_time" int(11) DEFAULT NULL COMMENT '심각단계 기준 시간',
  "create_user" varchar(100) DEFAULT NULL COMMENT '생성자',
  "create_time" timestamp NULL DEFAULT current_timestamp() COMMENT '생성시간',
  "update_user" varchar(100) DEFAULT NULL COMMENT '수정자',
  "update_time" timestamp NULL DEFAULT current_timestamp() COMMENT '수정시간',
  "use_yn" char(1) DEFAULT 'Y' COMMENT '사용여부',
  PRIMARY KEY ("seq","e_code","m_code","d_code") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_ext_user
-- ----------------------------
DROP TABLE IF EXISTS `n_ext_user`;
CREATE TABLE "n_ext_user" (
  "eu_pk_id" varchar(50) NOT NULL,
  "eu_name" varchar(100) NOT NULL,
  "eu_level_id" int(11) NOT NULL,
  "eu_email" varchar(100) DEFAULT NULL,
  "insert_user" varchar(100) NOT NULL,
  "insert_date" datetime NOT NULL,
  "update_user" varchar(100) NOT NULL,
  "update_date" datetime NOT NULL,
  "is_active" char(1) NOT NULL,
  "team_cd" varchar(50) DEFAULT NULL,
  "team_nm" varchar(100) DEFAULT NULL,
  "dept_cd" varchar(50) DEFAULT NULL,
  "dept_nm" varchar(100) DEFAULT NULL,
  PRIMARY KEY ("eu_pk_id") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for n_level
-- ----------------------------
DROP TABLE IF EXISTS `n_level`;
CREATE TABLE "n_level" (
  "level_id" varchar(100) NOT NULL,
  "level_name" varchar(100) DEFAULT NULL,
  "level_function" text DEFAULT NULL,
  "main_url" varchar(255) DEFAULT NULL,
  "insert_user" varchar(100) DEFAULT NULL,
  "insert_date" timestamp NOT NULL DEFAULT current_timestamp(),
  "update_user" varchar(100) DEFAULT NULL,
  "update_date" timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY ("level_id") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of n_level
-- ----------------------------
BEGIN;
INSERT INTO `n_level` VALUES ('1', 'Super Admin', 'nexpom,datasource,scenario,dashboard,menu,user,level,external_user,app,system,restapi,license,job,management,equip_management,spec_management,spec_history_management,alarm_management,alarm_cate_management,code_management,schedule_management,equip_life_management,equip_life_history_management,email,maintenance_management,case_alarm_search,email_history,fault_request,prevent_request,prd_info_management,email,analysis,dashboard_show,organization', NULL, 'riverjjang', '2021-04-26 15:37:42', 'riverjjang', '2021-04-26 15:37:42');
INSERT INTO `n_level` VALUES ('2', 'Admin', 'nexpom,datasource,scenario,dashboard,menu,user,app,system,job,dashboard_show,management,equip_management,spec_management,spec_history_management,alarm_management', NULL, 'riverjjang', '2021-04-26 16:03:13', 'riverjjang', '2021-04-26 16:03:13');
INSERT INTO `n_level` VALUES ('3', 'User', NULL, NULL, 'riverjjang', '2021-04-26 16:05:31', 'riverjjang', '2021-04-26 16:05:31');
COMMIT;

-- ----------------------------
-- Table structure for n_user
-- ----------------------------
DROP TABLE IF EXISTS `n_user`;
CREATE TABLE "n_user" (
  "user_id" varchar(100) NOT NULL,
  "user_name" varchar(100) DEFAULT NULL,
  "user_pass" varchar(255) DEFAULT NULL,
  "level_id" varchar(100) NOT NULL,
  "email" varchar(255) DEFAULT NULL,
  "emp_no" varchar(200) DEFAULT NULL,
  "insert_user" varchar(100) DEFAULT NULL,
  "insert_date" timestamp NULL DEFAULT current_timestamp(),
  "update_user" varchar(100) DEFAULT NULL,
  "update_date" timestamp NULL DEFAULT current_timestamp(),
  "is_active" char(1) DEFAULT 'Y',
  PRIMARY KEY ("user_id","level_id") USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of n_user
-- ----------------------------
BEGIN;
INSERT INTO `n_user` VALUES ('admin', 'Admin', 'e72DEq23LRLBD/Semr61JA9BKbW3/h/aHAUiN2GacRI=', '2', '', NULL, 'riverjjang', '2021-04-26 16:09:17', 'riverjjang', '2021-04-26 16:09:17', 'Y');
INSERT INTO `n_user` VALUES ('riverjjang', '김강산', 'XZ4kab/yOg4GBgDrWY32ZatTECsBJt5p9T4as9Vlhd4=', '1', NULL, NULL, 'riverjjang', '2021-04-26 16:07:50', 'riverjjang', '2021-04-26 16:07:53', 'Y');
INSERT INTO `n_user` VALUES ('super', 'Super Admin', 'flUQm34eCAyQed6N9cwHLL1Ebvx+nccvwExND6zS2NQ=', '1', NULL, NULL, 'riverjjang', '2021-04-26 16:07:48', 'riverjjang', '2021-04-26 16:07:51', 'Y');
INSERT INTO `n_user` VALUES ('user', 'User', 'gxwjeSjmISvtqkRRpRSs4xdFYvZ2H2oVei/lCCs24vs=', '3', '', NULL, 'super', '2021-09-28 05:13:37', 'super', '2021-09-28 05:13:37', 'Y');
COMMIT;

-- ----------------------------
-- Procedure structure for summary_caption_cnt
-- ----------------------------
DROP PROCEDURE IF EXISTS `summary_caption_cnt`;
delimiter ;;
CREATE PROCEDURE `nexpom_edu`.`summary_caption_cnt`()
BEGIN
	
	INSERT INTO summary_caption_cnt (Factory,`date`,Worker_id,Worker,Count)
	SELECT
	B.factory_seq_fk AS Factory,
	DATE_FORMAT(A.created_at,'%Y-%m-%d') AS date,
	B.reg_id  AS Worker_id,
	B.reg_name  AS Worker,
	COUNT(*) AS Count
	FROM lsf_wash_caption A
	INNER JOIN lsf_wash_check_info B ON A.check_seq_fk  = B.check_seq
	INNER JOIN lsf_wash_process_info C ON B.check_seq  = C.check_seq_fk AND A.barcode_no  = C.process_barcode 
	INNER JOIN lsf_wash_process_item D ON C.process_barcode  = D.process_barcode  AND C.process_seq  = D.lsf_wash_process_info_id
	WHERE  DATE_FORMAT(A.created_at,'%Y-%m-%d') = DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 DAY), '%Y-%m-%d')
	GROUP BY  Factory, date, Worker_id, Worker;
	
END
;;
delimiter ;

-- ----------------------------
-- Event structure for Summary_caption_cnt
-- ----------------------------
DROP EVENT IF EXISTS `Summary_caption_cnt`;
delimiter ;;
CREATE EVENT `nexpom_edu`.`Summary_caption_cnt`
ON SCHEDULE
EVERY '1' DAY STARTS '2021-09-19 00:00:00'
DO CALL summary_caption_cnt()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
