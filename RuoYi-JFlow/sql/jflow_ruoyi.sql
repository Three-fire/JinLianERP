/*
 Navicat Premium Data Transfer

 Source Server         : 81.69.38.157
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 81.69.38.157:3306
 Source Schema         : jflow_ruoyi

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 07/03/2023 17:49:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aa
-- ----------------------------
DROP TABLE IF EXISTS `aa`;
CREATE TABLE `aa`  (
  `OID` int(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aa
-- ----------------------------
INSERT INTO `aa` VALUES (100);

-- ----------------------------
-- Table structure for frm_ctrlmodel
-- ----------------------------
DROP TABLE IF EXISTS `frm_ctrlmodel`;
CREATE TABLE `frm_ctrlmodel`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FrmID` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `CtrlObj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制权限',
  `IsEnableAll` int(0) NULL DEFAULT NULL COMMENT '任何人都可以',
  `IsEnableStation` int(0) NULL DEFAULT NULL COMMENT '按照岗位计算',
  `IsEnableDept` int(0) NULL DEFAULT NULL COMMENT '按照绑定的部门计算',
  `IsEnableUser` int(0) NULL DEFAULT NULL COMMENT '按照绑定的人员计算',
  `IsEnableMyDept` int(0) NULL DEFAULT NULL COMMENT '按照本部门计算',
  `IDOfUsers` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的人员ID',
  `IDOfStations` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的岗位ID',
  `IDOfDepts` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的部门ID',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '控制模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_ctrlmodel
-- ----------------------------

-- ----------------------------
-- Table structure for frm_ctrlmodeldtl
-- ----------------------------
DROP TABLE IF EXISTS `frm_ctrlmodeldtl`;
CREATE TABLE `frm_ctrlmodeldtl`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FrmID` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `CtrlObj` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制权限',
  `OrgType` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织类型',
  `IDs` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IDs',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '控制模型表Dtl' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_ctrlmodeldtl
-- ----------------------------

-- ----------------------------
-- Table structure for frm_deptcreate
-- ----------------------------
DROP TABLE IF EXISTS `frm_deptcreate`;
CREATE TABLE `frm_deptcreate`  (
  `FrmID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单 - 主键',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可以创建部门,主外键:对应物理表:Port_Dept,表描述:部门',
  PRIMARY KEY (`FrmID`, `FK_Dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_deptcreate
-- ----------------------------

-- ----------------------------
-- Table structure for frm_dictflow
-- ----------------------------
DROP TABLE IF EXISTS `frm_dictflow`;
CREATE TABLE `frm_dictflow`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FrmID` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `FlowNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `Label` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能标签',
  `IsShowListRight` int(0) NULL DEFAULT NULL COMMENT '是否显示在列表右边',
  `Idx` int(0) NULL DEFAULT NULL COMMENT 'Idx',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '台账子流程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_dictflow
-- ----------------------------

-- ----------------------------
-- Table structure for frm_empcreate
-- ----------------------------
DROP TABLE IF EXISTS `frm_empcreate`;
CREATE TABLE `frm_empcreate`  (
  `FrmID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单 - 主键',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人员,主外键:对应物理表:Port_Emp,表描述:用户',
  PRIMARY KEY (`FrmID`, `FK_Emp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据可创建的人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_empcreate
-- ----------------------------

-- ----------------------------
-- Table structure for frm_generbill
-- ----------------------------
DROP TABLE IF EXISTS `frm_generbill`;
CREATE TABLE `frm_generbill`  (
  `WorkID` int(0) NOT NULL COMMENT 'WorkID - 主键',
  `FK_FrmTree` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据类别',
  `FrmID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据ID',
  `FrmName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据名称',
  `BillNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据编号',
  `Title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `BillSta` int(0) NULL DEFAULT NULL COMMENT '状态(简),枚举类型:0 运行中;1 已完成;2 其他;',
  `BillState` int(0) NULL DEFAULT NULL COMMENT '单据状态,枚举类型:0 空白;1 草稿;2 编辑中;100 归档;',
  `Starter` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `StarterName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人名称',
  `Sender` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期',
  `SendDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据活动时间',
  `NDStep` int(0) NULL DEFAULT NULL COMMENT '步骤',
  `NDStepName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '步骤名称',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `DeptName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `PRI` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `SDTOfNode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点应完成时间',
  `SDTOfFlow` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据应完成时间',
  `PFrmID` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父单据编号',
  `PWorkID` int(0) NULL DEFAULT NULL COMMENT '父单据ID',
  `TSpan` int(0) NULL DEFAULT NULL COMMENT '时间段,枚举类型:0 本周;1 上周;2 上上周;3 更早;',
  `AtPara` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数(单据运行设置临时存储的参数)',
  `Emps` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参与人',
  `GUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `FK_NY` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年月',
  PRIMARY KEY (`WorkID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据控制表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_generbill
-- ----------------------------

-- ----------------------------
-- Table structure for frm_groupmethod
-- ----------------------------
DROP TABLE IF EXISTS `frm_groupmethod`;
CREATE TABLE `frm_groupmethod`  (
  `No` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `FrmID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `Name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `Icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Icon',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  `AtPara` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '方法分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_groupmethod
-- ----------------------------

-- ----------------------------
-- Table structure for frm_method
-- ----------------------------
DROP TABLE IF EXISTS `frm_method`;
CREATE TABLE `frm_method`  (
  `No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名',
  `FrmID` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `MethodID` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法ID',
  `WarningMsg` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能执行警告信息',
  `RefMethodType` int(0) NULL DEFAULT NULL COMMENT '方法类型,枚举类型:0 功能;1 模态窗口打开;2 新窗口打开;3 右侧窗口打开;4 实体集合的功能;',
  `IsMyBillToolBar` int(0) NULL DEFAULT NULL COMMENT '是否显示在MyBill.htm工具栏上',
  `IsMyBillToolExt` int(0) NULL DEFAULT NULL COMMENT '是否显示在MyBill.htm工具栏右边的更多按钮里',
  `IsSearchBar` int(0) NULL DEFAULT NULL COMMENT '是否显示在Search.htm工具栏上(用于批处理)',
  `IsList` int(0) NULL DEFAULT NULL COMMENT '是否显示在列表?',
  `PopHeight` int(0) NULL DEFAULT NULL COMMENT '弹窗高度',
  `PopWidth` int(0) NULL DEFAULT NULL COMMENT '弹窗宽度',
  `MsgSuccess` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成功提示信息',
  `MsgErr` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败提示信息',
  `WhatAreYouTodo` int(0) NULL DEFAULT NULL COMMENT '执行完毕后干啥？,枚举类型:0 关闭提示窗口;1 关闭提示窗口并刷新;2 转入到Search.htm页面上去;',
  `Idx` int(0) NULL DEFAULT NULL COMMENT 'Idx',
  `MethodName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名',
  `ShowModel` int(0) NULL DEFAULT 0 COMMENT '显示方式',
  `MethodDocTypeOfFunc` int(0) NULL DEFAULT 0 COMMENT '内容类型',
  `MethodDoc_Url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单方法' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_method
-- ----------------------------

-- ----------------------------
-- Table structure for frm_stationcreate
-- ----------------------------
DROP TABLE IF EXISTS `frm_stationcreate`;
CREATE TABLE `frm_stationcreate`  (
  `FrmID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单 - 主键',
  `FK_Station` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可以创建岗位,主外键:对应物理表:Port_Station,表描述:岗位',
  PRIMARY KEY (`FrmID`, `FK_Station`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_stationcreate
-- ----------------------------

-- ----------------------------
-- Table structure for frm_stationdept
-- ----------------------------
DROP TABLE IF EXISTS `frm_stationdept`;
CREATE TABLE `frm_stationdept`  (
  `FK_Frm` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单据编号 - 主键',
  `FK_Station` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作岗位,主外键:对应物理表:Port_Station,表描述:岗位',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门,主外键:对应物理表:Port_Dept,表描述:部门',
  PRIMARY KEY (`FK_Frm`, `FK_Station`, `FK_Dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据岗位部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_stationdept
-- ----------------------------

-- ----------------------------
-- Table structure for frm_track
-- ----------------------------
DROP TABLE IF EXISTS `frm_track`;
CREATE TABLE `frm_track`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FrmID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `FrmName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单名称(可以为空)',
  `ActionType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `ActionTypeText` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(名称)',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT '工作ID/OID',
  `Msg` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息',
  `Rec` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录人',
  `RecName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期时间',
  `DeptNo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `DeptName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FID` int(0) NULL DEFAULT NULL COMMENT 'FID',
  `FlowNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程ID',
  `FlowName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `NodeID` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `NodeName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'AtPara',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单轨迹表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frm_track
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_app
-- ----------------------------
DROP TABLE IF EXISTS `gpm_app`;
CREATE TABLE `gpm_app`  (
  `No` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `AppModel` int(0) NULL DEFAULT NULL COMMENT '应用类型,枚举类型:0 BS系统;1 CS系统;',
  `Name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '名称',
  `FK_AppSort` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别,外键:对应物理表:GPM_AppSort,表描述:系统类别',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '启用?',
  `UrlExt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '默认连接',
  `SubUrl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '第二连接',
  `UidControl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名控件',
  `PwdControl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码控件',
  `ActionType` int(0) NULL DEFAULT NULL COMMENT '提交类型,枚举类型:0 GET;1 POST;',
  `SSOType` int(0) NULL DEFAULT NULL COMMENT '登录方式,枚举类型:0 SID验证;1 连接;2 表单提交;3 不传值;',
  `OpenWay` int(0) NULL DEFAULT NULL COMMENT '打开方式,枚举类型:0 新窗口;1 本窗口;2 覆盖新窗口;',
  `RefMenuNo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联菜单编号',
  `AppRemark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  `MyFileName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ICON',
  `MyFilePath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFilePath',
  `MyFileExt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFileExt',
  `WebPath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'WebPath',
  `MyFileH` int(0) NULL DEFAULT NULL COMMENT 'MyFileH',
  `MyFileW` int(0) NULL DEFAULT NULL COMMENT 'MyFileW',
  `MyFileSize` float NULL DEFAULT NULL COMMENT 'MyFileSize',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_app
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_appsort
-- ----------------------------
DROP TABLE IF EXISTS `gpm_appsort`;
CREATE TABLE `gpm_appsort`  (
  `No` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  `RefMenuNo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的菜单编号',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_appsort
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_bar
-- ----------------------------
DROP TABLE IF EXISTS `gpm_bar`;
CREATE TABLE `gpm_bar`  (
  `No` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '名称',
  `Title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题',
  `OpenWay` int(0) NULL DEFAULT NULL COMMENT '打开方式,枚举类型:0 新窗口;1 本窗口;2 覆盖新窗口;',
  `IsLine` int(0) NULL DEFAULT NULL COMMENT '是否独占一行',
  `MoreUrl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '更多标签Url',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_bar
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_baremp
-- ----------------------------
DROP TABLE IF EXISTS `gpm_baremp`;
CREATE TABLE `gpm_baremp`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Bar` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息块编号',
  `FK_Emp` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `Title` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标题',
  `IsShow` int(0) NULL DEFAULT NULL COMMENT '是否显示',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人员信息块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_baremp
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_deptmenu
-- ----------------------------
DROP TABLE IF EXISTS `gpm_deptmenu`;
CREATE TABLE `gpm_deptmenu`  (
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 部门,主外键:对应物理表:Port_Station,表描述:岗位',
  `FK_Menu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单 - 主键',
  `IsChecked` int(0) NULL DEFAULT NULL COMMENT '是否选中',
  PRIMARY KEY (`FK_Dept`, `FK_Menu`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_deptmenu
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_empapp
-- ----------------------------
DROP TABLE IF EXISTS `gpm_empapp`;
CREATE TABLE `gpm_empapp`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Emp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `FK_App` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统',
  `Name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '系统-名称',
  `UrlExt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '连接',
  `MyFileName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `MyFilePath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFilePath',
  `MyFileExt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFileExt',
  `WebPath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'WebPath',
  `MyFileH` int(0) NULL DEFAULT NULL COMMENT 'MyFileH',
  `MyFileW` int(0) NULL DEFAULT NULL COMMENT 'MyFileW',
  `MyFileSize` float NULL DEFAULT NULL COMMENT 'MyFileSize',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员与系统权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_empapp
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_empmenu
-- ----------------------------
DROP TABLE IF EXISTS `gpm_empmenu`;
CREATE TABLE `gpm_empmenu`  (
  `FK_Menu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单 - 主键',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单功能,主外键:对应物理表:Port_Emp,表描述:用户',
  `FK_App` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `IsChecked` int(0) NULL DEFAULT NULL COMMENT '是否选中',
  PRIMARY KEY (`FK_Menu`, `FK_Emp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人员菜单对应' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_empmenu
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_group
-- ----------------------------
DROP TABLE IF EXISTS `gpm_group`;
CREATE TABLE `gpm_group`  (
  `No` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_group
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_groupdept
-- ----------------------------
DROP TABLE IF EXISTS `gpm_groupdept`;
CREATE TABLE `gpm_groupdept`  (
  `FK_Group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组 - 主键',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门,主外键:对应物理表:Port_Dept,表描述:部门',
  PRIMARY KEY (`FK_Group`, `FK_Dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_groupdept
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_groupemp
-- ----------------------------
DROP TABLE IF EXISTS `gpm_groupemp`;
CREATE TABLE `gpm_groupemp`  (
  `FK_Group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组 - 主键',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人员,主外键:对应物理表:Port_Emp,表描述:用户',
  PRIMARY KEY (`FK_Group`, `FK_Emp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_groupemp
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_groupmenu
-- ----------------------------
DROP TABLE IF EXISTS `gpm_groupmenu`;
CREATE TABLE `gpm_groupmenu`  (
  `FK_Group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组 - 主键',
  `FK_Menu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单 - 主键',
  `IsChecked` int(0) NULL DEFAULT NULL COMMENT '是否选中',
  PRIMARY KEY (`FK_Group`, `FK_Menu`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_groupmenu
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_groupstation
-- ----------------------------
DROP TABLE IF EXISTS `gpm_groupstation`;
CREATE TABLE `gpm_groupstation`  (
  `FK_Group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限组 - 主键',
  `FK_Station` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位,主外键:对应物理表:Port_Station,表描述:岗位',
  PRIMARY KEY (`FK_Group`, `FK_Station`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限组岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_groupstation
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_grouptype
-- ----------------------------
DROP TABLE IF EXISTS `gpm_grouptype`;
CREATE TABLE `gpm_grouptype`  (
  `No` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_grouptype
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_menu
-- ----------------------------
DROP TABLE IF EXISTS `gpm_menu`;
CREATE TABLE `gpm_menu`  (
  `No` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `ParentNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点,外键:对应物理表:GPM_Menu,表描述:系统菜单',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  `MenuType` int(0) NULL DEFAULT NULL COMMENT '菜单类型,枚举类型:0 系统根目录;1 系统类别;2 系统;3 目录;4 功能/界面;5 功能控制点;',
  `FK_App` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统,外键:对应物理表:GPM_App,表描述:系统',
  `OpenWay` int(0) NULL DEFAULT NULL COMMENT '打开方式,枚举类型:0 新窗口;1 本窗口;2 覆盖新窗口;',
  `UrlExt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'PC端连接',
  `MobileUrlExt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端连接',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用?',
  `Icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Icon',
  `MenuCtrlWay` int(0) NULL DEFAULT NULL COMMENT '控制方式,枚举类型:0 按照设置的控制;1 任何人都可以使用;2 Admin用户可以使用;',
  `Flag` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标记',
  `Tag1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag1',
  `Tag2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag2',
  `Tag3` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag3',
  `WebPath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `MyFileName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `MyFilePath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFilePath',
  `MyFileExt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFileExt',
  `MyFileH` int(0) NULL DEFAULT NULL COMMENT 'MyFileH',
  `MyFileW` int(0) NULL DEFAULT NULL COMMENT 'MyFileW',
  `MyFileSize` float NULL DEFAULT NULL COMMENT 'MyFileSize',
  `MenuModel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单模式',
  `Mark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标记',
  `FrmID` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FrmID',
  `FlowNo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FlowNo',
  `SystemNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SystemNo',
  `ModuleNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属模块编号',
  `ModuleNoText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属模块编号',
  `ListModel` int(0) NULL DEFAULT NULL COMMENT '列表模式,枚举类型:0 编辑模式;1 视图模式;',
  `WorkType` int(0) NULL DEFAULT NULL COMMENT '工作类型',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_menu
-- ----------------------------
INSERT INTO `gpm_menu` VALUES ('1101', NULL, '最近发起', 0, NULL, NULL, 1, '../StartEarlyer.htm', '', 1, 'icon-share-alt', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowGener', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1102', NULL, '发起', 0, NULL, NULL, 1, '../Start.htm', '', 1, 'icon-paper-plane', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowGener', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1103', NULL, '待办', 0, NULL, NULL, 1, '../Todolist.htm', '', 1, 'icon-bell', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowGener', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1104', NULL, '在途', 0, NULL, NULL, 1, '../RuningDataGrid.htm?IsContainFuture=1', '', 1, 'icon-clock', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowGener', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1105', NULL, '已完成', 0, NULL, NULL, 1, '../Complete.htm', '', 1, 'fa-hourglass-end', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowGener', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1106', NULL, '批处理', 0, NULL, NULL, 1, '../Batch.htm', '', 1, 'icon-layers', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowGener', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1107', NULL, '抄送', 0, NULL, NULL, 1, '../CC.htm', '', 1, 'icon-people', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowGener', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1108', NULL, '我的草稿', 0, NULL, NULL, 1, '../Draft.htm', '', 1, 'icon-note', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowGener', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1201', NULL, '监控', 0, NULL, NULL, 1, '../Watchdog.htm?EnsName=BP.WF.Data.MyStartFlows', '', 1, 'icon-target', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1202', NULL, '我发起的', 0, NULL, NULL, 1, '../Comm/Search.htm?EnsName=BP.WF.Data.MyStartFlows', '', 1, 'icon-flag', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1203', NULL, '我审批的', 0, NULL, NULL, 1, '../Comm/Search.htm?EnsName=BP.WF.Data.MyJoinFlows', '', 1, 'icon-user-following', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1204', NULL, '我的流程分布', 0, NULL, NULL, 1, '../RptSearch/DistributedOfMy.htm', '', 1, 'icon-calendar', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1205', NULL, '我的流程', 0, NULL, NULL, 1, '../SearchDataGrid.htm', '', 1, 'icon-speech', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1206', NULL, '单流程查询', 0, NULL, NULL, 1, '../RptDfine/Flowlist.htm', '', 1, 'icon-magnifier', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1207', NULL, '综合查询', 0, NULL, NULL, 1, '../RptSearch/Default.htm', '', 1, 'icon-magnifier', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1208', NULL, '流程监控', 0, NULL, NULL, 1, '../Watchdog.htm', '', 1, 'icon-magnifier', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1209', NULL, '逾期流程', 0, NULL, NULL, 1, '../Comm/Search.htm?EnsName=BP.WF.Data.Delays', '', 1, 'icon-magnifier', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'Search', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1301', NULL, '会签主持人待办', 0, NULL, NULL, 1, '../HuiQianList.htm', '', 1, 'icon-organization', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'TodolistType', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1302', NULL, '加签人代办', 0, NULL, NULL, 1, '../HuiQianSAdderList.htm', '', 1, 'icon-organization', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'TodolistType', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1303', NULL, '协作待办', 0, NULL, NULL, 1, '../TeamupList.htm', '', 1, 'icon-organization', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'TodolistType', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1304', NULL, '授权待办', 0, NULL, NULL, 1, '../AuthorList.htm', '', 1, 'icon-briefcase', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'TodolistType', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1305', NULL, '工作委托2019', 0, NULL, NULL, 1, '../AuthorTodolist2019.htm', '', 1, 'icon-direction', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'TodolistType', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1307', NULL, '共享任务', 0, NULL, NULL, 1, '../TaskPoolSharing.htm', '', 1, 'icon-share', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'TodolistType', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1308', NULL, '申请下来的任务', 0, NULL, NULL, 1, '../TaskPoolApply.htm', '', 1, 'icon-folder-alt', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'TodolistType', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1309', NULL, '未来任务', 0, NULL, NULL, 1, '../FutureTodolist.htm', '', 1, 'icon-paper-plane', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'TodolistType', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1401', NULL, '共享任务', 0, NULL, NULL, 1, '../TaskPoolSharing.htm', '', 1, 'icon-share', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowAdv', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1402', NULL, '申请下来的任务', 0, NULL, NULL, 1, '../TaskPoolApply.htm', '', 1, 'icon-folder-alt', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowAdv', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1403', NULL, '我的关注', 0, NULL, NULL, 1, '../Focus.htm', '', 1, 'icon-star', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowAdv', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1404', NULL, '取回审批', 0, NULL, NULL, 1, '../GetTask.htm', '', 1, 'icon-logout', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowAdv', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1405', NULL, '挂起的工作', 0, NULL, NULL, 1, '../HungUpList.htm', '', 1, 'icon-loop', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowAdv', '', 0, 0);
INSERT INTO `gpm_menu` VALUES ('1406', NULL, '我的设置', 0, NULL, NULL, 1, '../Setting/Default.htm', '', 1, 'icon-settings', 1, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', 'AppFlow', 'FlowAdv', '', 0, 0);

-- ----------------------------
-- Table structure for gpm_module
-- ----------------------------
DROP TABLE IF EXISTS `gpm_module`;
CREATE TABLE `gpm_module`  (
  `No` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `SystemNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属系统,外键:对应物理表:GPM_System,表描述:系统',
  `Icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Icon',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  `WorkType` int(0) NULL DEFAULT NULL COMMENT '工作类型',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_module
-- ----------------------------
INSERT INTO `gpm_module` VALUES ('FlowAdv', '高级功能', 'AppFlow', 'fa-cubes', 0, 0);
INSERT INTO `gpm_module` VALUES ('FlowGener', '基础功能', 'AppFlow', 'fa-cubes', 0, 0);
INSERT INTO `gpm_module` VALUES ('Search', '流程查询', 'AppFlow', 'icon-magnifier', 0, 0);
INSERT INTO `gpm_module` VALUES ('TodolistType', '分类待办', 'AppFlow', 'fa-tasks', 0, 0);

-- ----------------------------
-- Table structure for gpm_persetting
-- ----------------------------
DROP TABLE IF EXISTS `gpm_persetting`;
CREATE TABLE `gpm_persetting`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Emp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员',
  `FK_App` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统',
  `UserNo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'UserNo',
  `UserPass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'UserPass',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_persetting
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_powercenter
-- ----------------------------
DROP TABLE IF EXISTS `gpm_powercenter`;
CREATE TABLE `gpm_powercenter`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `CtrlObj` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制对象(SystemMenus)',
  `CtrlPKVal` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制对象ID',
  `CtrlGroup` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属分组(可为空)',
  `CtrlModel` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控制模式',
  `IDs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主键s(Stas,Depts等)',
  `IDNames` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'IDNames',
  `OrgNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `Idx` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Idx',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_powercenter
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_stationmenu
-- ----------------------------
DROP TABLE IF EXISTS `gpm_stationmenu`;
CREATE TABLE `gpm_stationmenu`  (
  `FK_Station` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位,主外键:对应物理表:Port_Station,表描述:岗位',
  `FK_Menu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单 - 主键',
  `IsChecked` int(0) NULL DEFAULT NULL COMMENT '是否选中',
  PRIMARY KEY (`FK_Station`, `FK_Menu`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_stationmenu
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_system
-- ----------------------------
DROP TABLE IF EXISTS `gpm_system`;
CREATE TABLE `gpm_system`  (
  `No` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '启用?',
  `Icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_system
-- ----------------------------
INSERT INTO `gpm_system` VALUES ('AppFlow', '业务流程', 1, 'fa-certificate', 0);

-- ----------------------------
-- Table structure for gpm_window
-- ----------------------------
DROP TABLE IF EXISTS `gpm_window`;
CREATE TABLE `gpm_window`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `EmpNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户编号',
  `WindowTemplateNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板编号',
  `Docs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '是否可见?',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '排序',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_window
-- ----------------------------

-- ----------------------------
-- Table structure for gpm_windowtemplate
-- ----------------------------
DROP TABLE IF EXISTS `gpm_windowtemplate`;
CREATE TABLE `gpm_windowtemplate`  (
  `No` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `ColSpan` int(0) NULL DEFAULT NULL COMMENT '占的列数',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `WinDocModel` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容类型',
  `Icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Icon',
  `PageID` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '页面ID',
  `MoreLab` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更多标签',
  `MoreUrl` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更多链接',
  `MoreLinkModel` int(0) NULL DEFAULT NULL COMMENT '打开方式,枚举类型:0 新窗口;1 本窗口;2 覆盖新窗口;',
  `PopW` int(0) NULL DEFAULT NULL COMMENT 'Pop宽度',
  `PopH` int(0) NULL DEFAULT NULL COMMENT 'Pop高度',
  `WinDocType` int(0) NULL DEFAULT NULL COMMENT '内容类型,枚举类型:0 Html;1 系统内置;2 SQL列表;3 折线图;4 柱状图;5 饼图;',
  `Docs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SQL内容表达式',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '默认的排序',
  `IsDel` int(0) NULL DEFAULT NULL COMMENT '用户是否可删除',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '是否禁用?',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  `WindCtrlWay` int(0) NULL DEFAULT NULL COMMENT '控制方式,枚举类型:0 任何人都可以使用;1 按照设置的控制;2 Admin用户可以使用;',
  `LabOfFZ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分子标签',
  `SQLOfFZ` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分子表达式',
  `LabOfFM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分母标签',
  `SQLOfFM` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分子表达式',
  `LabOfRate` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '率标签',
  `DBType` int(0) NULL DEFAULT NULL COMMENT '数据源类型,枚举类型:0 数据库查询SQL;1 执行Url返回Json;2 执行DataUserJSLabWindows.js的函数.;',
  `DBSrc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源,外键:对应物理表:Sys_SFDBSrc,表描述:数据源',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Tab标签页' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_windowtemplate
-- ----------------------------
INSERT INTO `gpm_windowtemplate` VALUES ('4672d32be49b4f7680bd97ab286593ac', 4, '我的待办', 'ChartLine', '', 'Home', '', '', 1, 500, 400, 0, 'SELECT FK_NodeText AS FlowName, COUNT(WorkID) as Num  FROM WF_GenerWorkerlist WHERE FK_Emp = ~@WebUser.No~ AND IsPass=0 GROUP BY FK_NodeText ', 0, 1, 0, '', 0, '', '', '', '', '', NULL, NULL);
INSERT INTO `gpm_windowtemplate` VALUES ('7e0da81b0f1047fab6550ea55d48f25a', 1, '我的发起', 'ChartPie', '', 'Home', '', '', 1, 500, 400, 0, 'SELECT FlowName, COUNT(WorkID) AS Num  FROM WF_GenerWorkFlow WHERE WFState !=0 AND Starter=~@WebUser.No~  GROUP BY FlowName', 0, 1, 0, '', 0, '', '', '', '', '', NULL, NULL);
INSERT INTO `gpm_windowtemplate` VALUES ('916a4d18c3ac42cba53b2700b28599d3', 4, '月统计发起', 'ChartLine', '', 'Home', '', '', 1, 500, 400, 0, 'SELECT FK_NY AS FlowName, COUNT(WorkID) AS Num  FROM WF_GenerWorkFlow WHERE WFState !=0 GROUP BY FK_NY', 0, 1, 0, '', 0, '', '', '', '', '', NULL, NULL);
INSERT INTO `gpm_windowtemplate` VALUES ('b63c0408cc3e4be097ae74e1394a0c69', 2, '关于我们', 'Html', '', 'Home', '', '', 1, 500, 400, 0, '', 0, 1, 0, '', 0, '', '', '', '', '', NULL, NULL);
INSERT INTO `gpm_windowtemplate` VALUES ('ccba928182f14ba685514a06a557749a', 2, '我参与的', 'ChartPie', '', 'Home', '', '', 1, 500, 400, 0, 'SELECT FlowName, COUNT(WorkID) AS Num  FROM WF_GenerWorkFlow WHERE WFState !=0 AND Emps LIKE  ~%@WebUser.No,%~  GROUP BY FlowName', 0, 1, 0, '', 0, '', '', '', '', '', NULL, NULL);
INSERT INTO `gpm_windowtemplate` VALUES ('e6e1402c577a4532ae0b4b89420ccd24', 1, '登录信息', 'System', '', 'Home', '', '', 0, 500, 400, 0, '<table><tr> <td>帐号</td> <td>@WebUser.No</td></tr><tr> <td>姓名</td> <td>@WebUser.Name</td></tr><tr> <td>部门</td> <td>@WebUser.FK_DeptName</td></tr>', 0, 1, 0, '', 0, '', '', '', '', '', NULL, NULL);
INSERT INTO `gpm_windowtemplate` VALUES ('f7ba16999cb54fd290f5450d5fb2b99f', 4, '未完成', 'ChartLine', '', 'Home', '', '', 1, 500, 400, 0, 'SELECT FlowName, COUNT(WorkID) AS Num FROM WF_GenerWorkFlow  WHERE WFState = 2 and Emps like ~%@WebUser.No%~ GROUP BY FlowName', 0, 1, 0, '', 0, '', '', '', '', '', NULL, NULL);
INSERT INTO `gpm_windowtemplate` VALUES ('ff059021537e43df8addb59a4a6f498e', 2, '全部流程', 'ChartLine', '', 'Home', '', '', 1, 500, 400, 0, 'SELECT FlowName, COUNT(WorkID) AS Num  FROM WF_GenerWorkFlow WHERE WFState !=0 GROUP BY FlowName', 0, 1, 0, '', 0, '', '', '', '', '', NULL, NULL);

-- ----------------------------
-- Table structure for gpm_windowtemplatedtl
-- ----------------------------
DROP TABLE IF EXISTS `gpm_windowtemplatedtl`;
CREATE TABLE `gpm_windowtemplatedtl`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `FontColor` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字体风格',
  `Exp0` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表达式',
  `Exp1` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表达式1',
  `DBSrc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源,外键:对应物理表:Sys_SFDBSrc,表描述:数据源',
  `WindowsShowType` int(0) NULL DEFAULT NULL COMMENT '显示类型,枚举类型:0 饼图;1 柱图;2 折线图;4 简单Table;',
  `RefWindowTemplate` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'RefWindowTemplate',
  `DBType` int(0) NULL DEFAULT NULL COMMENT '数据源类型,枚举类型:0 数据库查询SQL;1 执行Url返回Json;2 执行DataUserJSLabWindows.js的函数.;',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Tab页数据项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gpm_windowtemplatedtl
-- ----------------------------

-- ----------------------------
-- Table structure for nd1rpt
-- ----------------------------
DROP TABLE IF EXISTS `nd1rpt`;
CREATE TABLE `nd1rpt`  (
  `BMJLSP_Note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `BMJLSP_Checker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `BMJLSP_RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核日期',
  `Title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `ShenQingRen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `ShenQingRiJi` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请日期',
  `ShenQingRenBuMen` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人部门',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `OID` int(0) NOT NULL,
  `FID` int(0) NULL DEFAULT 0 COMMENT 'FID',
  `CDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动时间',
  `Rec` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起人',
  `Emps` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参与者',
  `MyNum` int(0) NULL DEFAULT 1 COMMENT '个数',
  `QingJiaRiQiCong` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请假日期从',
  `Dao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到',
  `QingJiaTianShu` float NULL DEFAULT NULL COMMENT '请假天数',
  `QingJiaYuanYin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请假原因',
  `FlowStartRDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起时间',
  `FlowDaySpan` decimal(20, 4) NULL DEFAULT NULL COMMENT '跨度(天)',
  `PWorkID` int(0) NULL DEFAULT 0 COMMENT '父流程WorkID',
  `FlowEnderRDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `FlowEndNode` int(0) NULL DEFAULT 0 COMMENT '结束节点',
  `PNodeID` int(0) NULL DEFAULT 0 COMMENT '父流程启动的节点',
  `PrjName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `PrjNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目编号',
  `BillNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据编号',
  `FlowEmps` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与人',
  `GUID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
  `PEmp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调起子流程的人员',
  `PFlowNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FlowNote` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程信息',
  `FlowStarter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起人',
  `FlowEnder` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束人',
  `WFSta` int(0) NULL DEFAULT 0 COMMENT '状态',
  `WFState` int(0) NULL DEFAULT 0 COMMENT '流程状态',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员部门',
  `FK_NY` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年月',
  `ZJLSP_Note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `ZJLSP_Checker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `ZJLSP_RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核日期',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nd1rpt
-- ----------------------------
INSERT INTO `nd1rpt` VALUES ('', '', '', '研发部门-admin,若依在2022-01-04 22:59发起.', '若依', '2022-01-04', '研发部门', '2022-01-04', 100, 0, '2022-01-04', 'admin', '', 1, '', '', 10002, '', '2022-01-04 22:59', 0.0000, 0, '2022-01-04 22:59', 101, 0, '', '', '', '@admin,若依@', '', '', '', '', '', 'admin', 'admin', 2, 0, '103', '2022-01', '', '', '');

-- ----------------------------
-- Table structure for nd1track
-- ----------------------------
DROP TABLE IF EXISTS `nd1track`;
CREATE TABLE `nd1track`  (
  `MyPK` int(0) NOT NULL DEFAULT 0 COMMENT 'MyPK',
  `ActionType` int(0) NULL DEFAULT 0 COMMENT '类型',
  `ActionTypeText` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(名称)',
  `FID` int(0) NULL DEFAULT 0 COMMENT '流程ID',
  `WorkID` int(0) NULL DEFAULT 0 COMMENT '工作ID',
  `NDFrom` int(0) NULL DEFAULT 0 COMMENT '从节点',
  `NDFromT` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从节点(名称)',
  `NDTo` int(0) NULL DEFAULT 0 COMMENT '到节点',
  `NDToT` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到节点(名称)',
  `EmpFrom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从人员',
  `EmpFromT` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从人员(名称)',
  `EmpTo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到人员',
  `EmpToT` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到人员(名称)',
  `RDT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期',
  `WorkTimeSpan` float NULL DEFAULT NULL COMMENT '时间跨度(天)',
  `Msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息',
  `NodeData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '节点数据(日志信息)',
  `Tag` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `Exer` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行人',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nd1track
-- ----------------------------

-- ----------------------------
-- Table structure for port_org
-- ----------------------------
DROP TABLE IF EXISTS `port_org`;
CREATE TABLE `port_org`  (
  `No` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号(与部门编号相同) - 主键',
  `Name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织名称',
  `ParentNo` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级组织编号',
  `ParentName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级组织名称',
  `Adminer` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主要管理员(创始人)',
  `AdminerName` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '独立组织' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of port_org
-- ----------------------------

-- ----------------------------
-- Table structure for port_orgadminer
-- ----------------------------
DROP TABLE IF EXISTS `port_orgadminer`;
CREATE TABLE `port_orgadminer`  (
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组织 - 主键',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员,主外键:对应物理表:Port_Emp,表描述:用户',
  PRIMARY KEY (`OrgNo`, `FK_Emp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组织管理员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of port_orgadminer
-- ----------------------------

-- ----------------------------
-- Table structure for port_stationtype
-- ----------------------------
DROP TABLE IF EXISTS `port_stationtype`;
CREATE TABLE `port_stationtype`  (
  `No` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构编号',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of port_stationtype
-- ----------------------------
INSERT INTO `port_stationtype` VALUES ('1', '高层', 0, NULL);
INSERT INTO `port_stationtype` VALUES ('2', '中层', 0, NULL);
INSERT INTO `port_stationtype` VALUES ('3', '基层', 0, NULL);

-- ----------------------------
-- Table structure for port_team
-- ----------------------------
DROP TABLE IF EXISTS `port_team`;
CREATE TABLE `port_team`  (
  `No` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FK_TeamType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型,外键:对应物理表:Port_TeamType,表描述:用户组类型',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of port_team
-- ----------------------------

-- ----------------------------
-- Table structure for port_teamemp
-- ----------------------------
DROP TABLE IF EXISTS `port_teamemp`;
CREATE TABLE `port_teamemp`  (
  `FK_Team` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组 - 主键',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人员,主外键:对应物理表:Port_Emp,表描述:用户',
  PRIMARY KEY (`FK_Team`, `FK_Emp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of port_teamemp
-- ----------------------------

-- ----------------------------
-- Table structure for port_teamtype
-- ----------------------------
DROP TABLE IF EXISTS `port_teamtype`;
CREATE TABLE `port_teamtype`  (
  `No` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of port_teamtype
-- ----------------------------

-- ----------------------------
-- Table structure for pub_nd
-- ----------------------------
DROP TABLE IF EXISTS `pub_nd`;
CREATE TABLE `pub_nd`  (
  `No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '年度' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_nd
-- ----------------------------

-- ----------------------------
-- Table structure for pub_ny
-- ----------------------------
DROP TABLE IF EXISTS `pub_ny`;
CREATE TABLE `pub_ny`  (
  `No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '名称',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月份' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_ny
-- ----------------------------

-- ----------------------------
-- Table structure for pub_yf
-- ----------------------------
DROP TABLE IF EXISTS `pub_yf`;
CREATE TABLE `pub_yf`  (
  `No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月份' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pub_yf
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E1FC5D95878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E1FC5D95878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017E1FC5D95878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-LKLL87I1677895270544', 1677900914237, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1677895280000, -1, 5, 'PAUSED', 'CRON', 1677895271000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1677895275000, -1, 5, 'PAUSED', 'CRON', 1677895272000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1677895280000, -1, 5, 'PAUSED', 'CRON', 1677895273000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-01-03 19:49:24', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '集团总部', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '南方分公司', 1, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', 'admin', '2023-03-07 14:39:43');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '北方分公司', 2, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', 'admin', '2023-03-07 14:40:01');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '集团研发部门', 1, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', 'admin', '2023-03-07 14:43:08');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '集团市场部门', 2, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', 'admin', '2023-03-07 14:43:20');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '集团服务部', 3, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', 'admin', '2023-03-07 14:44:07');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '集团财务部', 4, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', 'admin', '2023-03-07 14:44:24');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '集团人力资源部', 5, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', 'admin', '2023-03-07 14:44:44');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'admin', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-01-03 19:49:11', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '外来单位', 3, '', '', '', '0', '0', 'admin', '2023-03-07 14:45:08', 'admin', '2023-03-07 14:45:21');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-01-03 19:49:23', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-01-03 19:49:22', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_docfile
-- ----------------------------
DROP TABLE IF EXISTS `sys_docfile`;
CREATE TABLE `sys_docfile`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FileName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FileSize` int(0) NULL DEFAULT NULL COMMENT '大小',
  `FileType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `D1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'D1',
  `D2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'D2',
  `D3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'D3',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '备注字段文件管理者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_docfile
-- ----------------------------

-- ----------------------------
-- Table structure for sys_encfg
-- ----------------------------
DROP TABLE IF EXISTS `sys_encfg`;
CREATE TABLE `sys_encfg`  (
  `No` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实体名称 - 主键',
  `UIRowStyleGlo` int(0) NULL DEFAULT NULL COMMENT '表格数据行风格(应用全局),枚举类型:0 无风格;1 交替风格;2 鼠标移动;3 交替并鼠标移动;',
  `IsEnableDouclickGlo` int(0) NULL DEFAULT NULL COMMENT '是否启动双击打开(应用全局)?',
  `IsEnableFocusField` int(0) NULL DEFAULT NULL COMMENT '是否启用焦点字段?',
  `FocusField` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '焦点字段',
  `IsEnableRefFunc` int(0) NULL DEFAULT NULL COMMENT '是否启用相关功能列?',
  `IsEnableOpenICON` int(0) NULL DEFAULT NULL COMMENT '是否启用打开图标?',
  `MoveToShowWay` int(0) NULL DEFAULT NULL COMMENT '移动到显示方式,枚举类型:0 不显示;1 下拉列表0;2 平铺;',
  `KeyLabel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字Label',
  `PageSize` int(0) NULL DEFAULT NULL COMMENT '页面显示的条数',
  `FontSize` int(0) NULL DEFAULT NULL COMMENT '页面字体大小',
  `EditerType` int(0) NULL DEFAULT NULL COMMENT '大块文本编辑器,枚举类型:0 无编辑器;1 Sina编辑器0;2 FKEditer;3 KindEditor;4 百度的UEditor;',
  `GroupTitle` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组标签',
  `SearchUrlOpenType` int(0) NULL DEFAULT NULL COMMENT '双击行打开内容,枚举类型:0 En.htm 实体与实体相关功能编辑器;1 EnOnly.htm 实体编辑器;2 /CCForm/FrmGener.htm 傻瓜表单解析器;3 /CCForm/FrmGener.htm 自由表单解析器;9 自定义URL;',
  `UrlExt` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要打开的Url',
  `OpenModel` int(0) NULL DEFAULT NULL COMMENT '打开方式,枚举类型:0 弹窗;1 新窗口打开;',
  `IsRefreshParentPage` int(0) NULL DEFAULT NULL COMMENT '关闭后是否刷新本页面',
  `WinCardW` int(0) NULL DEFAULT NULL COMMENT '窗体宽度',
  `WinCardH` int(0) NULL DEFAULT NULL COMMENT '高度',
  `OrderBy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询排序字段',
  `IsDeSc` int(0) NULL DEFAULT NULL COMMENT '是否降序排序?',
  `FJSavePath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加保存路径',
  `FJWebPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件Web路径',
  `Datan` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段数据分析方式',
  `UI` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'UI设置',
  `ColorSet` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色设置',
  `FieldSet` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段求和/平均设置',
  `ForamtFunc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段格式化函数',
  `BtnsShowLeft` int(0) NULL DEFAULT NULL COMMENT '按钮显示到左边?',
  `IsImp` int(0) NULL DEFAULT NULL COMMENT '是否显示导入?',
  `ImpFuncUrl` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导入功能Url',
  `IsGroup` int(0) NULL DEFAULT NULL COMMENT '是否显示分析按钮（在查询工具栏里）?',
  `IsEnableLazyload` int(0) NULL DEFAULT NULL COMMENT '是否启用懒加载？（对树结构实体有效）?',
  `BtnLab1` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义按钮标签1',
  `BtnJS1` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Url/Javasccript',
  `BtnLab2` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义按钮标签2',
  `BtnJS2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Url/Javasccript',
  `AtPara` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  `IsJM` int(0) NULL DEFAULT 0 COMMENT '是否是加密存储?',
  `IsSelectMore` int(0) NULL DEFAULT 1 COMMENT '是否下拉查询条件多选?',
  `TableCol` int(0) NULL DEFAULT 0 COMMENT '实体表单显示列数',
  `IsShowIcon` int(0) NULL DEFAULT 0 COMMENT '是否显示项目图标',
  `KeyPlaceholder` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字提示',
  `IsCond` int(0) NULL DEFAULT 0 COMMENT '退出后是否清空查询条件?',
  `Drill` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '数据钻取',
  `MobileFieldShowModel` int(0) NULL DEFAULT 0 COMMENT '移动端列表字段显示方式',
  `MobileShowContent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端列表字段设置',
  `IsExp` int(0) NULL DEFAULT 0 COMMENT '是否显示导出',
  `BtnLab3` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '集合:自定义按钮标签3',
  `BtnJS3` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '集合:Url/Javasccript',
  `EnBtnLab1` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体:自定义按钮标签1',
  `EnBtnJS1` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体:Url/Javasccript',
  `EnBtnLab2` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体:自定义按钮标签2',
  `EnBtnJS2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体:Url/Javasccript',
  `DoubleOrClickModel` int(0) NULL DEFAULT 0 COMMENT '双击/单击行弹窗模式',
  `OpenModelFunc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '弹窗方法',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '实体配置' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for sys_enum
-- ----------------------------
DROP TABLE IF EXISTS `sys_enum`;
CREATE TABLE `sys_enum`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Lab` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Lab',
  `EnumKey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'EnumKey',
  `IntKey` int(0) NULL DEFAULT NULL COMMENT 'Val',
  `Lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  `StrKey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'StrKey',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '枚举数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_enum
-- ----------------------------
INSERT INTO `sys_enum` VALUES ('ActionType_CH_0', 'GET', 'ActionType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ActionType_CH_1', 'POST', 'ActionType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertType_CH_0', '短信', 'AlertType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertType_CH_1', '邮件', 'AlertType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertType_CH_2', '邮件与短信', 'AlertType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertType_CH_3', '系统(内部)消息', 'AlertType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertWay_CH_0', '不接收', 'AlertWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertWay_CH_1', '短信', 'AlertWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertWay_CH_2', '邮件', 'AlertWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertWay_CH_3', '内部消息', 'AlertWay', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertWay_CH_4', 'QQ消息', 'AlertWay', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertWay_CH_5', 'RTX消息', 'AlertWay', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AlertWay_CH_6', 'MSN消息', 'AlertWay', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AllSubFlowOverRole_CH_0', '不处理', 'AllSubFlowOverRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AllSubFlowOverRole_CH_1', '当前流程自动运行下一步', 'AllSubFlowOverRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AllSubFlowOverRole_CH_2', '结束当前流程', 'AllSubFlowOverRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AllSubFlowOverRole_CH_3', '当前流程运行到指定的节点', 'AllSubFlowOverRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AppModel_CH_0', 'BS系统', 'AppModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AppModel_CH_1', 'CS系统', 'AppModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AppType_CH_0', '外部Url连接', 'AppType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AppType_CH_1', '本地可执行文件', 'AppType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthCtrlWay_CH_0', 'PK-主键', 'AthCtrlWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthCtrlWay_CH_1', 'FID-干流程ID', 'AthCtrlWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthCtrlWay_CH_2', 'PWorkID-父流程ID', 'AthCtrlWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthCtrlWay_CH_3', '仅能查看自己上传的附件', 'AthCtrlWay', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthCtrlWay_CH_4', 'WorkID-按照WorkID计算(对流程节点表单有效)', 'AthCtrlWay', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthCtrlWay_CH_5', 'P2WorkID', 'AthCtrlWay', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthCtrlWay_CH_6', 'P3WorkID', 'AthCtrlWay', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthRunModel_CH_0', '流水模式', 'AthRunModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthRunModel_CH_1', '固定模式', 'AthRunModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthRunModel_CH_2', '自定义页面', 'AthRunModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthSaveWay_CH_0', '保存到web服务器', 'AthSaveWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthSaveWay_CH_1', '保存到数据库', 'AthSaveWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthSaveWay_CH_2', 'ftp服务器', 'AthSaveWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthUploadWay_CH_0', '继承模式', 'AthUploadWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AthUploadWay_CH_1', '协作模式', 'AthUploadWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AuthorWay_CH_0', '不授权', 'AuthorWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AuthorWay_CH_1', '全部流程授权', 'AuthorWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('AuthorWay_CH_2', '指定流程授权', 'AuthorWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BackCopyRole_CH_0', '不反填', 'BackCopyRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BackCopyRole_CH_1', '字段自动匹配', 'BackCopyRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BackCopyRole_CH_2', '按照设置的格式', 'BackCopyRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BackCopyRole_CH_3', '混合模式', 'BackCopyRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillFileType_CH_0', 'Word', 'BillFileType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillFileType_CH_1', 'PDF', 'BillFileType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillFileType_CH_2', 'Excel(未完成)', 'BillFileType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillFileType_CH_3', 'Html(未完成)', 'BillFileType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillFrmType_CH_0', '傻瓜表单', 'BillFrmType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillFrmType_CH_1', '自由表单', 'BillFrmType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillFrmType_CH_8', '开发者表单', 'BillFrmType', 8, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillOpenModel_CH_0', '下载本地', 'BillOpenModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillOpenModel_CH_1', '在线WebOffice打开', 'BillOpenModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillState_CH_0', '空白', 'BillState', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillState_CH_1', '草稿', 'BillState', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillState_CH_100', '归档', 'BillState', 100, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillState_CH_2', '编辑中', 'BillState', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillSta_CH_0', '运行中', 'BillSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillSta_CH_1', '已完成', 'BillSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BillSta_CH_2', '其他', 'BillSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BtnNewModel_CH_0', '表格模式', 'BtnNewModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BtnNewModel_CH_1', '卡片模式', 'BtnNewModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('BtnNewModel_CH_2', '不可用', 'BtnNewModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CancelRole_CH_0', '上一步可以撤销', 'CancelRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CancelRole_CH_1', '不能撤销', 'CancelRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CancelRole_CH_2', '上一步与开始节点可以撤销', 'CancelRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CancelRole_CH_3', '指定的节点可以撤销', 'CancelRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCRole_CH_0', '不能抄送', 'CCRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCRole_CH_1', '手工抄送', 'CCRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCRole_CH_2', '自动抄送', 'CCRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCRole_CH_3', '手工与自动', 'CCRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCRole_CH_4', '按表单SysCCEmps字段计算', 'CCRole', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCRole_CH_5', '在发送前打开抄送窗口', 'CCRole', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCStaWay_CH_0', '仅按岗位计算', 'CCStaWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCStaWay_CH_1', '按岗位智能计算(当前节点)', 'CCStaWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCStaWay_CH_2', '按岗位智能计算(发送到节点)', 'CCStaWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCStaWay_CH_3', '按岗位与部门的交集', 'CCStaWay', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCStaWay_CH_4', '按直线上级部门找岗位下的人员(当前节点)', 'CCStaWay', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCStaWay_CH_5', '按直线上级部门找岗位下的人员(接受节点)', 'CCStaWay', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCWriteTo_CH_0', '写入抄送列表', 'CCWriteTo', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCWriteTo_CH_1', '写入待办', 'CCWriteTo', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CCWriteTo_CH_2', '写入待办与抄送列表', 'CCWriteTo', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHAlertRole_CH_0', '不提示', 'CHAlertRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHAlertRole_CH_1', '每天1次', 'CHAlertRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHAlertRole_CH_2', '每天2次', 'CHAlertRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHAlertWay_CH_0', '邮件', 'CHAlertWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHAlertWay_CH_1', '短信', 'CHAlertWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHAlertWay_CH_2', 'CCIM即时通讯', 'CHAlertWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ChartType_CH_0', '几何图形', 'ChartType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ChartType_CH_1', '肖像图片', 'ChartType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHRole_CH_0', '禁用', 'CHRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHRole_CH_1', '启用', 'CHRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHRole_CH_2', '只读', 'CHRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHRole_CH_3', '启用并可以调整流程应完成时间', 'CHRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHSta_CH_0', '及时完成', 'CHSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHSta_CH_1', '按期完成', 'CHSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHSta_CH_2', '逾期完成', 'CHSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CHSta_CH_3', '超期完成', 'CHSta', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CodeStruct_CH_0', '普通的编码表(具有No,Name)', 'CodeStruct', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CodeStruct_CH_1', '树结构(具有No,Name,ParentNo)', 'CodeStruct', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CodeStruct_CH_2', '行政机构编码表(编码以两位编号标识级次树形关系)', 'CodeStruct', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrDT_CH_1', '跨1个单元格', 'ColSpanAttrDT', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrDT_CH_2', '跨2个单元格', 'ColSpanAttrDT', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrDT_CH_3', '跨3个单元格', 'ColSpanAttrDT', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrDT_CH_4', '跨4个单元格', 'ColSpanAttrDT', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrDT_CH_5', '跨5个单元格', 'ColSpanAttrDT', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrDT_CH_6', '跨6个单元格', 'ColSpanAttrDT', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrString_CH_1', '跨1个单元格', 'ColSpanAttrString', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrString_CH_2', '跨2个单元格', 'ColSpanAttrString', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrString_CH_3', '跨3个单元格', 'ColSpanAttrString', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpanAttrString_CH_4', '跨4个单元格', 'ColSpanAttrString', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpan_CH_1', '跨1个单元格', 'ColSpan', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpan_CH_2', '跨2个单元格', 'ColSpan', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpan_CH_3', '跨3个单元格', 'ColSpan', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpan_CH_4', '跨4个单元格', 'ColSpan', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpan_CH_5', '跨5个单元格', 'ColSpan', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ColSpan_CH_6', '跨6个单元格', 'ColSpan', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CondModel_CH_0', '由连接线条件控制', 'CondModel', 0, 'CH', NULL, '');
INSERT INTO `sys_enum` VALUES ('CondModel_CH_1', '按照用户选择计算', 'CondModel', 1, 'CH', NULL, '');
INSERT INTO `sys_enum` VALUES ('CondModel_CH_2', '发送按钮旁下拉框选择', 'CondModel', 2, 'CH', NULL, '');
INSERT INTO `sys_enum` VALUES ('CtrlWay_CH_0', '单个', 'CtrlWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CtrlWay_CH_1', '多个', 'CtrlWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('CtrlWay_CH_2', '指定', 'CtrlWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DataStoreModel_CH_0', '数据轨迹模式', 'DataStoreModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DataStoreModel_CH_1', '数据合并模式', 'DataStoreModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBSrcType_CH_0', '应用系统主数据库(默认)', 'DBSrcType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBSrcType_CH_1', 'SQLServer数据库', 'DBSrcType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBSrcType_CH_100', 'WebService数据源', 'DBSrcType', 100, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBSrcType_CH_2', 'Oracle数据库', 'DBSrcType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBSrcType_CH_3', 'MySQL数据库', 'DBSrcType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBSrcType_CH_4', 'Informix数据库', 'DBSrcType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBSrcType_CH_50', 'Dubbo服务', 'DBSrcType', 50, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBSrcType_CH_8', 'KingBase数据库', 'DBSrcType', 8, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBType_CH_0', '数据库查询SQL', 'DBType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBType_CH_1', '执行Url返回Json', 'DBType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DBType_CH_2', '执行\\DataUser\\JSLab\\Windows.js的函数.', 'DBType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DefValType_CH_0', '默认值为空', 'DefValType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DefValType_CH_1', '按照设置的默认值设置', 'DefValType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DelEnable_CH_0', '不能删除', 'DelEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DelEnable_CH_1', '逻辑删除', 'DelEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DelEnable_CH_2', '记录日志方式删除', 'DelEnable', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DelEnable_CH_3', '彻底删除', 'DelEnable', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DelEnable_CH_4', '让用户决定删除方式', 'DelEnable', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DeleteWay_CH_0', '不能删除', 'DeleteWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DeleteWay_CH_1', '删除所有', 'DeleteWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DeleteWay_CH_2', '只能删除自己上传的', 'DeleteWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DocType_CH_0', '正式公文', 'DocType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DocType_CH_1', '便函', 'DocType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DoubleOrClickModel_CH_0', '双击行弹窗', 'DoubleOrClickModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DoubleOrClickModel_CH_1', '单击行弹窗', 'DoubleOrClickModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('Draft_CH_0', '无(不设草稿)', 'Draft', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('Draft_CH_1', '保存到待办', 'Draft', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('Draft_CH_2', '保存到草稿箱', 'Draft', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlAddRecModel_CH_0', '按设置的数量初始化空白行', 'DtlAddRecModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlAddRecModel_CH_1', '用按钮增加空白行', 'DtlAddRecModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlOpenType_CH_0', '操作员', 'DtlOpenType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlOpenType_CH_1', 'WorkID-流程ID', 'DtlOpenType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlOpenType_CH_2', 'FID-干流程ID', 'DtlOpenType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlOpenType_CH_3', 'PWorkID-父流程WorkID', 'DtlOpenType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlSaveModel_CH_0', '自动存盘(失去焦点自动存盘)', 'DtlSaveModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlSaveModel_CH_1', '手动存盘(保存按钮触发存盘)', 'DtlSaveModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DtlVer_CH_0', '2017传统版', 'DtlVer', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DTSearchWay_CH_0', '不启用', 'DTSearchWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DTSearchWay_CH_1', '按日期', 'DTSearchWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DTSearchWay_CH_2', '按日期时间', 'DTSearchWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DTSWay_CH_0', '不考核', 'DTSWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DTSWay_CH_1', '按照时效考核', 'DTSWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('DTSWay_CH_2', '按照工作量考核', 'DTSWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EditerType_CH_0', '无编辑器', 'EditerType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EditerType_CH_1', 'Sina编辑器0', 'EditerType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EditerType_CH_2', 'FKEditer', 'EditerType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EditerType_CH_3', 'KindEditor', 'EditerType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EditerType_CH_4', '百度的UEditor', 'EditerType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EditModel_CH_0', '表格模式', 'EditModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EditModel_CH_1', '傻瓜表单', 'EditModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EditModel_CH_2', '自由表单', 'EditModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EntityEditModel_CH_0', '表格', 'EntityEditModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EntityEditModel_CH_1', '行编辑', 'EntityEditModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EntityShowModel_CH_0', '表格', 'EntityShowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EntityShowModel_CH_1', '树干模式', 'EntityShowModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EntityType_CH_0', '独立表单', 'EntityType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EntityType_CH_1', '单据', 'EntityType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EntityType_CH_2', '编号名称实体', 'EntityType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EntityType_CH_3', '树结构实体', 'EntityType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EnumUIContralType_CH_1', '下拉框', 'EnumUIContralType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EnumUIContralType_CH_2', '复选框', 'EnumUIContralType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EnumUIContralType_CH_3', '单选按钮', 'EnumUIContralType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EventType_CH_0', '禁用', 'EventType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EventType_CH_1', '执行URL', 'EventType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('EventType_CH_2', '执行CCFromRef.js', 'EventType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ExcType_CH_0', '超链接', 'ExcType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ExcType_CH_1', '函数', 'ExcType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ExpType_CH_3', '按照SQL计算', 'ExpType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ExpType_CH_4', '按照参数计算', 'ExpType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FileType_CH_0', '普通附件', 'FileType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FileType_CH_1', '图片文件', 'FileType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FJOpen_CH_0', '关闭附件', 'FJOpen', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FJOpen_CH_1', '操作员', 'FJOpen', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FJOpen_CH_2', '工作ID', 'FJOpen', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FJOpen_CH_3', '流程ID', 'FJOpen', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowAppType_CH_0', '业务流程', 'FlowAppType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowAppType_CH_1', '工程类(项目组流程)', 'FlowAppType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowAppType_CH_2', '公文流程(VSTO)', 'FlowAppType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowBBSRole_CH_0', '禁用', 'FlowBBSRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowBBSRole_CH_1', '启用', 'FlowBBSRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowBBSRole_CH_2', '只读', 'FlowBBSRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowDeleteRole_CH_0', '超级管理员可以删除', 'FlowDeleteRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowDeleteRole_CH_1', '分级管理员可以删除', 'FlowDeleteRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowDeleteRole_CH_2', '发起人可以删除', 'FlowDeleteRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowDeleteRole_CH_3', '节点启动删除按钮的操作员', 'FlowDeleteRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowFrmModel_CH_0', '完整版-2019年更早版本', 'FlowFrmModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowFrmModel_CH_1', '绑定表单库的表单', 'FlowFrmModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowFrmModel_CH_2', '表单树模式', 'FlowFrmModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowFrmModel_CH_3', '自定义(嵌入)表单', 'FlowFrmModel', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowFrmModel_CH_4', 'SDK表单', 'FlowFrmModel', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowRunWay_CH_0', '手工启动', 'FlowRunWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowRunWay_CH_1', '指定人员按时启动', 'FlowRunWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowRunWay_CH_2', '数据集按时启动', 'FlowRunWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FlowRunWay_CH_3', '触发式启动', 'FlowRunWay', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FLRole_CH_0', '按接受人', 'FLRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FLRole_CH_1', '按部门', 'FLRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FLRole_CH_2', '按岗位', 'FLRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmDBRemarkEnable_CH_0', '禁用', 'FrmDBRemarkEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmDBRemarkEnable_CH_1', '可编辑', 'FrmDBRemarkEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmDBRemarkEnable_CH_2', '不可编辑', 'FrmDBRemarkEnable', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmEnableRole_CH_0', '始终启用', 'FrmEnableRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmEnableRole_CH_1', '有数据时启用', 'FrmEnableRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmEnableRole_CH_2', '有参数时启用', 'FrmEnableRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmEnableRole_CH_3', '按表单的字段表达式', 'FrmEnableRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmEnableRole_CH_4', '按SQL表达式', 'FrmEnableRole', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmEnableRole_CH_5', '不启用', 'FrmEnableRole', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmEnableRole_CH_6', '按岗位', 'FrmEnableRole', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmEnableRole_CH_7', '按部门', 'FrmEnableRole', 7, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmShowType_CH_0', '普通方式', 'FrmShowType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmShowType_CH_1', '页签方式', 'FrmShowType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmSln_CH_0', '默认方案', 'FrmSln', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmSln_CH_1', '只读方案', 'FrmSln', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmSln_CH_2', '自定义方案', 'FrmSln', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmThreadSta_CH_0', '禁用', 'FrmThreadSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmThreadSta_CH_1', '启用', 'FrmThreadSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmTrackSta_CH_0', '禁用', 'FrmTrackSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmTrackSta_CH_1', '显示轨迹图', 'FrmTrackSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmTrackSta_CH_2', '显示轨迹表', 'FrmTrackSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_0', '傻瓜表单', 'FrmType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_1', '自由表单', 'FrmType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_11', '累加表单', 'FrmType', 11, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_3', '嵌入式表单', 'FrmType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_4', 'Word表单', 'FrmType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_5', '在线编辑模式Excel表单', 'FrmType', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_6', 'VSTO模式Excel表单', 'FrmType', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_7', '实体类组件', 'FrmType', 7, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmType_CH_8', '开发者表单', 'FrmType', 8, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmUrlShowWay_CH_0', '不显示', 'FrmUrlShowWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmUrlShowWay_CH_1', '自动大小', 'FrmUrlShowWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmUrlShowWay_CH_2', '指定大小', 'FrmUrlShowWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FrmUrlShowWay_CH_3', '新窗口', 'FrmUrlShowWay', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FTCSta_CH_0', '禁用', 'FTCSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FTCSta_CH_1', '只读', 'FTCSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FTCSta_CH_2', '可设置人员', 'FTCSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FTCWorkModel_CH_0', '简洁模式', 'FTCWorkModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FTCWorkModel_CH_1', '高级模式', 'FTCWorkModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCAth_CH_0', '不启用', 'FWCAth', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCAth_CH_1', '多附件', 'FWCAth', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCAth_CH_2', '单附件(暂不支持)', 'FWCAth', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCAth_CH_3', '图片附件(暂不支持)', 'FWCAth', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCMsgShow_CH_0', '都显示', 'FWCMsgShow', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCMsgShow_CH_1', '仅显示自己的意见', 'FWCMsgShow', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCOrderModel_CH_0', '按审批时间先后排序', 'FWCOrderModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCOrderModel_CH_1', '按照接受人员列表先后顺序(官职大小)', 'FWCOrderModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCShowModel_CH_0', '表格方式', 'FWCShowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCShowModel_CH_1', '自由模式', 'FWCShowModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCSta_CH_0', '禁用', 'FWCSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCSta_CH_1', '启用', 'FWCSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCSta_CH_2', '只读', 'FWCSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCType_CH_0', '审核组件', 'FWCType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCType_CH_1', '日志组件', 'FWCType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCType_CH_2', '周报组件', 'FWCType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCType_CH_3', '月报组件', 'FWCType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCVer_CH_0', '1个节点1个人保留1个意见', 'FWCVer', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('FWCVer_CH_1', '保留节点历史意见(默认)', 'FWCVer', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('GuestFlowRole_CH_0', '不参与', 'GuestFlowRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('GuestFlowRole_CH_1', '开始节点参与', 'GuestFlowRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('GuestFlowRole_CH_2', '中间节点参与', 'GuestFlowRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HelpRole_CH_0', '禁用', 'HelpRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HelpRole_CH_1', '启用', 'HelpRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HelpRole_CH_2', '强制提示', 'HelpRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HelpRole_CH_3', '选择性提示', 'HelpRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HuiQianLeaderRole_CH_0', '只有一个组长', 'HuiQianLeaderRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HuiQianLeaderRole_CH_1', '最后一个组长发送', 'HuiQianLeaderRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HuiQianLeaderRole_CH_2', '任意组长发送', 'HuiQianLeaderRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HuiQianRole_CH_0', '不启用', 'HuiQianRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HuiQianRole_CH_1', '协作模式', 'HuiQianRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HuiQianRole_CH_4', '组长模式', 'HuiQianRole', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HungUpWay_CH_0', '无限挂起', 'HungUpWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HungUpWay_CH_1', '按指定的时间解除挂起并通知我自己', 'HungUpWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('HungUpWay_CH_2', '按指定的时间解除挂起并通知所有人', 'HungUpWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IMEnable_CH_0', '禁用', 'IMEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IMEnable_CH_1', '启用', 'IMEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ImgSrcType_CH_0', '本地', 'ImgSrcType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ImgSrcType_CH_1', 'URL', 'ImgSrcType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ImpModel_CH_0', '不导入', 'ImpModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ImpModel_CH_1', '按配置模式导入', 'ImpModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ImpModel_CH_2', '按照xls文件模版导入', 'ImpModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('InvokeTime_CH_0', '发送时', 'InvokeTime', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('InvokeTime_CH_1', '工作到达时', 'InvokeTime', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsAutoSendSLSubFlowOver_CH_0', '不处理', 'IsAutoSendSLSubFlowOver', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsAutoSendSLSubFlowOver_CH_1', '让同级子流程自动运行下一步', 'IsAutoSendSLSubFlowOver', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsAutoSendSLSubFlowOver_CH_2', '结束同级子流程', 'IsAutoSendSLSubFlowOver', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsAutoSendSubFlowOver_CH_0', '不处理', 'IsAutoSendSubFlowOver', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsAutoSendSubFlowOver_CH_1', '让父流程自动运行下一步', 'IsAutoSendSubFlowOver', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsAutoSendSubFlowOver_CH_2', '结束父流程', 'IsAutoSendSubFlowOver', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsBackTracking_CH_0', '不允许原路返回', 'IsBackTracking', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsBackTracking_CH_1', '由退回人决定', 'IsBackTracking', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsBackTracking_CH_2', '强制原路返回', 'IsBackTracking', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsEnableFWC_CH_0', '禁用', 'IsEnableFWC', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsEnableFWC_CH_1', '启用', 'IsEnableFWC', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsEnableFWC_CH_2', '只读', 'IsEnableFWC', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsKillEtcThread_CH_0', '不删除其它的子线程', 'IsKillEtcThread', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsKillEtcThread_CH_1', '删除其它的子线程', 'IsKillEtcThread', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsKillEtcThread_CH_2', '由子线程退回人决定是否删除', 'IsKillEtcThread', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSigan_CH_0', '无', 'IsSigan', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSigan_CH_1', '图片签名', 'IsSigan', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSigan_CH_2', '山东CA', 'IsSigan', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSigan_CH_3', '广东CA', 'IsSigan', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSigan_CH_4', '图片盖章', 'IsSigan', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSupperText_CH_0', 'yyyy-MM-dd', 'IsSupperText', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSupperText_CH_1', 'yyyy-MM-dd HH:mm', 'IsSupperText', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSupperText_CH_2', 'yyyy-MM-dd HH:mm:ss', 'IsSupperText', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSupperText_CH_3', 'yyyy-MM', 'IsSupperText', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSupperText_CH_4', 'HH:mm', 'IsSupperText', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSupperText_CH_5', 'HH:mm:ss', 'IsSupperText', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('IsSupperText_CH_6', 'MM-dd', 'IsSupperText', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JMCD_CH_0', '一般', 'JMCD', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JMCD_CH_1', '保密', 'JMCD', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JMCD_CH_2', '秘密', 'JMCD', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JMCD_CH_3', '机密', 'JMCD', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JumpWay_CH_0', '不能跳转', 'JumpWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JumpWay_CH_1', '只能向后跳转', 'JumpWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JumpWay_CH_2', '只能向前跳转', 'JumpWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JumpWay_CH_3', '任意节点跳转', 'JumpWay', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('JumpWay_CH_4', '按指定规则跳转', 'JumpWay', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('LGType_CH_0', '普通', 'LGType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('LGType_CH_1', '枚举', 'LGType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('LGType_CH_2', '外键', 'LGType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('LGType_CH_3', '打开系统页面', 'LGType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ListModel_CH_0', '编辑模式', 'ListModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ListModel_CH_1', '视图模式', 'ListModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ListShowModel_CH_0', '表格', 'ListShowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ListShowModel_CH_1', '卡片', 'ListShowModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuCtrlWay_CH_0', '按照设置的控制', 'MenuCtrlWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuCtrlWay_CH_1', '任何人都可以使用', 'MenuCtrlWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuCtrlWay_CH_2', 'Admin用户可以使用', 'MenuCtrlWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuType_CH_0', '系统根目录', 'MenuType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuType_CH_1', '系统类别', 'MenuType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuType_CH_2', '系统', 'MenuType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuType_CH_3', '目录', 'MenuType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuType_CH_4', '功能/界面', 'MenuType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MenuType_CH_5', '功能控制点', 'MenuType', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MethodDocTypeOfFunc_CH_0', 'SQL', 'MethodDocTypeOfFunc', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MethodDocTypeOfFunc_CH_1', 'URL', 'MethodDocTypeOfFunc', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MethodDocTypeOfFunc_CH_2', 'JavaScript', 'MethodDocTypeOfFunc', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MethodDocTypeOfFunc_CH_3', '业务单元', 'MethodDocTypeOfFunc', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MobileFieldShowModel_CH_0', '默认设置', 'MobileFieldShowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MobileFieldShowModel_CH_1', '设置显示字段', 'MobileFieldShowModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MobileFieldShowModel_CH_2', '设置模板', 'MobileFieldShowModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MobileShowModel_CH_0', '新页面显示模式', 'MobileShowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MobileShowModel_CH_1', '列表模式', 'MobileShowModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('Model_CH_0', '普通', 'Model', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('Model_CH_1', '固定行', 'Model', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MoreLinkModel_CH_0', '新窗口', 'MoreLinkModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MoreLinkModel_CH_1', '本窗口', 'MoreLinkModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MoreLinkModel_CH_2', '覆盖新窗口', 'MoreLinkModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MoveToShowWay_CH_0', '不显示', 'MoveToShowWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MoveToShowWay_CH_1', '下拉列表0', 'MoveToShowWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MoveToShowWay_CH_2', '平铺', 'MoveToShowWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MsgCtrl_CH_0', '不发送', 'MsgCtrl', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MsgCtrl_CH_1', '按设置的下一步接受人自动发送（默认）', 'MsgCtrl', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MsgCtrl_CH_2', '由本节点表单系统字段(IsSendEmail,IsSendSMS)来决定', 'MsgCtrl', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MsgCtrl_CH_3', '由SDK开发者参数(IsSendEmail,IsSendSMS)来决定', 'MsgCtrl', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDataType_CH_1', '字符串String', 'MyDataType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDataType_CH_2', '整数类型Int', 'MyDataType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDataType_CH_3', '浮点类型AppFloat', 'MyDataType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDataType_CH_4', '判断类型Boolean', 'MyDataType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDataType_CH_5', '双精度类型Double', 'MyDataType', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDataType_CH_6', '日期型Date', 'MyDataType', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDataType_CH_7', '时间类型Datetime', 'MyDataType', 7, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDataType_CH_8', '金额类型AppMoney', 'MyDataType', 8, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDeptRole_CH_0', '仅部门领导可以查看', 'MyDeptRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDeptRole_CH_1', '部门下所有的人都可以查看', 'MyDeptRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('MyDeptRole_CH_2', '本部门里指定岗位的人可以查看', 'MyDeptRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NextRole_CH_0', '禁用', 'NextRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NextRole_CH_1', '相同节点', 'NextRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NextRole_CH_2', '相同流程', 'NextRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NextRole_CH_3', '相同的人', 'NextRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NextRole_CH_4', '不限流程', 'NextRole', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NoGenerModel_CH_0', '自定义', 'NoGenerModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NoGenerModel_CH_1', '流水号', 'NoGenerModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NoGenerModel_CH_2', '标签的全拼', 'NoGenerModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NoGenerModel_CH_3', '标签的简拼', 'NoGenerModel', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NoGenerModel_CH_4', '按GUID生成', 'NoGenerModel', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NoteEnable_CH_0', '禁用', 'NoteEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NoteEnable_CH_1', '启用', 'NoteEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('NoteEnable_CH_2', '只读', 'NoteEnable', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OfficeBtnEnable_CH_0', '不可用', 'OfficeBtnEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OfficeBtnEnable_CH_1', '可编辑', 'OfficeBtnEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OfficeBtnEnable_CH_2', '不可编辑', 'OfficeBtnEnable', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OfficeBtnLocal_CH_0', '工具栏上', 'OfficeBtnLocal', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OfficeBtnLocal_CH_1', '表单标签(divID=GovDocFile)', 'OfficeBtnLocal', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OfficeFileType_CH_0', 'word文件', 'OfficeFileType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OfficeFileType_CH_1', 'WPS文件', 'OfficeFileType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OpenModel_CH_0', '弹窗', 'OpenModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OpenModel_CH_1', '新窗口打开', 'OpenModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OpenWay_CH_0', '新窗口', 'OpenWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OpenWay_CH_1', '本窗口', 'OpenWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('OpenWay_CH_2', '覆盖新窗口', 'OpenWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ParentFlowSendNextStepRole_CH_0', '不处理', 'ParentFlowSendNextStepRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ParentFlowSendNextStepRole_CH_1', '该子流程运行结束', 'ParentFlowSendNextStepRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ParentFlowSendNextStepRole_CH_2', '该子流程运行到指定节点', 'ParentFlowSendNextStepRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PicUploadType_CH_0', '拍照上传或者相册上传', 'PicUploadType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PicUploadType_CH_1', '只能拍照上传', 'PicUploadType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PopValFormat_CH_0', 'No(仅编号)', 'PopValFormat', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PopValFormat_CH_1', 'Name(仅名称)', 'PopValFormat', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PopValFormat_CH_2', 'No,Name(编号与名称,比如zhangsan,张三;lisi,李四;)', 'PopValFormat', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PowerCtrlType_CH_0', '岗位', 'PowerCtrlType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PowerCtrlType_CH_1', '人员', 'PowerCtrlType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PRIEnable_CH_0', '不启用', 'PRIEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PRIEnable_CH_1', '只读', 'PRIEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PRIEnable_CH_2', '编辑', 'PRIEnable', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PrintPDFModle_CH_0', '全部打印', 'PrintPDFModle', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PrintPDFModle_CH_1', '单个表单打印(针对树形表单)', 'PrintPDFModle', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PRI_CH_0', '低', 'PRI', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PRI_CH_1', '中', 'PRI', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PRI_CH_2', '高', 'PRI', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PushWay_CH_0', '按照指定节点的工作人员', 'PushWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PushWay_CH_1', '按照指定的工作人员', 'PushWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PushWay_CH_2', '按照指定的工作岗位', 'PushWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PushWay_CH_3', '按照指定的部门', 'PushWay', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PushWay_CH_4', '按照指定的SQL', 'PushWay', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('PushWay_CH_5', '按照系统指定的字段', 'PushWay', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('QRCodeRole_CH_0', '无', 'QRCodeRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('QRCodeRole_CH_1', '查看流程表单-无需权限', 'QRCodeRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('QRCodeRole_CH_2', '查看流程表单-需要登录', 'QRCodeRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('QRCodeRole_CH_3', '外部账户协作模式处理工作', 'QRCodeRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('QRModel_CH_0', '不生成', 'QRModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('QRModel_CH_1', '生成二维码', 'QRModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RBShowModel_CH_0', '竖向', 'RBShowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RBShowModel_CH_3', '横向', 'RBShowModel', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReadReceipts_CH_0', '不回执', 'ReadReceipts', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReadReceipts_CH_1', '自动回执', 'ReadReceipts', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReadReceipts_CH_2', '由上一节点表单字段决定', 'ReadReceipts', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReadReceipts_CH_3', '由SDK开发者参数决定', 'ReadReceipts', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReadRole_CH_0', '不控制', 'ReadRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReadRole_CH_1', '未阅读阻止发送', 'ReadRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReadRole_CH_2', '未阅读做记录', 'ReadRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefBillRole_CH_0', '不启用', 'RefBillRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefBillRole_CH_1', '非必须选择关联单据', 'RefBillRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefBillRole_CH_2', '必须选择关联单据', 'RefBillRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodTypeLink_CH_0', '模态窗口打开', 'RefMethodTypeLink', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodTypeLink_CH_1', '新窗口打开', 'RefMethodTypeLink', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodTypeLink_CH_2', '右侧窗口打开', 'RefMethodTypeLink', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodTypeLink_CH_4', '转到新页面', 'RefMethodTypeLink', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodType_CH_0', '功能', 'RefMethodType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodType_CH_1', '模态窗口打开', 'RefMethodType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodType_CH_2', '新窗口打开', 'RefMethodType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodType_CH_3', '右侧窗口打开', 'RefMethodType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RefMethodType_CH_4', '实体集合的功能', 'RefMethodType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnOneNodeRole_CH_0', '不启用', 'ReturnOneNodeRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnOneNodeRole_CH_1', '按照[退回信息填写字段]作为退回意见直接退回', 'ReturnOneNodeRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnOneNodeRole_CH_2', '按照[审核组件]填写的信息作为退回意见直接退回', 'ReturnOneNodeRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnRole_CH_0', '不能退回', 'ReturnRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnRole_CH_1', '只能退回上一个节点', 'ReturnRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnRole_CH_2', '可退回以前任意节点', 'ReturnRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnRole_CH_3', '可退回指定的节点', 'ReturnRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnRole_CH_4', '由流程图设计的退回路线决定', 'ReturnRole', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnSendModel_CH_0', '从退回节点正常执行', 'ReturnSendModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnSendModel_CH_1', '直接发送到当前节点', 'ReturnSendModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ReturnSendModel_CH_2', '直接发送到当前节点的下一个节点', 'ReturnSendModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowOpenModel_CH_0', '新窗口打开', 'RowOpenModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowOpenModel_CH_1', '弹出窗口打开,关闭后刷新列表', 'RowOpenModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowOpenModel_CH_2', '弹出窗口打开,关闭后不刷新列表', 'RowOpenModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowOpenMode_CH_0', '新窗口打开', 'RowOpenMode', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowOpenMode_CH_1', '在本窗口打开', 'RowOpenMode', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowOpenMode_CH_2', '弹出窗口打开,关闭后不刷新列表', 'RowOpenMode', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowOpenMode_CH_3', '弹出窗口打开,关闭后刷新列表', 'RowOpenMode', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowSpanAttrString_CH_1', '跨1个行', 'RowSpanAttrString', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowSpanAttrString_CH_2', '跨2行', 'RowSpanAttrString', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowSpanAttrString_CH_3', '跨3行', 'RowSpanAttrString', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowSpan_CH_1', '跨1个行', 'RowSpan', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowSpan_CH_2', '跨2行', 'RowSpan', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RowSpan_CH_3', '跨3行', 'RowSpan', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RunModel_CH_0', '普通', 'RunModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RunModel_CH_1', '合流', 'RunModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RunModel_CH_2', '分流', 'RunModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RunModel_CH_3', '分合流', 'RunModel', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('RunModel_CH_4', '子线程', 'RunModel', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SaveModel_CH_0', '仅节点表', 'SaveModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SaveModel_CH_1', '节点表与Rpt表', 'SaveModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ScripRole_CH_0', '禁用', 'ScripRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ScripRole_CH_1', '按钮启用', 'ScripRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ScripRole_CH_2', '发送启用', 'ScripRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchDictOpenType_CH_0', 'MyDictFrameWork.htm 实体与实体相关功能编辑器', 'SearchDictOpenType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchDictOpenType_CH_1', 'MyDict.htm 实体编辑器', 'SearchDictOpenType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchDictOpenType_CH_2', 'MyBill.htm 单据编辑器', 'SearchDictOpenType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchDictOpenType_CH_9', '自定义URL', 'SearchDictOpenType', 9, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchUrlOpenType_CH_0', 'En.htm 实体与实体相关功能编辑器', 'SearchUrlOpenType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchUrlOpenType_CH_1', 'EnOnly.htm 实体编辑器', 'SearchUrlOpenType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchUrlOpenType_CH_2', '/CCForm/FrmGener.htm 傻瓜表单解析器', 'SearchUrlOpenType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchUrlOpenType_CH_3', '/CCForm/FrmGener.htm 自由表单解析器', 'SearchUrlOpenType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SearchUrlOpenType_CH_9', '自定义URL', 'SearchUrlOpenType', 9, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectAccepterEnable_CH_0', '不启用', 'SelectAccepterEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectAccepterEnable_CH_1', '单独启用', 'SelectAccepterEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectAccepterEnable_CH_2', '在发送前打开', 'SelectAccepterEnable', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectAccepterEnable_CH_3', '转入新页面', 'SelectAccepterEnable', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_0', '按岗位', 'SelectorModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_1', '按部门', 'SelectorModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_2', '按人员', 'SelectorModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_3', '按SQL', 'SelectorModel', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_4', '按SQL模版计算', 'SelectorModel', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_5', '使用通用人员选择器', 'SelectorModel', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_6', '部门与岗位的交集', 'SelectorModel', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_7', '自定义Url', 'SelectorModel', 7, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_8', '使用通用部门岗位人员选择器', 'SelectorModel', 8, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SelectorModel_CH_9', '按岗位智能计算(操作员所在部门)', 'SelectorModel', 9, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SendModel_CH_0', '给当前人员设置开始节点待办', 'SendModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SendModel_CH_1', '发送到下一个节点', 'SendModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFOpenType_CH_0', '工作查看器', 'SFOpenType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFOpenType_CH_1', '傻瓜表单轨迹查看器', 'SFOpenType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFShowCtrl_CH_0', '可以看所有的子流程', 'SFShowCtrl', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFShowCtrl_CH_1', '仅仅可以看自己发起的子流程', 'SFShowCtrl', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFShowModel_CH_0', '表格方式', 'SFShowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFShowModel_CH_1', '自由模式', 'SFShowModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFSta_CH_0', '禁用', 'SFSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFSta_CH_1', '启用', 'SFSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SFSta_CH_2', '只读', 'SFSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SharingType_CH_0', '共享', 'SharingType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SharingType_CH_1', '私有', 'SharingType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ShowModel_CH_0', '按钮', 'ShowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ShowModel_CH_1', '超链接', 'ShowModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ShowType_CH_0', '显示', 'ShowType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ShowType_CH_1', 'PC折叠', 'ShowType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ShowType_CH_2', '隐藏', 'ShowType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ShowWhere_CH_0', '树形表单', 'ShowWhere', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ShowWhere_CH_1', '工具栏', 'ShowWhere', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ShowWhere_CH_2', '抄送工具栏', 'ShowWhere', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SigantureEnabel_CH_0', '不签名', 'SigantureEnabel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SigantureEnabel_CH_1', '图片签名', 'SigantureEnabel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SigantureEnabel_CH_2', '写字板', 'SigantureEnabel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SignType_CH_0', '不签名', 'SignType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SignType_CH_1', '图片签名', 'SignType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SignType_CH_2', '电子签名', 'SignType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SQLType_CH_0', '方向条件', 'SQLType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SQLType_CH_1', '接受人规则', 'SQLType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SQLType_CH_2', '下拉框数据过滤', 'SQLType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SQLType_CH_3', '级联下拉框', 'SQLType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SQLType_CH_4', 'PopVal开窗返回值', 'SQLType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SQLType_CH_5', '人员选择器人员选择范围', 'SQLType', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SrcType_CH_0', '本地的类', 'SrcType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SrcType_CH_1', '创建表', 'SrcType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SrcType_CH_2', '表或视图', 'SrcType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SrcType_CH_3', 'SQL查询表', 'SrcType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SrcType_CH_4', 'WebServices', 'SrcType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SrcType_CH_5', '微服务Handler外部数据源', 'SrcType', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SrcType_CH_6', 'JavaScript外部数据源', 'SrcType', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SrcType_CH_7', '系统字典表', 'SrcType', 7, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SSOType_CH_0', 'SID验证', 'SSOType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SSOType_CH_1', '连接', 'SSOType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SSOType_CH_2', '表单提交', 'SSOType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SSOType_CH_3', '不传值', 'SSOType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowModel_CH_0', '下级子流程', 'SubFlowModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowModel_CH_1', '同级子流程', 'SubFlowModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowShowType_CH_0', '平铺模式显示', 'SubFlowShowType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowShowType_CH_1', '合并模式显示', 'SubFlowShowType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowStartWay_CH_0', '不启动', 'SubFlowStartWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowStartWay_CH_1', '指定的字段启动', 'SubFlowStartWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowStartWay_CH_2', '按明细表启动', 'SubFlowStartWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowSta_CH_0', '禁用', 'SubFlowSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowSta_CH_1', '启用', 'SubFlowSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowSta_CH_2', '只读', 'SubFlowSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowType_CH_0', '手动启动子流程', 'SubFlowType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowType_CH_1', '触发启动子流程', 'SubFlowType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubFlowType_CH_2', '延续子流程', 'SubFlowType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubThreadType_CH_0', '同表单', 'SubThreadType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('SubThreadType_CH_1', '异表单', 'SubThreadType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TableCol_CH_0', '4列', 'TableCol', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TableCol_CH_1', '6列', 'TableCol', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TableCol_CH_2', '上下模式3列', 'TableCol', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TabType_CH_0', '本地表或视图', 'TabType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TabType_CH_1', '通过一个SQL确定的一个外部数据源', 'TabType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TabType_CH_2', '通过WebServices获得的一个数据源', 'TabType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('Target_CH_0', '新窗口', 'Target', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('Target_CH_1', '本窗口', 'Target', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('Target_CH_2', '父窗口', 'Target', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TaskSta_CH_0', '未开始', 'TaskSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TaskSta_CH_1', '进行中', 'TaskSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TaskSta_CH_2', '完成', 'TaskSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TaskSta_CH_3', '推迟', 'TaskSta', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TemplateFileModel_CH_0', 'rtf模版', 'TemplateFileModel', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TemplateFileModel_CH_1', 'vsto模式的word模版', 'TemplateFileModel', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TemplateFileModel_CH_2', 'vsto模式的excel模版', 'TemplateFileModel', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TextColSpan_CH_1', '跨1个单元格', 'TextColSpan', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TextColSpan_CH_2', '跨2个单元格', 'TextColSpan', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TextColSpan_CH_3', '跨3个单元格', 'TextColSpan', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TextColSpan_CH_4', '跨4个单元格', 'TextColSpan', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ThreadKillRole_CH_0', '不能删除', 'ThreadKillRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ThreadKillRole_CH_1', '手工删除', 'ThreadKillRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ThreadKillRole_CH_2', '自动删除', 'ThreadKillRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ToobarExcType_CH_0', '超链接', 'ToobarExcType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('ToobarExcType_CH_1', '函数', 'ToobarExcType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TrackOrderBy_CH_0', '按照时间先后顺序', 'TrackOrderBy', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TrackOrderBy_CH_1', '倒序(新发生的在前面)', 'TrackOrderBy', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TSpan_CH_0', '本周', 'TSpan', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TSpan_CH_1', '上周', 'TSpan', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TSpan_CH_2', '上上周', 'TSpan', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('TSpan_CH_3', '更早', 'TSpan', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIContralType_CH_1', '下拉框', 'UIContralType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIContralType_CH_2', '复选框', 'UIContralType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIContralType_CH_3', '单选按钮', 'UIContralType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIIsEnable_CH_0', '禁用', 'UIIsEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIIsEnable_CH_1', '执行URL', 'UIIsEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIIsEnable_CH_2', '执行CCFromRef.js', 'UIIsEnable', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIRowStyleGlo_CH_0', '无风格', 'UIRowStyleGlo', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIRowStyleGlo_CH_1', '交替风格', 'UIRowStyleGlo', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIRowStyleGlo_CH_2', '鼠标移动', 'UIRowStyleGlo', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UIRowStyleGlo_CH_3', '交替并鼠标移动', 'UIRowStyleGlo', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadFileCheck_CH_0', '不控制', 'UploadFileCheck', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadFileCheck_CH_1', '上传附件个数不能为0', 'UploadFileCheck', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadFileCheck_CH_2', '每个类别下面的个数不能为0', 'UploadFileCheck', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadFileNumCheck_CH_0', '不用校验', 'UploadFileNumCheck', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadFileNumCheck_CH_1', '不能为空', 'UploadFileNumCheck', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadFileNumCheck_CH_2', '每个类别下不能为空', 'UploadFileNumCheck', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadType_CH_0', '单个', 'UploadType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadType_CH_1', '多个', 'UploadType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UploadType_CH_2', '指定', 'UploadType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UrlSrcType_CH_0', '自定义', 'UrlSrcType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UrlSrcType_CH_1', '地图', 'UrlSrcType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UrlSrcType_CH_2', '流程轨迹表', 'UrlSrcType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('UrlSrcType_CH_3', '流程轨迹图', 'UrlSrcType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WebOfficeEnable_CH_0', '不启用', 'WebOfficeEnable', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WebOfficeEnable_CH_1', '按钮方式', 'WebOfficeEnable', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WebOfficeEnable_CH_2', '标签页置后方式', 'WebOfficeEnable', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WebOfficeEnable_CH_3', '标签页置前方式', 'WebOfficeEnable', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_10', '批处理', 'WFStateApp', 10, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_2', '运行中', 'WFStateApp', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_3', '已完成', 'WFStateApp', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_4', '挂起', 'WFStateApp', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_5', '退回', 'WFStateApp', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_6', '转发', 'WFStateApp', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_7', '删除', 'WFStateApp', 7, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_8', '加签', 'WFStateApp', 8, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFStateApp_CH_9', '冻结', 'WFStateApp', 9, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_0', '空白', 'WFState', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_1', '草稿', 'WFState', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_10', '批处理', 'WFState', 10, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_11', '加签回复状态', 'WFState', 11, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_2', '运行中', 'WFState', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_3', '已完成', 'WFState', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_4', '挂起', 'WFState', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_5', '退回', 'WFState', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_6', '转发', 'WFState', 6, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_7', '删除', 'WFState', 7, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_8', '加签', 'WFState', 8, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFState_CH_9', '冻结', 'WFState', 9, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFSta_CH_0', '运行中', 'WFSta', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFSta_CH_1', '已完成', 'WFSta', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WFSta_CH_2', '其他', 'WFSta', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhatAreYouTodo_CH_0', '关闭提示窗口', 'WhatAreYouTodo', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhatAreYouTodo_CH_1', '关闭提示窗口并刷新', 'WhatAreYouTodo', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhatAreYouTodo_CH_2', '转入到Search.htm页面上去', 'WhatAreYouTodo', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhenOverSize_CH_0', '不处理', 'WhenOverSize', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhenOverSize_CH_1', '向下顺增行', 'WhenOverSize', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhenOverSize_CH_2', '次页显示', 'WhenOverSize', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoExeIt_CH_0', '操作员执行', 'WhoExeIt', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoExeIt_CH_1', '机器执行', 'WhoExeIt', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoExeIt_CH_2', '混合执行', 'WhoExeIt', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoIsPK_CH_0', 'WorkID是主键', 'WhoIsPK', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoIsPK_CH_1', 'FID是主键(干流程的WorkID)', 'WhoIsPK', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoIsPK_CH_2', '父流程ID是主键', 'WhoIsPK', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoIsPK_CH_3', '延续流程ID是主键', 'WhoIsPK', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoIsPK_CH_4', 'P2WorkID是主键', 'WhoIsPK', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WhoIsPK_CH_5', 'P3WorkID是主键', 'WhoIsPK', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardH_CH_0', '75%', 'WinCardH', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardH_CH_1', '50%', 'WinCardH', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardH_CH_2', '100%', 'WinCardH', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardH_CH_3', '85%', 'WinCardH', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardH_CH_4', '25%', 'WinCardH', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardW_CH_0', '75%', 'WinCardW', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardW_CH_1', '50%', 'WinCardW', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardW_CH_2', '100%', 'WinCardW', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinCardW_CH_3', '25%', 'WinCardW', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindCtrlWay_CH_0', '任何人都可以使用', 'WindCtrlWay', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindCtrlWay_CH_1', '按照设置的控制', 'WindCtrlWay', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindCtrlWay_CH_2', 'Admin用户可以使用', 'WindCtrlWay', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinDocType_CH_0', 'Html', 'WinDocType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinDocType_CH_1', '系统内置', 'WinDocType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinDocType_CH_2', 'SQL列表', 'WinDocType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinDocType_CH_3', '折线图', 'WinDocType', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinDocType_CH_4', '柱状图', 'WinDocType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WinDocType_CH_5', '饼图', 'WinDocType', 5, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindowsDBType_CH_0', '数据库查询SQL', 'WindowsDBType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindowsDBType_CH_1', '执行Url返回Json', 'WindowsDBType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindowsDBType_CH_2', '执行\\DataUser\\JSLab\\Windows.js的函数.', 'WindowsDBType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindowsShowType_CH_0', '饼图', 'WindowsShowType', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindowsShowType_CH_1', '柱图', 'WindowsShowType', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindowsShowType_CH_2', '折线图', 'WindowsShowType', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('WindowsShowType_CH_4', '简单Table', 'WindowsShowType', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('YBFlowReturnRole_CH_0', '不能退回', 'YBFlowReturnRole', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('YBFlowReturnRole_CH_1', '退回到父流程的开始节点', 'YBFlowReturnRole', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('YBFlowReturnRole_CH_2', '退回到父流程的任何节点', 'YBFlowReturnRole', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('YBFlowReturnRole_CH_3', '退回父流程的启动节点', 'YBFlowReturnRole', 3, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('YBFlowReturnRole_CH_4', '可退回到指定的节点', 'YBFlowReturnRole', 4, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('傻瓜表单显示方式_CH_0', '4列', '傻瓜表单显示方式', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('傻瓜表单显示方式_CH_1', '6列', '傻瓜表单显示方式', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('傻瓜表单显示方式_CH_2', '上下模式3列', '傻瓜表单显示方式', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('实体表单显示列数_CH_0', '4列', '实体表单显示列数', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('实体表单显示列数_CH_1', '6列', '实体表单显示列数', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('显示方式_CH_0', '4列', '显示方式', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('显示方式_CH_1', '6列', '显示方式', 1, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('显示方式_CH_2', '上下模式3列', '显示方式', 2, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('表单展示方式_CH_0', '普通方式', '表单展示方式', 0, 'CH', '', '');
INSERT INTO `sys_enum` VALUES ('表单展示方式_CH_1', '页签方式', '表单展示方式', 1, 'CH', '', '');

-- ----------------------------
-- Table structure for sys_enummain
-- ----------------------------
DROP TABLE IF EXISTS `sys_enummain`;
CREATE TABLE `sys_enummain`  (
  `No` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `CfgVal` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置信息',
  `Lang` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言',
  `EnumKey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'EnumKey',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '枚举' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_enummain
-- ----------------------------

-- ----------------------------
-- Table structure for sys_enver
-- ----------------------------
DROP TABLE IF EXISTS `sys_enver`;
CREATE TABLE `sys_enver`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体类',
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体名',
  `PKValue` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键值',
  `EVer` int(0) NULL DEFAULT NULL COMMENT '版本号',
  `Rec` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '实体版本号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_enver
-- ----------------------------

-- ----------------------------
-- Table structure for sys_enverdtl
-- ----------------------------
DROP TABLE IF EXISTS `sys_enverdtl`;
CREATE TABLE `sys_enverdtl`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `EnName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体名',
  `EnVerPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本主表PK',
  `AttrKey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `AttrName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `OldVal` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '旧值',
  `NewVal` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新值',
  `EnVer` int(0) NULL DEFAULT NULL COMMENT '版本号(日期)',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期',
  `Rec` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '实体修改明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_enverdtl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_filemanager
-- ----------------------------
DROP TABLE IF EXISTS `sys_filemanager`;
CREATE TABLE `sys_filemanager`  (
  `OID` int(0) NOT NULL COMMENT 'OID - 主键',
  `AttrFileName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定名称',
  `AttrFileNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定编号',
  `EnName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的表',
  `RefVal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主键值',
  `WebPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Web路径',
  `MyFileName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `MyFilePath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFilePath',
  `MyFileExt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFileExt',
  `MyFileH` int(0) NULL DEFAULT NULL COMMENT 'MyFileH',
  `MyFileW` int(0) NULL DEFAULT NULL COMMENT 'MyFileW',
  `MyFileSize` float NULL DEFAULT NULL COMMENT 'MyFileSize',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传时间',
  `Rec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传人',
  `Doc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件管理者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_filemanager
-- ----------------------------

-- ----------------------------
-- Table structure for sys_formtree
-- ----------------------------
DROP TABLE IF EXISTS `sys_formtree`;
CREATE TABLE `sys_formtree`  (
  `No` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `ParentNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点No',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  `Idx` int(0) NULL DEFAULT NULL COMMENT 'Idx',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单树' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_formtree
-- ----------------------------
INSERT INTO `sys_formtree` VALUES ('1', '表单树', '0', '', 0);
INSERT INTO `sys_formtree` VALUES ('110', '流程独立表单', '1', '', 0);
INSERT INTO `sys_formtree` VALUES ('111', '常用信息管理', '1', '', 0);
INSERT INTO `sys_formtree` VALUES ('112', '常用单据', '1', '', 0);

-- ----------------------------
-- Table structure for sys_frmattachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmattachment`;
CREATE TABLE `sys_frmattachment`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `NoOfObj` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件标识',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点控制(对sln有效)',
  `AthRunModel` int(0) NULL DEFAULT NULL COMMENT '运行模式,枚举类型:0 流水模式;1 固定模式;2 自定义页面;',
  `AthSaveWay` int(0) NULL DEFAULT NULL COMMENT '保存方式,枚举类型:0 保存到web服务器;1 保存到数据库;2 ftp服务器;',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `Exts` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件格式',
  `NumOfUpload` int(0) NULL DEFAULT NULL COMMENT '最小上传数量',
  `TopNumOfUpload` int(0) NULL DEFAULT NULL COMMENT '最大上传数量',
  `FileMaxSize` int(0) NULL DEFAULT NULL COMMENT '附件最大限制(KB)',
  `UploadFileNumCheck` int(0) NULL DEFAULT NULL COMMENT '上传校验方式,枚举类型:0 不用校验;1 不能为空;2 每个类别下不能为空;',
  `Sort` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `W` float NULL DEFAULT NULL COMMENT '宽度',
  `H` float NULL DEFAULT NULL COMMENT '高度',
  `IsUpload` int(0) NULL DEFAULT NULL COMMENT '是否可以上传',
  `IsVisable` int(0) NULL DEFAULT NULL COMMENT '是否显示附件分组',
  `FileType` int(0) NULL DEFAULT NULL COMMENT '附件类型,枚举类型:0 普通附件;1 图片文件;',
  `ReadRole` int(0) NULL DEFAULT NULL COMMENT '阅读规则,枚举类型:0 不控制;1 未阅读阻止发送;2 未阅读做记录;',
  `PicUploadType` int(0) NULL DEFAULT NULL COMMENT '图片附件上传方式,枚举类型:0 拍照上传或者相册上传;1 只能拍照上传;',
  `DeleteWay` int(0) NULL DEFAULT NULL COMMENT '附件删除规则,枚举类型:0 不能删除;1 删除所有;2 只能删除自己上传的;',
  `IsDownload` int(0) NULL DEFAULT NULL COMMENT '是否可以下载',
  `IsOrder` int(0) NULL DEFAULT NULL COMMENT '是否可以排序',
  `IsIdx` int(0) NULL DEFAULT NULL COMMENT '是否排序?',
  `IsAutoSize` int(0) NULL DEFAULT NULL COMMENT '自动控制大小',
  `IsNote` int(0) NULL DEFAULT NULL COMMENT '是否增加备注',
  `IsExpCol` int(0) NULL DEFAULT NULL COMMENT '是否启用扩展列',
  `IsShowTitle` int(0) NULL DEFAULT NULL COMMENT '是否显示标题列',
  `UploadType` int(0) NULL DEFAULT NULL COMMENT '上传类型,枚举类型:0 单个;1 多个;2 指定;',
  `CtrlWay` int(0) NULL DEFAULT NULL COMMENT '控制呈现控制方式,枚举类型:0 单个;1 多个;2 指定;',
  `AthUploadWay` int(0) NULL DEFAULT NULL COMMENT '控制上传控制方式,枚举类型:0 继承模式;1 协作模式;',
  `DataRefNoOfObj` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应附件标识',
  `AtPara` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  `GroupID` int(0) NULL DEFAULT NULL COMMENT 'GroupID',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `IsTurn2Html` int(0) NULL DEFAULT NULL COMMENT '是否转换成html(方便手机浏览)',
  `IsToHeLiuHZ` int(0) NULL DEFAULT NULL COMMENT '该附件是否要汇总到合流节点上去？(对子线程节点有效)',
  `IsHeLiuHuiZong` int(0) NULL DEFAULT NULL COMMENT '是否是合流节点的汇总附件组件？(对合流节点有效)',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmattachment
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmattachmentdb
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmattachmentdb`;
CREATE TABLE `sys_frmattachmentdb`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_MapData',
  `FK_FrmAttachment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件主键',
  `NoOfObj` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件标识',
  `RefPKVal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体主键',
  `FID` int(0) NULL DEFAULT NULL COMMENT 'FID',
  `NodeID` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `Sort` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别',
  `FileFullName` varchar(700) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `FileName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FileExts` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展',
  `FileSize` float NULL DEFAULT NULL COMMENT '文件大小',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期',
  `Rec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录人',
  `RecName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录人名字',
  `FK_Dept` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在部门',
  `FK_DeptName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在部门名称',
  `MyNote` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `IsRowLock` int(0) NULL DEFAULT NULL COMMENT '是否锁定行',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '排序',
  `UploadGUID` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传GUID',
  `AtPara` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件数据存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmattachmentdb
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmbtn
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmbtn`;
CREATE TABLE `sys_frmbtn`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `Lab` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标签',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `IsView` int(0) NULL DEFAULT NULL COMMENT '是否可见',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '是否起用',
  `UAC` int(0) NULL DEFAULT NULL COMMENT '控制类型',
  `UACContext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '控制内容',
  `EventType` int(0) NULL DEFAULT NULL COMMENT '事件类型',
  `EventContext` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '事件内容',
  `MsgOK` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行成功提示',
  `MsgErr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行失败提示',
  `BtnID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮ID',
  `GroupID` int(0) NULL DEFAULT NULL COMMENT '所在分组',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '按钮' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmbtn
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmeledb
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmeledb`;
CREATE TABLE `sys_frmeledb`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_MapData',
  `EleID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'EleID',
  `RefPKVal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'RefPKVal',
  `FID` int(0) NULL DEFAULT NULL COMMENT 'FID',
  `Tag1` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag1',
  `Tag2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag2',
  `Tag3` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag3',
  `Tag4` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag4',
  `Tag5` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag5',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单元素扩展DB' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmeledb
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmevent
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmevent`;
CREATE TABLE `sys_frmevent`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `EventSource` int(0) NULL DEFAULT NULL COMMENT '事件类型',
  `FK_Event` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件标记',
  `RefFlowNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的流程编号',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID(包含Dtl表)',
  `FK_Flow` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `EventDoType` int(0) NULL DEFAULT NULL COMMENT '事件执行类型',
  `DoDoc` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行内容',
  `MsgOK` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '成功执行提示',
  `MsgError` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常信息提示',
  `MsgCtrl` int(0) NULL DEFAULT NULL COMMENT '消息发送控制,枚举类型:0 不发送;1 按设置的下一步接受人自动发送（默认）;2 由本节点表单系统字段(IsSendEmail,IsSendSMS)来决定;3 由SDK开发者参数(IsSendEmail,IsSendSMS)来决定;',
  `MailEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用邮件发送？(如果启用就要设置邮件模版，支持ccflow表达式。)',
  `MailTitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件标题模版',
  `MailDoc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '邮件内容模版',
  `SMSEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用短信发送？(如果启用就要设置短信模版，支持ccflow表达式。)',
  `SMSDoc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '短信内容模版',
  `MobilePushEnable` int(0) NULL DEFAULT NULL COMMENT '是否推送到手机、pad端。',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'AtPara',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '外部自定义事件(表单,从表,流程,节点)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmevent
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmimg`;
CREATE TABLE `sys_frmimg`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_MapData',
  `KeyOfEn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对应字段',
  `ImgAppType` int(0) NULL DEFAULT NULL COMMENT '应用类型',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `H` float NULL DEFAULT NULL COMMENT 'H',
  `W` float NULL DEFAULT NULL COMMENT 'W',
  `ImgURL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ImgURL',
  `ImgPath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ImgPath',
  `LinkURL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'LinkURL',
  `LinkTarget` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'LinkTarget',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `Tag0` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `ImgSrcType` int(0) NULL DEFAULT NULL COMMENT '图片来源0=本地,1=URL',
  `IsEdit` int(0) NULL DEFAULT NULL COMMENT '是否可以编辑',
  `Name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名称',
  `EnPK` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `ColSpan` int(0) NULL DEFAULT NULL COMMENT '单元格数量',
  `TextColSpan` int(0) NULL DEFAULT NULL COMMENT '文本单元格数量',
  `RowSpan` int(0) NULL DEFAULT NULL COMMENT '行数',
  `GroupID` int(0) NULL DEFAULT NULL COMMENT '显示的分组',
  `GroupIDText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的分组',
  `UIWidth` int(0) NULL DEFAULT 0 COMMENT '宽度',
  `UIHeight` int(0) NULL DEFAULT 0 COMMENT '高度',
  `LabelColSpan` int(0) NULL DEFAULT 1 COMMENT '文本单元格数量',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmimg
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmimgath
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmimgath`;
CREATE TABLE `sys_frmimgath`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `CtrlID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控件ID',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名称',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `H` float NULL DEFAULT NULL COMMENT 'H',
  `W` float NULL DEFAULT NULL COMMENT 'W',
  `IsEdit` int(0) NULL DEFAULT NULL COMMENT '是否可编辑',
  `IsRequired` int(0) NULL DEFAULT NULL COMMENT '是否必填项',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `GroupID` int(0) NULL DEFAULT NULL COMMENT '显示的分组',
  `GroupIDText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的分组',
  `ColSpan` int(0) NULL DEFAULT NULL COMMENT '单元格数量',
  `TextColSpan` int(0) NULL DEFAULT NULL COMMENT '文本单元格数量,枚举类型:1 跨1个单元格;2 跨2个单元格;3 跨3个单元格;4 跨4个单元格;',
  `RowSpan` int(0) NULL DEFAULT NULL COMMENT '行数,枚举类型:1 跨1个行;2 跨2行;3 跨3行;',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片附件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmimgath
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmimgathdb
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmimgathdb`;
CREATE TABLE `sys_frmimgathdb`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `FK_FrmImgAth` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片附件编号',
  `RefPKVal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体主键',
  `FileFullName` varchar(700) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件全路径',
  `FileName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FileExts` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展名',
  `FileSize` float NULL DEFAULT NULL COMMENT '文件大小',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期',
  `Rec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录人',
  `RecName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录人名字',
  `MyNote` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '剪切图片附件数据存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmimgathdb
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmlab
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmlab`;
CREATE TABLE `sys_frmlab`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_MapData',
  `Lab` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Label',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `FontSize` int(0) NULL DEFAULT NULL COMMENT '字体大小',
  `FontColor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `FontName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字体名称',
  `FontStyle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字体风格',
  `FontWeight` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字体宽度',
  `IsBold` int(0) NULL DEFAULT NULL COMMENT '是否粗体',
  `IsItalic` int(0) NULL DEFAULT NULL COMMENT '是否斜体',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmlab
-- ----------------------------
INSERT INTO `sys_frmlab` VALUES ('2aac024a9a844a91aa83afb078fe3809', 'ND102', 'New Label', 79.67, 4.27, 23, '#FF000000', 'Portable User Interface', 'Normal', 'normal', 0, 0, '');
INSERT INTO `sys_frmlab` VALUES ('3f63f04d832c4d9e97063413f3a62ff7', 'ND101', 'New Label', 79.67, 4.27, 23, '#FF000000', 'Portable User Interface', 'Normal', 'normal', 0, 0, '');
INSERT INTO `sys_frmlab` VALUES ('78bd631222ea4fde85fed79ac4c23e30', 'ND102', 'New Label', 605, 490, 14, '#FF000000', 'Portable User Interface', 'Normal', '', 0, 0, '');
INSERT INTO `sys_frmlab` VALUES ('d1455853dabc400d9069ab3b9f775aa8', 'ND103', 'New Label', 605, 490, 14, '#FF000000', 'Portable User Interface', 'Normal', '', 0, 0, '');
INSERT INTO `sys_frmlab` VALUES ('d503ca96427c444ab47dbafab5aea466', 'ND103', 'New Label', 79.67, 4.27, 23, '#FF000000', 'Portable User Interface', 'Normal', 'normal', 0, 0, '');
INSERT INTO `sys_frmlab` VALUES ('dfba4cd5e4b94ef9a1fabf4b76b081fe', 'ND104', 'New Label', 79.67, 4.27, 23, '#FF000000', 'Portable User Interface', 'Normal', 'normal', 0, 0, '');
INSERT INTO `sys_frmlab` VALUES ('e8fa0de0a0904682ad16b9360a5b2b08', 'ND101', 'New Label', 605, 490, 14, '#FF000000', 'Portable User Interface', 'Normal', '', 0, 0, '');
INSERT INTO `sys_frmlab` VALUES ('f57eeb2b05f640a9b1f705fdd8367dc3', 'ND104', 'New Label', 605, 490, 14, '#FF000000', 'Portable User Interface', 'Normal', '', 0, 0, '');

-- ----------------------------
-- Table structure for sys_frmline
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmline`;
CREATE TABLE `sys_frmline`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主表',
  `X1` float NULL DEFAULT NULL COMMENT 'X1',
  `Y1` float NULL DEFAULT NULL COMMENT 'Y1',
  `X2` float NULL DEFAULT NULL COMMENT 'X2',
  `Y2` float NULL DEFAULT NULL COMMENT 'Y2',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `BorderWidth` float NULL DEFAULT NULL COMMENT '宽度',
  `BorderColor` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '初始的GUID',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '线' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmline
-- ----------------------------
INSERT INTO `sys_frmline` VALUES ('1201435d55dd444ebcb7e16c07d65a7e', 'ND103', 81.55, 80, 718.82, 80, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('1356c2fd76314fc287087c17181cd449', 'ND103', 83.36, 40.91, 717.91, 40.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('1a121d80d9024856ac2ee6a8d00c3797', 'ND103', 81.82, 481.82, 720, 481.82, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('2a194acd1c374f4c845ba12282f4230f', 'ND101', 81.55, 80, 718.82, 80, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('3467ad6e0c0b4f46b99dcd285bad82e1', 'ND102', 81.82, 481.82, 720, 481.82, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('4ef5149e09c240d899f7dcbed3708c8a', 'ND104', 83.36, 120.91, 717.91, 120.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('55b666770d5543feb611145f8568e20d', 'ND101', 81.82, 40, 81.82, 480.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('5738d445357e4e11a6fe273d22d18b4a', 'ND103', 83.36, 120.91, 717.91, 120.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('5aed7f8165264b2f80225c61bf02b27d', 'ND104', 719.09, 40, 719.09, 482.73, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('7190a24cb077408f93d9259f06bfc4d1', 'ND102', 719.09, 40, 719.09, 482.73, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('766be2b47f634d9294eda5e914998fb4', 'ND104', 81.55, 80, 718.82, 80, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('81d9bd2313ed440f9eb7b8c0632f3ef4', 'ND104', 81.82, 40, 81.82, 480.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('88662b8496f545898d97b33c13c63704', 'ND101', 719.09, 40, 719.09, 482.73, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('8e197d2043654a7bafc4235f70c4cf74', 'ND104', 83.36, 40.91, 717.91, 40.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('91940bf2eaf945b29d4fd19116cf3b65', 'ND102', 83.36, 120.91, 717.91, 120.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('a0f4377e59a4499ebb61e8289bba21dc', 'ND102', 83.36, 40.91, 717.91, 40.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('ad167878993c46afb8cf359a8091477a', 'ND103', 81.82, 40, 81.82, 480.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('aeff35a625c84fefbded0f0de3191723', 'ND101', 81.82, 481.82, 720, 481.82, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('b29c146c04894f218a646b5b5c0b125b', 'ND101', 83.36, 40.91, 717.91, 40.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('b3b95aeafa2e4f498b4a9e2e6edb8d30', 'ND101', 83.36, 120.91, 717.91, 120.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('b9627cb52c814d609807efe3bbafefcd', 'ND102', 81.55, 80, 718.82, 80, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('db576c7e0bfa4bf39111114de80ca7c3', 'ND103', 719.09, 40, 719.09, 482.73, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('e4cecd24fedb4e73a4140bc9ca21fe18', 'ND102', 81.82, 40, 81.82, 480.91, 9, 9, 2, 'Black', '');
INSERT INTO `sys_frmline` VALUES ('f071811845ce436cbf15e5a87fcab85b', 'ND104', 81.82, 481.82, 720, 481.82, 9, 9, 2, 'Black', '');

-- ----------------------------
-- Table structure for sys_frmlink
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmlink`;
CREATE TABLE `sys_frmlink`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `Lab` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `URLExt` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `Target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接目标(_blank,_parent,_self)',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `FontSize` int(0) NULL DEFAULT NULL COMMENT 'FontSize',
  `FontColor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FontColor',
  `FontName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FontName',
  `FontStyle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FontStyle',
  `IsBold` int(0) NULL DEFAULT NULL COMMENT 'IsBold',
  `IsItalic` int(0) NULL DEFAULT NULL COMMENT 'IsItalic',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `GroupID` int(0) NULL DEFAULT NULL COMMENT '显示的分组',
  `GroupIDText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的分组',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '超连接' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmlink
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmrb
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmrb`;
CREATE TABLE `sys_frmrb`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `KeyOfEn` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `EnumKey` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '枚举值',
  `Lab` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `IntKey` int(0) NULL DEFAULT NULL COMMENT 'IntKey',
  `UIIsEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `Script` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '要执行的脚本',
  `FieldsCfg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置信息@FieldName=Sta',
  `SetVal` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设置的值',
  `Tip` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选择后提示的信息',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `AtPara` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单选框' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmrb
-- ----------------------------

-- ----------------------------
-- Table structure for sys_frmsln
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmsln`;
CREATE TABLE `sys_frmsln`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Flow` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `KeyOfEn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `Name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名',
  `EleType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `UIIsEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用',
  `UIVisible` int(0) NULL DEFAULT NULL COMMENT '是否可见',
  `IsSigan` int(0) NULL DEFAULT NULL COMMENT '是否签名',
  `IsNotNull` int(0) NULL DEFAULT NULL COMMENT '是否为空',
  `RegularExp` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '正则表达式',
  `IsWriteToFlowTable` int(0) NULL DEFAULT NULL COMMENT '是否写入流程表',
  `IsWriteToGenerWorkFlow` int(0) NULL DEFAULT NULL COMMENT '是否写入流程注册表',
  `DefVal` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单字段方案' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_frmsln
-- ----------------------------

-- ----------------------------
-- Table structure for sys_glovar
-- ----------------------------
DROP TABLE IF EXISTS `sys_glovar`;
CREATE TABLE `sys_glovar`  (
  `No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '键 - 主键',
  `Name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Val` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  `GroupKey` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组值',
  `Note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全局变量' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_glovar
-- ----------------------------
INSERT INTO `sys_glovar` VALUES ('0', '选择系统约定默认值', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@FK_ND', '当前年度', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@FK_YF', '当前月份', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@WebUser.FK_Dept', '登陆人员部门编号', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@WebUser.FK_DeptFullName', '登陆人员部门全称', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@WebUser.FK_DeptName', '登陆人员部门名称', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@WebUser.Name', '登陆人员名称', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@WebUser.No', '登陆人员账号', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@WebUser.OrgName', '登录人员组织名称', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@WebUser.OrgNo', '登录人员组织', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@yyyy年MM月dd日', '当前日期(yyyy年MM月dd日)', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@yyyy年MM月dd日HH时mm分', '当前日期(yyyy年MM月dd日HH时mm分)', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@yy年MM月dd日', '当前日期(yy年MM月dd日)', NULL, 'DefVal', NULL, 0);
INSERT INTO `sys_glovar` VALUES ('@yy年MM月dd日HH时mm分', '当前日期(yy年MM月dd日HH时mm分)', NULL, 'DefVal', NULL, 0);

-- ----------------------------
-- Table structure for sys_groupenstemplate
-- ----------------------------
DROP TABLE IF EXISTS `sys_groupenstemplate`;
CREATE TABLE `sys_groupenstemplate`  (
  `OID` int(0) NOT NULL COMMENT 'OID - 主键',
  `EnName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表称',
  `Name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表名',
  `EnsName` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '报表类名',
  `OperateCol` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作属性',
  `Attrs` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运算属性',
  `Rec` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录人',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报表模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_groupenstemplate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_groupfield
-- ----------------------------
DROP TABLE IF EXISTS `sys_groupfield`;
CREATE TABLE `sys_groupfield`  (
  `OID` int(0) NOT NULL COMMENT 'OID - 主键',
  `Lab` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `FrmID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `CtrlType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控件类型',
  `CtrlID` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控件ID',
  `IsZDMobile` int(0) NULL DEFAULT NULL COMMENT '是否折叠(Mobile)',
  `ShowType` int(0) NULL DEFAULT NULL COMMENT '分组显示模式,枚举类型:0 显示;1 PC折叠;2 隐藏;',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `AtPara` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '傻瓜表单分组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_groupfield
-- ----------------------------
INSERT INTO `sys_groupfield` VALUES (100, '填写请假申请单', 'ND101', '', '', 0, 0, 1, '', '');
INSERT INTO `sys_groupfield` VALUES (101, '流程信息', 'ND1Rpt', '', '', 0, 0, 1, '', '');
INSERT INTO `sys_groupfield` VALUES (102, '填写请假申请单', 'ND102', '', '', 0, 0, 1, '', '');
INSERT INTO `sys_groupfield` VALUES (103, '部门经理审批', 'ND102', '', '', 0, 0, 2, '', '');
INSERT INTO `sys_groupfield` VALUES (104, '填写请假申请单', 'ND103', '', '', 0, 0, 1, '', '');
INSERT INTO `sys_groupfield` VALUES (105, '部门经理审批', 'ND103', '', '', 0, 0, 2, '', '');
INSERT INTO `sys_groupfield` VALUES (106, '总经理审批', 'ND103', '', '', 0, 0, 3, '', '');
INSERT INTO `sys_groupfield` VALUES (107, '填写请假申请单', 'ND104', '', '', 0, 0, 1, '', '');
INSERT INTO `sys_groupfield` VALUES (108, '部门经理审批', 'ND104', '', '', 0, 0, 2, '', '');
INSERT INTO `sys_groupfield` VALUES (109, '总经理审批', 'ND104', '', '', 0, 0, 3, '', '');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-01-03 19:49:27', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-01-03 19:49:27', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-01-03 19:49:27', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_langue
-- ----------------------------
DROP TABLE IF EXISTS `sys_langue`;
CREATE TABLE `sys_langue`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Langue` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '语言ID',
  `Model` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块',
  `ModelKey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块实例',
  `Sort` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别',
  `SortKey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别PK',
  `Val` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '语言值',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '语言定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_langue
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_mapattr
-- ----------------------------
DROP TABLE IF EXISTS `sys_mapattr`;
CREATE TABLE `sys_mapattr`  (
  `MyPK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `KeyOfEn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `Name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `DefVal` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '默认值表达式',
  `DefValType` int(0) NULL DEFAULT NULL COMMENT '默认值选择方式,枚举类型:0 默认值为空;1 按照设置的默认值设置;',
  `UIContralType` int(0) NULL DEFAULT NULL COMMENT '控件',
  `MyDataType` int(0) NULL DEFAULT NULL COMMENT '数据类型,枚举类型:1 字符串String;2 整数类型Int;3 浮点类型AppFloat;4 判断类型Boolean;5 双精度类型Double;6 日期型Date;7 时间类型Datetime;8 金额类型AppMoney;',
  `LGType` int(0) NULL DEFAULT NULL COMMENT '类型,枚举类型:0 普通;1 枚举;2 外键;3 打开系统页面;',
  `UIWidth` float NULL DEFAULT NULL COMMENT '宽度',
  `UIHeight` float NULL DEFAULT NULL COMMENT '高度',
  `MinLen` int(0) NULL DEFAULT NULL COMMENT '最小长度',
  `MaxLen` int(0) NULL DEFAULT NULL COMMENT '最大长度',
  `UIBindKey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键SFTable',
  `UIRefKey` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的Key',
  `UIRefKeyText` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定的Text',
  `ExtIsSum` int(0) NULL DEFAULT NULL COMMENT '是否显示合计(对从表有效)',
  `UIVisible` int(0) NULL DEFAULT NULL COMMENT '是否可见？',
  `UIIsEnable` int(0) NULL DEFAULT NULL COMMENT '是否可编辑？',
  `UIIsLine` int(0) NULL DEFAULT NULL COMMENT '是否单独栏显示',
  `UIIsInput` int(0) NULL DEFAULT NULL COMMENT '是否必填项？',
  `IsSecret` int(0) NULL DEFAULT NULL COMMENT '是否保密？',
  `IsRichText` int(0) NULL DEFAULT NULL COMMENT '是否富文本？',
  `IsSupperText` int(0) NULL DEFAULT NULL COMMENT '是否大块文本？(是否该字段存放的超长字节字段)',
  `FontSize` int(0) NULL DEFAULT NULL COMMENT '字体大小',
  `IsSigan` int(0) NULL DEFAULT NULL COMMENT '签名模式,枚举类型:0 无;1 图片签名;2 山东CA;3 广东CA;4 图片盖章;',
  `X` float NULL DEFAULT NULL COMMENT 'X',
  `Y` float NULL DEFAULT NULL COMMENT 'Y',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `EditType` int(0) NULL DEFAULT NULL COMMENT '编辑类型',
  `Tag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '事件内容',
  `Tag1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接目标(_blank,_parent,_self)',
  `Tag2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `Tag3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识3',
  `Tip` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '激活提示',
  `ColSpan` int(0) NULL DEFAULT NULL COMMENT 'TextBox单元格数量,枚举类型:1 跨1个单元格;2 跨2个单元格;3 跨3个单元格;4 跨4个单元格;5 跨5个单元格;6 跨6个单元格;',
  `TextColSpan` int(0) NULL DEFAULT NULL COMMENT 'Label单元格数量,枚举类型:1 跨1个单元格;2 跨2个单元格;3 跨3个单元格;4 跨4个单元格;',
  `RowSpan` int(0) NULL DEFAULT NULL COMMENT '行数',
  `GroupID` int(0) NULL DEFAULT NULL COMMENT '显示的分组',
  `IsEnableInAPP` int(0) NULL DEFAULT NULL COMMENT '是否在移动端中显示',
  `CSSCtrl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控件样式',
  `CSSLabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签样式',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'AtPara',
  `GroupIDText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的分组',
  `CSSCtrlText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '控件样式',
  `DefValText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值（选中）',
  `RBShowModel` int(0) NULL DEFAULT NULL COMMENT '单选按钮的展现方式,枚举类型:0 竖向;3 横向;',
  `ExtDefVal` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统默认值',
  `ExtDefValText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统默认值',
  `CSSLabelText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签样式',
  `TextModel` int(0) NULL DEFAULT 0 COMMENT 'TextModel',
  `LabelColSpan` int(0) NULL DEFAULT 1 COMMENT 'LabelColSpan',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程进度图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_mapattr
-- ----------------------------
INSERT INTO `sys_mapattr` VALUES ('ND101_CDT', 'ND101', 'CDT', '发起时间', '@RDT', 0, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1001, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_Dao', 'ND101', 'Dao', '到', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1008, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_Emps', 'ND101', 'Emps', 'Emps', '', 0, 0, 1, 0, 100, 23, 0, 8000, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1003, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_FID', 'ND101', 'FID', 'FID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1000, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_FK_Dept', 'ND101', 'FK_Dept', '操作员部门', '', 0, 1, 1, 2, 100, 23, 0, 100, 'BP.Port.Depts', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1004, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_FK_NY', 'ND101', 'FK_NY', '年月', '', 0, 0, 1, 0, 100, 23, 0, 7, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1005, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_OID', 'ND101', 'OID', 'OID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 2, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_QingJiaRiQiCong', 'ND101', 'QingJiaRiQiCong', '请假日期从', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1007, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_QingJiaTianShu', 'ND101', 'QingJiaTianShu', '请假天数', '10002', 0, 0, 3, 0, 100, 23, 0, 50, '', '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1009, '0', '@IsSum=0@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_QingJiaYuanYin', 'ND101', 'QingJiaYuanYin', '请假原因', '', 0, 0, 1, 0, 100, 123, 0, 50, '', '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 100, 1, '0', '0', 1010, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_RDT', 'ND101', 'RDT', '更新时间', '@RDT', 0, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_Rec', 'ND101', 'Rec', '发起人', '@WebUser.No', 0, 0, 1, 0, 100, 23, 0, 32, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1002, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_ShenQingRen', 'ND101', 'ShenQingRen', '申请人', '@WebUser.Name', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_ShenQingRenBuMen', 'ND101', 'ShenQingRenBuMen', '申请人部门', '@WebUser.FK_DeptName', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 3, 1, 1, 100, 1, '0', '0', 3, '0', '@FontSize=12@IsRichText=0@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_ShenQingRiJi', 'ND101', 'ShenQingRiJi', '申请日期', '@RDT', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 2, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND101_Title', 'ND101', 'Title', '标题', '', 0, 0, 1, 0, 251, 23, 0, 200, '', '', '', 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 171.2, 68.4, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', -1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_BMJLSP_Checker', 'ND102', 'BMJLSP_Checker', '审核人', '@WebUser.No', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 2, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_BMJLSP_Note', 'ND102', 'BMJLSP_Note', '审核意见', '', 0, 0, 1, 0, 100, 69, 0, 4000, '', '', '', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 103, 1, '0', '0', 1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_BMJLSP_RDT', 'ND102', 'BMJLSP_RDT', '审核日期', '@RDT', 0, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 3, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_CDT', 'ND102', 'CDT', '发起时间', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1001, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_Dao', 'ND102', 'Dao', '到', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1008, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_Emps', 'ND102', 'Emps', 'Emps', '', 0, 0, 1, 0, 100, 23, 0, 8000, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1003, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_FID', 'ND102', 'FID', 'FID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1000, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_FK_Dept', 'ND102', 'FK_Dept', '操作员部门', '', 0, 1, 1, 2, 100, 23, 0, 100, 'BP.Port.Depts', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1004, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_FK_NY', 'ND102', 'FK_NY', '年月', '', 0, 0, 1, 0, 100, 23, 0, 7, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1005, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_OID', 'ND102', 'OID', 'OID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 2, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_QingJiaRiQiCong', 'ND102', 'QingJiaRiQiCong', '请假日期从', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1007, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_QingJiaTianShu', 'ND102', 'QingJiaTianShu', '请假天数', '10002', 0, 0, 3, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1009, '0', '@IsSum=0@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_QingJiaYuanYin', 'ND102', 'QingJiaYuanYin', '请假原因', '', 0, 0, 1, 0, 100, 123, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 103, 1, '0', '0', 1010, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_RDT', 'ND102', 'RDT', '更新时间', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_Rec', 'ND102', 'Rec', '发起人', '', 0, 0, 1, 0, 100, 23, 0, 32, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1002, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_ShenQingRen', 'ND102', 'ShenQingRen', '申请人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 1, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_ShenQingRenBuMen', 'ND102', 'ShenQingRenBuMen', '申请人部门', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 3, 1, 1, 103, 1, '0', '0', 3, '0', '@FontSize=12@IsRichText=0@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_ShenQingRiJi', 'ND102', 'ShenQingRiJi', '申请日期', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 2, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND102_Title', 'ND102', 'Title', '标题', '', 0, 0, 1, 0, 251, 23, 0, 200, '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 171.2, 68.4, '', 1, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', -1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_BMJLSP_Checker', 'ND103', 'BMJLSP_Checker', '审核人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 2, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_BMJLSP_Note', 'ND103', 'BMJLSP_Note', '审核意见', '', 0, 0, 1, 0, 100, 69, 0, 4000, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 106, 1, '0', '0', 1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_BMJLSP_RDT', 'ND103', 'BMJLSP_RDT', '审核日期', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 3, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_CDT', 'ND103', 'CDT', '发起时间', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1001, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_Dao', 'ND103', 'Dao', '到', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1008, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_Emps', 'ND103', 'Emps', 'Emps', '', 0, 0, 1, 0, 100, 23, 0, 8000, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1003, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_FID', 'ND103', 'FID', 'FID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1000, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_FK_Dept', 'ND103', 'FK_Dept', '操作员部门', '', 0, 1, 1, 2, 100, 23, 0, 100, 'BP.Port.Depts', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1004, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_FK_NY', 'ND103', 'FK_NY', '年月', '', 0, 0, 1, 0, 100, 23, 0, 7, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1005, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_OID', 'ND103', 'OID', 'OID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 2, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_QingJiaRiQiCong', 'ND103', 'QingJiaRiQiCong', '请假日期从', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1007, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_QingJiaTianShu', 'ND103', 'QingJiaTianShu', '请假天数', '10002', 0, 0, 3, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1009, '0', '@IsSum=0@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_QingJiaYuanYin', 'ND103', 'QingJiaYuanYin', '请假原因', '', 0, 0, 1, 0, 100, 123, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 106, 1, '0', '0', 1010, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_RDT', 'ND103', 'RDT', '更新时间', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_Rec', 'ND103', 'Rec', '发起人', '', 0, 0, 1, 0, 100, 23, 0, 32, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1002, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_ShenQingRen', 'ND103', 'ShenQingRen', '申请人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 1, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_ShenQingRenBuMen', 'ND103', 'ShenQingRenBuMen', '申请人部门', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 3, 1, 1, 106, 1, '0', '0', 3, '0', '@FontSize=12@IsRichText=0@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_ShenQingRiJi', 'ND103', 'ShenQingRiJi', '申请日期', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 2, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_Title', 'ND103', 'Title', '标题', '', 0, 0, 1, 0, 251, 23, 0, 200, '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 171.2, 68.4, '', 1, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', -1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_ZJLSP_Checker', 'ND103', 'ZJLSP_Checker', '审核人', '@WebUser.No', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 2, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_ZJLSP_Note', 'ND103', 'ZJLSP_Note', '审核意见', '', 0, 0, 1, 0, 100, 69, 0, 4000, '', '', '', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 106, 1, '0', '0', 1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND103_ZJLSP_RDT', 'ND103', 'ZJLSP_RDT', '审核日期', '@RDT', 0, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 106, 1, '0', '0', 3, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_BMJLSP_Checker', 'ND104', 'BMJLSP_Checker', '审核人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 2, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_BMJLSP_Note', 'ND104', 'BMJLSP_Note', '审核意见', '', 0, 0, 1, 0, 100, 69, 0, 4000, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 109, 1, '0', '0', 1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_BMJLSP_RDT', 'ND104', 'BMJLSP_RDT', '审核日期', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 3, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_CDT', 'ND104', 'CDT', '发起时间', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1001, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_Dao', 'ND104', 'Dao', '到', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1008, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_Emps', 'ND104', 'Emps', 'Emps', '', 0, 0, 1, 0, 100, 23, 0, 8000, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1003, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_FID', 'ND104', 'FID', 'FID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1000, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_FK_Dept', 'ND104', 'FK_Dept', '操作员部门', '', 0, 1, 1, 2, 100, 23, 0, 100, 'BP.Port.Depts', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1004, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_FK_NY', 'ND104', 'FK_NY', '年月', '', 0, 0, 1, 0, 100, 23, 0, 7, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1005, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_OID', 'ND104', 'OID', 'OID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 2, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_QingJiaRiQiCong', 'ND104', 'QingJiaRiQiCong', '请假日期从', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1007, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_QingJiaTianShu', 'ND104', 'QingJiaTianShu', '请假天数', '10002', 0, 0, 3, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1009, '0', '@IsSum=0@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_QingJiaYuanYin', 'ND104', 'QingJiaYuanYin', '请假原因', '', 0, 0, 1, 0, 100, 123, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 109, 1, '0', '0', 1010, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_RDT', 'ND104', 'RDT', '更新时间', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_Rec', 'ND104', 'Rec', '发起人', '', 0, 0, 1, 0, 100, 23, 0, 32, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1002, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_ShenQingRen', 'ND104', 'ShenQingRen', '申请人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 1, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_ShenQingRenBuMen', 'ND104', 'ShenQingRenBuMen', '申请人部门', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 3, 1, 1, 109, 1, '0', '0', 3, '0', '@FontSize=12@IsRichText=0@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_ShenQingRiJi', 'ND104', 'ShenQingRiJi', '申请日期', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 2, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_Title', 'ND104', 'Title', '标题', '', 0, 0, 1, 0, 251, 23, 0, 200, '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 171.2, 68.4, '', 1, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', -1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_ZJLSP_Checker', 'ND104', 'ZJLSP_Checker', '审核人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 2, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_ZJLSP_Note', 'ND104', 'ZJLSP_Note', '审核意见', '', 0, 0, 1, 0, 100, 69, 0, 4000, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 109, 1, '0', '0', 1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND104_ZJLSP_RDT', 'ND104', 'ZJLSP_RDT', '审核日期', '', 0, 0, 7, 0, 145, 23, 0, 20, '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 109, 1, '0', '0', 3, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_AtPara', 'ND1Rpt', 'AtPara', '参数', '', 1, 0, 1, 0, 100, 23, 0, 4000, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_BillNo', 'ND1Rpt', 'BillNo', '单据编号', '', 1, 0, 1, 0, 100, 23, 0, 100, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_BMJLSP_Checker', 'ND1Rpt', 'BMJLSP_Checker', '审核人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 1, 1, '0', '0', 2, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_BMJLSP_Note', 'ND1Rpt', 'BMJLSP_Note', '审核意见', '', 0, 0, 1, 0, 100, 69, 0, 4000, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 1, 1, '0', '0', 1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_BMJLSP_RDT', 'ND1Rpt', 'BMJLSP_RDT', '审核日期', '', 0, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 1, 1, '0', '0', 3, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_CDT', 'ND1Rpt', 'CDT', '活动时间', '', 0, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1001, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_Dao', 'ND1Rpt', 'Dao', '到', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1008, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_Emps', 'ND1Rpt', 'Emps', '参与者', '', 0, 0, 1, 0, 100, 23, 0, 8000, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1003, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FID', 'ND1Rpt', 'FID', 'FID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1000, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FK_Dept', 'ND1Rpt', 'FK_Dept', '操作员部门', '', 0, 0, 1, 0, 100, 23, 0, 100, 'BP.Port.Depts', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 101, 1, '0', '0', 1004, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FK_NY', 'ND1Rpt', 'FK_NY', '年月', '', 0, 0, 1, 0, 100, 23, 0, 7, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 101, 1, '0', '0', 1005, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FlowDaySpan', 'ND1Rpt', 'FlowDaySpan', '流程时长(天)', '0', 1, 0, 3, 0, 100, 23, 0, 300, '', '', '', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -101, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FlowEmps', 'ND1Rpt', 'FlowEmps', '参与人', '', 1, 0, 1, 0, 100, 23, 0, 1000, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FlowEnder', 'ND1Rpt', 'FlowEnder', '结束人', '', 1, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -1, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FlowEnderRDT', 'ND1Rpt', 'FlowEnderRDT', '结束时间', '', 1, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -101, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FlowEndNode', 'ND1Rpt', 'FlowEndNode', '结束节点', '0', 1, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -101, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FlowNote', 'ND1Rpt', 'FlowNote', '流程信息', '', 1, 0, 1, 0, 100, 23, 0, 500, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FlowStarter', 'ND1Rpt', 'FlowStarter', '发起人', '', 1, 0, 1, 0, 100, 23, 0, 32, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -1, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_FlowStartRDT', 'ND1Rpt', 'FlowStartRDT', '发起时间', '', 1, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -101, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_GUID', 'ND1Rpt', 'GUID', 'GUID', '', 1, 0, 1, 0, 100, 23, 0, 32, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_OID', 'ND1Rpt', 'OID', 'OID', '0', 0, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 2, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_PEmp', 'ND1Rpt', 'PEmp', '调起子流程的人员', '', 1, 0, 1, 0, 100, 23, 0, 32, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_PFlowNo', 'ND1Rpt', 'PFlowNo', '父流程编号', '', 1, 0, 1, 0, 100, 23, 0, 100, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_PNodeID', 'ND1Rpt', 'PNodeID', '父流程启动的节点', '0', 1, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -101, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_PrjName', 'ND1Rpt', 'PrjName', '项目名称', '', 1, 0, 1, 0, 100, 23, 0, 100, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_PrjNo', 'ND1Rpt', 'PrjNo', '项目编号', '', 1, 0, 1, 0, 100, 23, 0, 100, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -100, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_PWorkID', 'ND1Rpt', 'PWorkID', '父流程WorkID', '0', 1, 0, 2, 0, 100, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -101, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_QingJiaRiQiCong', 'ND1Rpt', 'QingJiaRiQiCong', '请假日期从', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1007, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_QingJiaTianShu', 'ND1Rpt', 'QingJiaTianShu', '请假天数', '10002', 0, 0, 3, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1009, '0', '@IsSum=0@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_QingJiaYuanYin', 'ND1Rpt', 'QingJiaYuanYin', '请假原因', '', 0, 0, 1, 0, 100, 123, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 100, 1, '0', '0', 1010, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_RDT', 'ND1Rpt', 'RDT', '更新时间', '', 0, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 1, '1', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 999, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_Rec', 'ND1Rpt', 'Rec', '发起人', '', 0, 0, 1, 0, 100, 23, 0, 32, '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1002, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_ShenQingRen', 'ND1Rpt', 'ShenQingRen', '申请人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 1, '0', '@IsRichText=0@FontSize=12@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_ShenQingRenBuMen', 'ND1Rpt', 'ShenQingRenBuMen', '申请人部门', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 3, 1, 1, 100, 1, '0', '0', 3, '0', '@FontSize=12@IsRichText=0@IsSupperText=0', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_ShenQingRiJi', 'ND1Rpt', 'ShenQingRiJi', '申请日期', '', 0, 0, 6, 0, 125, 23, 0, 10, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', 2, '0', '@FontSize=12', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_Title', 'ND1Rpt', 'Title', '标题', '', 0, 0, 1, 0, 251, 23, 0, 200, '', '', '', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 171.2, 68.4, '', 1, '', '', '', '', '', 1, 1, 1, 100, 1, '0', '0', -1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_WFSta', 'ND1Rpt', 'WFSta', '状态', '', 1, 1, 2, 1, 100, 23, 0, 1000, 'WFSta', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -1, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_WFState', 'ND1Rpt', 'WFState', '流程状态', '', 1, 1, 2, 1, 100, 23, 0, 1000, 'WFState', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '', 1, '', '', '', '', '', 1, NULL, 1, 101, 1, '0', '0', -1, '0', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_ZJLSP_Checker', 'ND1Rpt', 'ZJLSP_Checker', '审核人', '', 0, 0, 1, 0, 100, 23, 0, 50, '', '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 2, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_ZJLSP_Note', 'ND1Rpt', 'ZJLSP_Note', '审核意见', '', 0, 0, 1, 0, 100, 69, 0, 4000, '', '', '', 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 5, 5, '', 0, '', '', '', '', '', 4, 1, 1, 103, 1, '0', '0', 1, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);
INSERT INTO `sys_mapattr` VALUES ('ND1Rpt_ZJLSP_RDT', 'ND1Rpt', 'ZJLSP_RDT', '审核日期', '', 0, 0, 7, 0, 145, 23, 0, 300, '', '', '', 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 5, 5, '', 0, '', '', '', '', '', 1, 1, 1, 103, 1, '0', '0', 3, '0', '', '0', '0', '0', 0, '0', '0', '0', 0, 1);

-- ----------------------------
-- Table structure for sys_mapdata
-- ----------------------------
DROP TABLE IF EXISTS `sys_mapdata`;
CREATE TABLE `sys_mapdata`  (
  `No` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'null - 主键',
  `Name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'null',
  `FormEventEntity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件实体',
  `EnPK` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体主键',
  `PTable` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物理表',
  `PTableModel` int(0) NULL DEFAULT NULL COMMENT '表存储模式',
  `URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Url',
  `Dtls` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从表',
  `FrmW` int(0) NULL DEFAULT NULL COMMENT '系统表单宽度',
  `FrmH` int(0) NULL DEFAULT NULL COMMENT '系统表单高度',
  `TableCol` int(0) NULL DEFAULT NULL COMMENT '表单显示列数,枚举类型:0 4列;1 6列;2 上下模式3列;',
  `Tag` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag',
  `FK_FrmSort` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单类别',
  `FK_FormTree` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单树',
  `FrmType` int(0) NULL DEFAULT NULL COMMENT '表单类型',
  `FrmShowType` int(0) NULL DEFAULT NULL COMMENT '表单展示方式,枚举类型:0 普通方式;1 页签方式;',
  `EntityType` int(0) NULL DEFAULT NULL COMMENT '业务类型,枚举类型:0 独立表单;1 单据;2 编号名称实体;3 树结构实体;',
  `AppType` int(0) NULL DEFAULT NULL COMMENT '应用类型',
  `DBSrc` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源,外键:对应物理表:Sys_SFDBSrc,表描述:数据源',
  `BodyAttr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单Body属性',
  `Note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `Designer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设计者',
  `DesignerUnit` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `DesignerContact` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `Ver` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `FlowCtrls` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程控件',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'AtPara',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  `DBType` int(0) NULL DEFAULT NULL COMMENT '数据源类型',
  `ExpEn` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体数据源',
  `ExpList` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表数据源',
  `MainTable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表数据源主表',
  `MainTablePK` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表数据源主表主键',
  `ExpCount` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表总数',
  `RowOpenModel` int(0) NULL DEFAULT NULL COMMENT '行记录打开模式,枚举类型:0 新窗口打开;1 弹出窗口打开,关闭后刷新列表;2 弹出窗口打开,关闭后不刷新列表;',
  `SearchDictOpenType` int(0) NULL DEFAULT NULL COMMENT '双击行打开内容,枚举类型:0 MyDictFrameWork.htm 实体与实体相关功能编辑器;1 MyDict.htm 实体编辑器;2 MyBill.htm 单据编辑器;9 自定义URL;',
  `UrlExt` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要打开的Url',
  `PopHeight` int(0) NULL DEFAULT NULL COMMENT '弹窗高度',
  `PopWidth` int(0) NULL DEFAULT NULL COMMENT '弹窗宽度',
  `EntityEditModel` int(0) NULL DEFAULT NULL COMMENT '编辑模式',
  `BillNoFormat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体编号规则',
  `SortColumns` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序字段',
  `ColorSet` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '颜色设置',
  `FieldSet` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段求和求平均设置',
  `ForamtFunc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段格式化函数',
  `TitleRole` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题生成规则',
  `BtnNewLable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新建',
  `BtnNewModel` int(0) NULL DEFAULT NULL COMMENT '新建模式,枚举类型:0 表格模式;1 卡片模式;2 不可用;',
  `BtnSaveLable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存',
  `BtnSubmitLable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交',
  `BtnDelLable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除',
  `BtnSearchLabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表',
  `BtnGroupLabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分析',
  `BtnGroupEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用？',
  `BtnPrintHtml` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印Html',
  `BtnPrintHtmlEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用？',
  `BtnPrintPDF` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印PDF',
  `BtnPrintPDFEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用？',
  `BtnPrintRTF` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印RTF',
  `BtnPrintRTFEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用？',
  `BtnPrintCCWord` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印CCWord',
  `BtnPrintCCWordEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用？',
  `BtnExpZip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导出zip文件',
  `BtnExpZipEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用？',
  `BtnRefBill` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联单据',
  `RefBillRole` int(0) NULL DEFAULT NULL COMMENT '关联单据工作模式,枚举类型:0 不启用;1 非必须选择关联单据;2 必须选择关联单据;',
  `RefBill` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联单据ID',
  `BtnImpExcel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导入Excel文件',
  `BtnImpExcelEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用？',
  `BtnExpExcel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导出Excel文件',
  `BtnExpExcelEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用？',
  `Tag0` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag0',
  `Tag1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Tag1',
  `Tag2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag2',
  `EntityShowModel` int(0) NULL DEFAULT NULL COMMENT '展示模式,枚举类型:0 表格;1 树干模式;',
  `IsTemplate` int(0) NULL DEFAULT NULL COMMENT '是否是表单模版',
  `FK_Flow` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '独立表单属性:FK_Flow',
  `RightViewWay` int(0) NULL DEFAULT NULL COMMENT '报表查看权限控制方式',
  `RightViewTag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '报表查看权限控制Tag',
  `RightDeptWay` int(0) NULL DEFAULT NULL COMMENT '部门数据查看控制方式',
  `RightDeptTag` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '部门数据查看控制Tag',
  `DBURL` int(0) NULL DEFAULT NULL COMMENT 'DBURL',
  `TemplaterVer` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模版编号',
  `DBSave` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Word数据文件存储',
  `MyFileName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单模版',
  `MyFilePath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFilePath',
  `MyFileExt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFileExt',
  `WebPath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'WebPath',
  `MyFileH` int(0) NULL DEFAULT NULL COMMENT 'MyFileH',
  `MyFileW` int(0) NULL DEFAULT NULL COMMENT 'MyFileW',
  `MyFileSize` float(11, 2) NULL DEFAULT NULL COMMENT 'MyFileSize',
  `Icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IsEnableJs` int(0) NULL DEFAULT 0 COMMENT '是否启用自定义js函数？',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_mapdata
-- ----------------------------
INSERT INTO `sys_mapdata` VALUES ('ND101', '填写请假申请单', '', '', 'ND1Rpt', 0, ',/WF/Comm/Handler.ashx', '', 900, 1200, 0, '', '', '', 0, 0, 0, 0, 'local', '', '', '', '', '', 100, '', '2022-01-03 20:11:16', '', '@MapDtls_AutoNum=0@IsHaveCA=0@MapExts_AutoNum=0@FrmEvents_AutoNum=0@FrmRBs_AutoNum=0@FrmImgs_AutoNum=0@MapFrames_AutoNum=0@FrmAttachments_AutoNum=0@FrmImgAths_AutoNum=0', '', 0, '', '', '', '', '', 2, 0, '', 500, 760, 0, '', '', '', '', '', '', '新建', 0, '保存', '提交', '删除', '列表', '分析', 0, '打印Html', 0, '打印PDF', 0, '打印RTF', 0, '打印CCWord', 0, '导出zip文件', 0, '关联单据', 0, '', '导入Excel文件', 1, '导出Excel文件', 1, '', NULL, '', 0, 0, '', 0, NULL, 0, NULL, 0, '', '', '', '', '', '', 0, 0, 0.00, '', 0);
INSERT INTO `sys_mapdata` VALUES ('ND102', '部门经理审批', '', '', 'ND1Rpt', 0, ',/WF/Comm/Handler.ashx', '', 900, 1200, 0, '', '', '', 0, 0, 0, 0, 'local', '', '', '', '', '', 100, '', '2022-01-03 20:11:16', '', '@MapDtls_AutoNum=0@IsHaveCA=0', '', 0, '', '', '', '', '', 2, 0, '', 500, 760, 0, '', '', '', '', '', '', '新建', 0, '保存', '提交', '删除', '列表', '分析', 0, '打印Html', 0, '打印PDF', 0, '打印RTF', 0, '打印CCWord', 0, '导出zip文件', 0, '关联单据', 0, '', '导入Excel文件', 1, '导出Excel文件', 1, '', NULL, '', 0, 0, '', 0, NULL, 0, NULL, 0, '', '', '', '', '', '', 0, 0, 0.00, NULL, 0);
INSERT INTO `sys_mapdata` VALUES ('ND103', '总经理审批', '', '', 'ND1Rpt', 0, ',/WF/Comm/Handler.ashx', '', 900, 1200, 0, '', '', '', 0, 0, 0, 0, 'local', '', '', '', '', '', 100, '', '2022-01-03 20:11:16', '', '@MapDtls_AutoNum=0@IsHaveCA=0', '', 0, '', '', '', '', '', 2, 0, '', 500, 760, 0, '', '', '', '', '', '', '新建', 0, '保存', '提交', '删除', '列表', '分析', 0, '打印Html', 0, '打印PDF', 0, '打印RTF', 0, '打印CCWord', 0, '导出zip文件', 0, '关联单据', 0, '', '导入Excel文件', 1, '导出Excel文件', 1, '', NULL, '', 0, 0, '', 0, NULL, 0, NULL, 0, '', '', '', '', '', '', 0, 0, 0.00, NULL, 0);
INSERT INTO `sys_mapdata` VALUES ('ND104', '反馈给申请人', '', '', 'ND1Rpt', 0, ',/WF/Comm/Handler.ashx', '', 900, 1200, 0, '', '', '', 0, 0, 0, 0, 'local', '', '', '', '', '', 100, '', '2022-01-03 20:11:17', '', '@MapDtls_AutoNum=0@IsHaveCA=0', '', 0, '', '', '', '', '', 2, 0, '', 500, 760, 0, '', '', '', '', '', '', '新建', 0, '保存', '提交', '删除', '列表', '分析', 0, '打印Html', 0, '打印PDF', 0, '打印RTF', 0, '打印CCWord', 0, '导出zip文件', 0, '关联单据', 0, '', '导入Excel文件', 1, '导出Excel文件', 1, '', NULL, '', 0, 0, '', 0, NULL, 0, NULL, 0, '', '', '', '', '', '', 0, 0, 0.00, NULL, 0);
INSERT INTO `sys_mapdata` VALUES ('ND1Rpt', '请假流程-经典表单-演示', '', '', 'ND1Rpt', 0, '', '', 900, 1200, 0, '', '', '', 1, 0, 0, 0, 'local', '', '', '', '', '', 100, '', '2022-01-03 20:11:17', '', '@MapDtls_AutoNum=0@IsHaveCA=0', '', 0, '', '', '', '', '', 2, 0, '', 500, 760, 0, '', '', '', '', '', '', '新建', 0, '保存', '提交', '删除', '列表', '分析', 0, '打印Html', 0, '打印PDF', 0, '打印RTF', 0, '打印CCWord', 0, '导出zip文件', 0, '关联单据', 0, '', '导入Excel文件', 1, '导出Excel文件', 1, '', NULL, '', 0, 0, '', 0, NULL, 0, NULL, 0, '', '', '', '', '', '', 0, 0, 0.00, NULL, 0);

-- ----------------------------
-- Table structure for sys_mapdtl
-- ----------------------------
DROP TABLE IF EXISTS `sys_mapdtl`;
CREATE TABLE `sys_mapdtl`  (
  `No` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `Alias` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '别名',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `PTable` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储表',
  `GroupField` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组字段',
  `RefPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联的主键',
  `FEBD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件类实体类',
  `Model` int(0) NULL DEFAULT NULL COMMENT '工作模式,枚举类型:0 普通;1 固定行;',
  `DtlVer` int(0) NULL DEFAULT NULL COMMENT '使用版本,枚举类型:0 2017传统版;',
  `RowsOfList` int(0) NULL DEFAULT NULL COMMENT '初始化行数',
  `IsEnableGroupField` int(0) NULL DEFAULT NULL COMMENT '是否启用分组字段',
  `IsShowSum` int(0) NULL DEFAULT NULL COMMENT '是否显示合计？',
  `IsShowIdx` int(0) NULL DEFAULT NULL COMMENT '是否显示序号？',
  `IsCopyNDData` int(0) NULL DEFAULT NULL COMMENT '是否允许copy节点数据',
  `IsHLDtl` int(0) NULL DEFAULT NULL COMMENT '是否是合流汇总',
  `IsReadonly` int(0) NULL DEFAULT NULL COMMENT '是否只读？',
  `IsShowTitle` int(0) NULL DEFAULT NULL COMMENT '是否显示标题？',
  `IsView` int(0) NULL DEFAULT NULL COMMENT '是否可见？',
  `IsInsert` int(0) NULL DEFAULT NULL COMMENT '是否可以插入行？',
  `IsDelete` int(0) NULL DEFAULT NULL COMMENT '是否可以删除行？',
  `IsUpdate` int(0) NULL DEFAULT NULL COMMENT '是否可以更新？',
  `IsEnablePass` int(0) NULL DEFAULT NULL COMMENT '是否启用通过审核功能?',
  `IsEnableAthM` int(0) NULL DEFAULT NULL COMMENT '是否启用多附件',
  `IsEnableM2M` int(0) NULL DEFAULT NULL COMMENT '是否启用M2M',
  `IsEnableM2MM` int(0) NULL DEFAULT NULL COMMENT '是否启用M2M',
  `WhenOverSize` int(0) NULL DEFAULT NULL COMMENT '超出行数,枚举类型:0 不处理;1 向下顺增行;2 次页显示;',
  `DtlOpenType` int(0) NULL DEFAULT NULL COMMENT '数据开放类型,枚举类型:0 操作员;1 WorkID-流程ID;2 FID-干流程ID;3 PWorkID-父流程WorkID;',
  `ListShowModel` int(0) NULL DEFAULT NULL COMMENT '列表数据显示格式,枚举类型:0 表格;1 卡片;',
  `EditModel` int(0) NULL DEFAULT NULL COMMENT '编辑数据方式,枚举类型:0 表格模式;1 傻瓜表单;2 自由表单;',
  `MobileShowModel` int(0) NULL DEFAULT NULL COMMENT '移动端数据显示方式,枚举类型:0 新页面显示模式;1 列表模式;',
  `MobileShowField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移动端列表显示字段',
  `X` float NULL DEFAULT NULL COMMENT '距左',
  `Y` float NULL DEFAULT NULL COMMENT '距上',
  `H` float NULL DEFAULT NULL COMMENT '高度',
  `W` float NULL DEFAULT NULL COMMENT '宽度',
  `FrmW` float NULL DEFAULT NULL COMMENT '表单宽度',
  `FrmH` float NULL DEFAULT NULL COMMENT '表单高度',
  `IsEnableLink` int(0) NULL DEFAULT NULL COMMENT '是否启用超链接',
  `LinkLabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超连接标签',
  `LinkTarget` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接目标',
  `LinkUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接URL',
  `FilterSQLExp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '过滤数据SQL表达式',
  `OrderBySQLExp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序字段',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点(用户独立表单权限控制)',
  `ShowCols` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的列',
  `IsExp` int(0) NULL DEFAULT NULL COMMENT '是否可以导入？',
  `ImpModel` int(0) NULL DEFAULT NULL COMMENT '导入方式,枚举类型:0 不导入;1 按配置模式导入;2 按照xls文件模版导入;',
  `ImpSQLSearch` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '查询SQL(SQL里必须包含@Key关键字.)',
  `ImpSQLInit` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '初始化SQL(初始化表格的时候的SQL数据,可以为空)',
  `ImpSQLFullOneRow` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '数据填充一行数据的SQL(必须包含@Key关键字,为选择的主键)',
  `ImpSQLNames` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列的中文名称',
  `IsImp` int(0) NULL DEFAULT NULL COMMENT '是否可以导出？',
  `ColAutoExp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列自动计算表达式',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `AtPara` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  `SubThreadWorker` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子线程处理人字段',
  `SubThreadWorkerText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子线程处理人字段',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_mapdtl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_mapext
-- ----------------------------
DROP TABLE IF EXISTS `sys_mapext`;
CREATE TABLE `sys_mapext`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主表',
  `ExtType` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `DoWay` int(0) NULL DEFAULT NULL COMMENT '执行方式',
  `AttrOfOper` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作的Attr',
  `AttrsOfActive` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '激活的字段',
  `Doc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `Tag` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag',
  `Tag1` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag1',
  `Tag2` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag2',
  `Tag3` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag3',
  `Tag4` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag4',
  `Tag5` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag5',
  `H` int(0) NULL DEFAULT NULL COMMENT '高度',
  `W` int(0) NULL DEFAULT NULL COMMENT '宽度',
  `DBType` int(0) NULL DEFAULT NULL COMMENT '数据类型',
  `FK_DBSrc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `PRI` int(0) NULL DEFAULT NULL COMMENT 'PRI/顺序号',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务逻辑' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_mapext
-- ----------------------------

-- ----------------------------
-- Table structure for sys_mapframe
-- ----------------------------
DROP TABLE IF EXISTS `sys_mapframe`;
CREATE TABLE `sys_mapframe`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `URL` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `FrameURL` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `UrlSrcType` int(0) NULL DEFAULT NULL COMMENT 'URL来源,枚举类型:0 自定义;1 地图;2 流程轨迹表;3 流程轨迹图;',
  `Y` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Y',
  `X` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'x',
  `W` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宽度',
  `H` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高度',
  `IsAutoSize` int(0) NULL DEFAULT NULL COMMENT '是否自动设置大小',
  `EleType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `GUID` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '框架' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_mapframe
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2034 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 987, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2021-12-26 19:13:38', 'admin', '2023-03-07 15:02:51', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 997, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2021-12-26 19:13:38', 'admin', '2023-03-04 10:29:11', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 998, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2021-12-26 19:13:38', 'admin', '2023-03-04 10:29:03', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '其他资源', 0, 9999, 'http://ruoyi.vip', 'menuBlank', 'M', '0', '1', '', 'fa fa-location-arrow', 'admin', '2021-12-26 19:13:38', 'admin', '2023-03-04 10:26:59', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2021-12-26 19:13:38', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2021-12-26 19:13:38', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2021-12-26 19:13:38', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2021-12-26 19:13:38', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2021-12-26 19:13:38', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2021-12-26 19:13:38', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2021-12-26 19:13:38', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2021-12-26 19:13:38', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2021-12-26 19:13:38', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2021-12-26 19:13:38', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2021-12-26 19:13:38', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2021-12-26 19:13:38', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2021-12-26 19:13:38', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2021-12-26 19:13:38', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2021-12-26 19:13:38', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2021-12-26 19:13:38', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2021-12-26 19:13:38', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2021-12-26 19:13:38', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2021-12-26 19:13:38', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2021-12-26 19:13:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '工作流', 0, 4, '#', 'menuItem', 'M', '1', '1', '', 'fa fa-american-sign-language-interpreting', 'admin', '2020-02-13 11:37:55', 'admin', '2023-03-07 15:03:25', '');
INSERT INTO `sys_menu` VALUES (2001, '流程设计器', 2000, 1, '/WF/Admin/Portal/Default.htm', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2020-02-13 14:33:45', 'admin', '2020-02-14 12:54:09', '');
INSERT INTO `sys_menu` VALUES (2002, '流程办理', 2000, 2, '#', 'menuItem', 'M', '0', '1', '', '#', 'admin', '2020-02-13 14:37:43', 'admin', '2020-02-14 12:53:49', '');
INSERT INTO `sys_menu` VALUES (2003, '发起', 2002, 1, '/WF/Start.htm', 'menuItem', 'C', '0', '1', '', '#', 'admin', '2020-02-13 14:38:44', 'admin', '2020-02-13 14:39:24', '');
INSERT INTO `sys_menu` VALUES (2004, '待办', 2002, 2, '/WF/Todolist.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-13 14:39:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '会签', 2002, 3, '/WF/HuiQianList.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-13 14:40:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '在途', 2002, 4, '/WF/Runing.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-13 14:40:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '共享任务', 2002, 5, '/WF/TaskPoolSharing.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-13 14:40:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '申请下来的任务', 2002, 6, '/WF/TaskPoolApply.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-13 14:41:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '流程查询', 2000, 3, '#', 'menuItem', 'M', '0', '1', NULL, '#', 'admin', '2020-02-14 12:47:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '我发起的', 2009, 1, '/WF/Comm/Search.htm?EnsName=BP.WF.Data.MyStartFlows', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:49:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '我审批的', 2009, 2, '/WF/Comm/Search.htm?EnsName=BP.WF.Data.MyJoinFlows', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:49:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '流程分布', 2009, 3, '/WF/RptSearch/DistributedOfMy.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:50:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '我的流程', 2009, 4, '/WF/Search.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:51:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '单流程查询', 2009, 5, '/WF/RptDfine/Flowlist.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:51:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '综合查询', 2009, 6, '/WF/RptSearch/Default.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:52:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '高级功能', 2000, 4, '#', 'menuItem', 'M', '0', '1', NULL, '#', 'admin', '2020-02-14 12:53:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '我的草稿', 2017, 1, '/WF/Draft.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:55:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '抄送', 2017, 2, '/WF/CC.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:55:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '我的关注', 2017, 3, '/WF/Focus.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:56:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '授权待办', 2017, 4, '/WF/TodolistOfAuth.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:56:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '挂起的工作', 2017, 5, '/WF/HungUpList.htm', 'menuItem', 'C', '0', '1', NULL, '#', 'admin', '2020-02-14 12:57:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, 'JFlow流程设计', 0, 100, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-certificate', 'admin', '2023-03-04 10:06:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '流程办理', 0, 101, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-address-book', 'admin', '2023-03-04 10:07:08', 'admin', '2023-03-04 10:13:35', '');
INSERT INTO `sys_menu` VALUES (2025, '流程模板', 2023, 1, '/WF/Portal/Flows.htm', 'menuItem', 'C', '0', '1', NULL, 'fa fa-asterisk', 'admin', '2023-03-04 10:10:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '表单模板', 2023, 2, '/WF/Portal/Frms.htm', 'menuItem', 'C', '0', '1', NULL, 'fa fa-address-card-o', 'admin', '2023-03-04 10:11:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '发起', 2024, 1, '/WF/Start.htm', 'menuItem', 'C', '0', '1', NULL, 'fa fa-fighter-jet', 'admin', '2023-03-04 10:11:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '待办', 2024, 2, '/WF/Todolist.htm', 'menuItem', 'C', '0', '1', NULL, 'fa fa-automobile', 'admin', '2023-03-04 10:12:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '在途', 2024, 3, '/WF/Runing.htm', 'menuItem', 'C', '0', '1', NULL, 'fa fa-asterisk', 'admin', '2023-03-04 10:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, 'JFlow官网', 4, 1, 'http://ccflow.org/?fm=ruoyiApp', 'menuBlank', 'C', '0', '1', NULL, 'fa fa-automobile', 'admin', '2023-03-04 10:25:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, 'JFlow下载', 4, 2, 'https://gitee.com/opencc/', 'menuBlank', 'C', '0', '1', NULL, 'fa fa-asterisk', 'admin', '2023-03-04 10:26:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '在线文档', 4, 3, 'http://doc.ccbpm.cn', 'menuBlank', 'C', '0', '1', '', 'fa fa-automobile', 'admin', '2023-03-04 10:27:41', 'admin', '2023-03-04 10:28:39', '');
INSERT INTO `sys_menu` VALUES (2033, 'ruoyi官网', 4, 6, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '5', 'fa fa-asterisk', 'admin', '2023-03-04 10:28:26', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-01-03 19:49:29', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-01-03 19:49:29', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/ry-jflow/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2023-03-04 10:04:59');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"JFlow流程设计\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"100\"],\"icon\":[\"fa fa-certificate\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:06:40');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"JFlow流程应用\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"101\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:07:09');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2023\"],\"menuType\":[\"C\"],\"menuName\":[\"流程模板\"],\"url\":[\"/WF/Portal/Flows.htm\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-asterisk\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:10:07');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2023\"],\"menuType\":[\"C\"],\"menuName\":[\"表单模板\"],\"url\":[\"/WF/Portal/Frms.htm\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-address-card-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:11:02');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2024\"],\"menuType\":[\"C\"],\"menuName\":[\"发起\"],\"url\":[\"/WF/Start.htm\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-fighter-jet\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:11:44');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2024\"],\"menuType\":[\"C\"],\"menuName\":[\"待办\"],\"url\":[\"/WF/Todolist.htm\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-automobile\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:12:07');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2024\"],\"menuType\":[\"C\"],\"menuName\":[\"在途\"],\"url\":[\"/WF/Runing.htm\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-asterisk\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:12:45');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2024\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"流程办理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"101\"],\"icon\":[\"fa fa-address-book\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:13:36');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"其他资源\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:25:01');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"JFlow官网\"],\"url\":[\"http://ccflow.org/?fm=ruoyiApp\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-automobile\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:25:47');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"JFlow下载\"],\"url\":[\"https://gitee.com/opencc/\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-asterisk\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:26:44');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"其他资源\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"9999\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:26:59');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"在线文档\"],\"url\":[\"http://doc.ccbpm.cn\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:27:41');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"ruoyi官网\"],\"url\":[\"http://ruoyi.vip\"],\"target\":[\"menuBlank\"],\"perms\":[\"5\"],\"orderNum\":[\"6\"],\"icon\":[\"fa fa-asterisk\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:28:27');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2032\"],\"parentId\":[\"4\"],\"menuType\":[\"C\"],\"menuName\":[\"在线文档\"],\"url\":[\"http://doc.ccbpm.cn\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-automobile\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:28:39');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"998\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:29:03');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/ry-jflow/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"997\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2023-03-04 10:29:11');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '总经理', 1, '0', 'admin', '2022-01-03 19:49:13', 'admin', '2023-03-07 14:46:04', '');
INSERT INTO `sys_post` VALUES (2, 'se', '市场部经理', 2, '0', 'admin', '2022-01-03 19:49:13', 'admin', '2023-03-07 14:46:13', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '研发部经理', 3, '0', 'admin', '2022-01-03 19:49:13', 'admin', '2023-03-07 14:46:20', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-01-03 19:49:13', '', NULL, '');
INSERT INTO `sys_post` VALUES (5, 'kfjl', '客服部经理', 4, '0', 'admin', '2023-03-07 14:46:38', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (6, 'cwbjl', '财务部经理', 6, '0', 'admin', '2023-03-07 14:46:52', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (7, 'rlzybjl', '人力资源部经理', 7, '0', 'admin', '2023-03-07 14:47:08', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (8, 'xsryg', '销售人员岗', 8, '0', 'admin', '2023-03-07 14:47:20', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (9, 'cxyg', '程序员岗', 10, '0', 'admin', '2023-03-07 14:47:31', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (10, 'jsfwg', '技术服务岗', 11, '0', 'admin', '2023-03-07 14:47:41', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (11, 'cng', '出纳岗', 12, '0', 'admin', '2023-03-07 14:47:52', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (12, 'rlzyzlg', '人力资源助理岗', 13, '0', 'admin', '2023-03-07 14:48:05', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (13, 'wlryg', '外来人员岗', 14, '0', 'admin', '2023-03-07 14:48:16', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-01-03 19:49:14', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-01-03 19:49:14', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_rptdept
-- ----------------------------
DROP TABLE IF EXISTS `sys_rptdept`;
CREATE TABLE `sys_rptdept`  (
  `FK_Rpt` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表 - 主键',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门,主外键:对应物理表:Port_Dept,表描述:部门',
  PRIMARY KEY (`FK_Rpt`, `FK_Dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报表部门对应信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_rptdept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_rptemp
-- ----------------------------
DROP TABLE IF EXISTS `sys_rptemp`;
CREATE TABLE `sys_rptemp`  (
  `FK_Rpt` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表 - 主键',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人员,主外键:对应物理表:Port_Emp,表描述:用户',
  PRIMARY KEY (`FK_Rpt`, `FK_Emp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报表人员对应信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_rptemp
-- ----------------------------

-- ----------------------------
-- Table structure for sys_rptstation
-- ----------------------------
DROP TABLE IF EXISTS `sys_rptstation`;
CREATE TABLE `sys_rptstation`  (
  `FK_Rpt` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报表 - 主键',
  `FK_Station` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位,主外键:对应物理表:Port_Station,表描述:岗位',
  PRIMARY KEY (`FK_Rpt`, `FK_Station`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报表岗位对应信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_rptstation
-- ----------------------------

-- ----------------------------
-- Table structure for sys_rpttemplate
-- ----------------------------
DROP TABLE IF EXISTS `sys_rpttemplate`;
CREATE TABLE `sys_rpttemplate`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `EnsName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名',
  `FK_Emp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `D1` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'D1',
  `D2` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'D2',
  `D3` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'D3',
  `AlObjs` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要分析的对象',
  `Height` int(0) NULL DEFAULT NULL COMMENT 'Height',
  `Width` int(0) NULL DEFAULT NULL COMMENT 'Width',
  `IsSumBig` int(0) NULL DEFAULT NULL COMMENT '是否显示大合计',
  `IsSumLittle` int(0) NULL DEFAULT NULL COMMENT '是否显示小合计',
  `IsSumRight` int(0) NULL DEFAULT NULL COMMENT '是否显示右合计',
  `PercentModel` int(0) NULL DEFAULT NULL COMMENT '比率显示方式',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '报表模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_rpttemplate
-- ----------------------------

-- ----------------------------
-- Table structure for sys_serial
-- ----------------------------
DROP TABLE IF EXISTS `sys_serial`;
CREATE TABLE `sys_serial`  (
  `CfgKey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'CfgKey - 主键',
  `IntVal` int(0) NULL DEFAULT NULL COMMENT '属性',
  PRIMARY KEY (`CfgKey`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '序列号' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_serial
-- ----------------------------
INSERT INTO `sys_serial` VALUES ('bp.wf.template.FlowSort', 102);
INSERT INTO `sys_serial` VALUES ('OID', 116);
INSERT INTO `sys_serial` VALUES ('UpdataCCFlowVer', 101221030);
INSERT INTO `sys_serial` VALUES ('Ver', 20210422);
INSERT INTO `sys_serial` VALUES ('WorkID', 100);

-- ----------------------------
-- Table structure for sys_sfdbsrc
-- ----------------------------
DROP TABLE IF EXISTS `sys_sfdbsrc`;
CREATE TABLE `sys_sfdbsrc`  (
  `No` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据源编号(必须是英文) - 主键',
  `Name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `DBSrcType` int(0) NULL DEFAULT NULL COMMENT '数据源类型,枚举类型:0 应用系统主数据库(默认);1 SQLServer数据库;2 Oracle数据库;3 MySQL数据库;4 Informix数据库;8 KingBase数据库;50 Dubbo服务;100 WebService数据源;',
  `UserID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库登录用户ID',
  `Password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库登录用户密码',
  `IP` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址/数据库实例名',
  `DBName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称/Oracle保持为空',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sfdbsrc
-- ----------------------------
INSERT INTO `sys_sfdbsrc` VALUES ('local', '本机数据源(默认)', 0, '', '', '', '');

-- ----------------------------
-- Table structure for sys_sftable
-- ----------------------------
DROP TABLE IF EXISTS `sys_sftable`;
CREATE TABLE `sys_sftable`  (
  `No` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表英文名称 - 主键',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表中文名称',
  `SrcType` int(0) NULL DEFAULT NULL COMMENT '数据表类型,枚举类型:0 本地的类;1 创建表;2 表或视图;3 SQL查询表;4 WebServices;5 微服务Handler外部数据源;6 JavaScript外部数据源;7 系统字典表;',
  `CodeStruct` int(0) NULL DEFAULT NULL COMMENT '字典表类型,枚举类型:0 普通的编码表(具有No,Name);1 树结构(具有No,Name,ParentNo);2 行政机构编码表(编码以两位编号标识级次树形关系);',
  `RootVal` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '根节点值',
  `FK_Val` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认创建的字段名',
  `TableDesc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表描述',
  `DefVal` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `NoGenerModel` int(0) NULL DEFAULT NULL COMMENT '编号生成规则,枚举类型:0 自定义;1 流水号;2 标签的全拼;3 标签的简拼;4 按GUID生成;',
  `FK_SFDBSrc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源,外键:对应物理表:Sys_SFDBSrc,表描述:数据源',
  `SrcTable` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表/视图',
  `ColumnValue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的值(编号列/默认为No)',
  `ColumnText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的文字(名称列默认为Name)',
  `ParentValue` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级值(父级列)',
  `SelectStatement` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '查询语句',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入日期',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sftable
-- ----------------------------

-- ----------------------------
-- Table structure for sys_sftabledtl
-- ----------------------------
DROP TABLE IF EXISTS `sys_sftabledtl`;
CREATE TABLE `sys_sftabledtl`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_SFTable` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键表ID',
  `BH` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'BH',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `ParentNo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点ID',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sftabledtl
-- ----------------------------

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Sender` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人(可以为空)',
  `SendTo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送给(可以为空)',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '写入时间',
  `Mobile` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号(可以为空)',
  `MobileSta` int(0) NULL DEFAULT NULL COMMENT '消息状态',
  `MobileInfo` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信信息',
  `Email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Email(可以为空)',
  `EmailSta` int(0) NULL DEFAULT NULL COMMENT 'EmaiSta消息状态',
  `EmailTitle` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `EmailDoc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `SendDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送时间',
  `IsRead` int(0) NULL DEFAULT NULL COMMENT '是否读取?',
  `IsAlert` int(0) NULL DEFAULT NULL COMMENT '是否提示?',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT 'WorkID',
  `MsgFlag` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标记(用于防止发送重复)',
  `MsgType` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型(CC抄送,Todolist待办,Return退回,Etc其他消息...)',
  `AtPara` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_sms
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime(0) NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2023-03-07 17:32:43', '2022-01-03 19:49:12', 'admin', '2022-01-03 19:49:12', '', '2023-03-07 17:32:43', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', '2022-01-03 19:49:12', '2022-01-03 19:49:12', 'admin', '2022-01-03 19:49:12', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 105, 'fuhui', '福惠', '00', '', '', '0', '', '8a10c2ca8448db53fae13fdcca7c7a29', 'bd789c', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:50:23', 'admin', '2023-03-07 15:48:47', '');
INSERT INTO `sys_user` VALUES (101, 105, 'guoxiangbin', '郭祥斌', '00', '', '', '0', '', 'bc3959d8ad579b05896d354c307ac5b0', '759278', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:51:06', 'admin', '2023-03-07 15:48:54', '');
INSERT INTO `sys_user` VALUES (102, 106, 'guobaogeng', '郭宝庚', '00', '', '', '0', '', 'abcfc75bd8319f727ede524432934652', '563a03', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:51:34', 'admin', '2023-03-07 15:48:17', '');
INSERT INTO `sys_user` VALUES (103, 100, 'zhoupeng', '周朋', '00', '', '', '0', '', '49a2f9316e72eccf31fe39373bdb0ec3', '11dbc2', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:52:09', 'admin', '2023-03-07 15:48:06', '');
INSERT INTO `sys_user` VALUES (104, 104, 'zhanghaicheng', '张海成', '00', '', '', '0', '', 'f02279bacf07d9f47862fdb87da3c0d7', 'f5a255', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:52:36', 'admin', '2023-03-07 15:48:00', '');
INSERT INTO `sys_user` VALUES (105, 106, 'zhangyifan', '张一帆', '00', '', '', '0', '', '6430678ff4fbf8c3a7a229e704976057', '931051', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:52:54', 'admin', '2023-03-07 15:47:54', '');
INSERT INTO `sys_user` VALUES (106, 106, 'zhoushengyu', '周升雨', '00', '', '', '0', '', 'fdf9046ef2839d06a7f39be184d088f0', '5f408b', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:53:10', 'admin', '2023-03-07 15:47:40', '');
INSERT INTO `sys_user` VALUES (107, 105, 'qifenglin', '祁凤林', '00', '', '', '0', '', '50ef4b3be4bfdc29d56fbbb4c5784761', 'a5a6e0', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:53:30', 'admin', '2023-03-07 15:47:30', '');
INSERT INTO `sys_user` VALUES (108, 103, 'zhoutianjiao', '周天娇', '00', '', '', '0', '', 'c8aa8063ffc2cd7a0acccf49f2f30848', '6c3b4a', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:53:53', 'admin', '2023-03-07 15:47:23', '');
INSERT INTO `sys_user` VALUES (109, 106, 'yangyilei', '杨依雷', '00', '', '', '0', '', 'a989baef48ab1c68f79449411c5711a7', '396948', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:54:15', 'admin', '2023-03-07 15:47:14', '');
INSERT INTO `sys_user` VALUES (110, 107, 'liping', '李萍', '00', '', '', '0', '', '48006dc998997b94d6c969d9f8f18779', 'c2bd8b', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:54:37', 'admin', '2023-03-07 15:47:03', '');
INSERT INTO `sys_user` VALUES (111, 107, 'liyan', '李言', '00', '', '', '0', '', '3b314c4e79e00b4f7a2326ee2f29e6f6', '07496b', '0', '0', '', NULL, NULL, 'admin', '2023-03-07 14:54:53', 'admin', '2023-03-07 15:46:55', '');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(0) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('70409f11-caae-4312-b59a-055ab7b99e7f', 'admin', '集团研发部门', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', 'on_line', '2023-03-07 17:30:23', '2023-03-07 17:40:22', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (100, 10);
INSERT INTO `sys_user_post` VALUES (101, 4);
INSERT INTO `sys_user_post` VALUES (102, 11);
INSERT INTO `sys_user_post` VALUES (103, 1);
INSERT INTO `sys_user_post` VALUES (104, 2);
INSERT INTO `sys_user_post` VALUES (105, 5);
INSERT INTO `sys_user_post` VALUES (106, 10);
INSERT INTO `sys_user_post` VALUES (107, 5);
INSERT INTO `sys_user_post` VALUES (108, 3);
INSERT INTO `sys_user_post` VALUES (109, 6);
INSERT INTO `sys_user_post` VALUES (110, 5);
INSERT INTO `sys_user_post` VALUES (111, 10);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_userlogt
-- ----------------------------
DROP TABLE IF EXISTS `sys_userlogt`;
CREATE TABLE `sys_userlogt`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Emp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `IP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `LogFlag` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识',
  `Docs` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  `RDT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户日志' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for sys_userregedit
-- ----------------------------
DROP TABLE IF EXISTS `sys_userregedit`;
CREATE TABLE `sys_userregedit`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `EnsName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员',
  `Attrs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '属性s',
  `FK_MapData` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体',
  `AttrKey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段',
  `LB` int(0) NULL DEFAULT NULL COMMENT '类别',
  `CurValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文本',
  `CfgKey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型Flow,Frm',
  `Vals` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `GenerSQL` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GenerSQL',
  `Paras` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Paras',
  `NumKey` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分析的Key',
  `OrderBy` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrderBy',
  `OrderWay` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrderWay',
  `SearchKey` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SearchKey',
  `MVals` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MVals',
  `IsPic` int(0) NULL DEFAULT NULL COMMENT '是否图片',
  `DTFrom` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询时间从',
  `DTTo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'AtPara',
  `OrgNo` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'OrgNo',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '常用语' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for sys_wfsealdata
-- ----------------------------
DROP TABLE IF EXISTS `sys_wfsealdata`;
CREATE TABLE `sys_wfsealdata`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `OID` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OID',
  `FK_Node` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_Node',
  `FK_MapData` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_MapData',
  `SealData` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SealData',
  `RDT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签名信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_wfsealdata
-- ----------------------------

-- ----------------------------
-- Table structure for wf_accepterrole
-- ----------------------------
DROP TABLE IF EXISTS `wf_accepterrole`;
CREATE TABLE `wf_accepterrole`  (
  `OID` int(0) NOT NULL COMMENT 'OID - 主键',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'null',
  `FK_Node` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点',
  `FK_Mode` int(0) NULL DEFAULT NULL COMMENT '模式类型',
  `Tag0` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag0',
  `Tag1` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag1',
  `Tag2` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag2',
  `Tag3` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag3',
  `Tag4` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag4',
  `Tag5` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag5',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接受人规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_accepterrole
-- ----------------------------

-- ----------------------------
-- Table structure for wf_athunreadlog
-- ----------------------------
DROP TABLE IF EXISTS `wf_athunreadlog`;
CREATE TABLE `wf_athunreadlog`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门,外键:对应物理表:Port_Dept,表描述:部门',
  `Title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT 'WorkID',
  `FlowStarter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起人',
  `FlowStartRDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起时间',
  `FK_Flow` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程,外键:对应物理表:WF_Flow,表描述:流程',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `NodeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `FK_Emp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员',
  `FK_EmpDept` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员部门',
  `FK_EmpDeptName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员名称',
  `BeiZhu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `SendDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件未读日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_athunreadlog
-- ----------------------------

-- ----------------------------
-- Table structure for wf_auth
-- ----------------------------
DROP TABLE IF EXISTS `wf_auth`;
CREATE TABLE `wf_auth`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Auther` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权人',
  `AuthType` int(0) NULL DEFAULT NULL COMMENT '类型(0=全部流程1=指定流程)',
  `AutherToEmpNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权给谁?',
  `AutherToEmpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权给谁?',
  `FlowNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FlowName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `TakeBackDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取回日期',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '授权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_auth
-- ----------------------------

-- ----------------------------
-- Table structure for wf_autorpt
-- ----------------------------
DROP TABLE IF EXISTS `wf_autorpt`;
CREATE TABLE `wf_autorpt`  (
  `No` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `DTOfExe` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近执行时间',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `StartDT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起时间点',
  `ToEmpOfSQLs` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知的人员SQL',
  `Dots` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行的时间点(系统写入)',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_autorpt
-- ----------------------------

-- ----------------------------
-- Table structure for wf_autorptdtl
-- ----------------------------
DROP TABLE IF EXISTS `wf_autorptdtl`;
CREATE TABLE `wf_autorptdtl`  (
  `OID` int(0) NOT NULL COMMENT 'OID - 主键',
  `Name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `SQLExp` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SQL表达式(返回一个数字)',
  `UrlExp` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Url表达式',
  `BeiZhu` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `AutoRptNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务ID',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动报表-数据项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_autorptdtl
-- ----------------------------

-- ----------------------------
-- Table structure for wf_bill
-- ----------------------------
DROP TABLE IF EXISTS `wf_bill`;
CREATE TABLE `wf_bill`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT '工作ID',
  `FID` int(0) NULL DEFAULT NULL COMMENT 'FID',
  `FK_Flow` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程',
  `FK_BillType` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据类型',
  `Title` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `FK_Starter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起人',
  `StartDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起时间',
  `Url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Url',
  `FullPath` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FullPath',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人,外键:对应物理表:Port_Emp,表描述:用户',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印时间',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属部门,外键:对应物理表:Port_Dept,表描述:部门',
  `FK_NY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属年月',
  `Emps` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Emps',
  `FK_Node` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点',
  `FK_Bill` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_Bill',
  `MyNum` int(0) NULL DEFAULT NULL COMMENT '个数',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_bill
-- ----------------------------

-- ----------------------------
-- Table structure for wf_billtemplate
-- ----------------------------
DROP TABLE IF EXISTS `wf_billtemplate`;
CREATE TABLE `wf_billtemplate`  (
  `No` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'No - 主键',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `TempFilePath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板路径',
  `NodeID` int(0) NULL DEFAULT NULL COMMENT 'NodeID',
  `FK_MapData` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单编号',
  `BillFileType` int(0) NULL DEFAULT NULL COMMENT '生成的文件类型,枚举类型:0 Word;1 PDF;2 Excel(未完成);3 Html(未完成);',
  `BillOpenModel` int(0) NULL DEFAULT NULL COMMENT '生成的文件打开方式,枚举类型:0 下载本地;1 在线WebOffice打开;',
  `QRModel` int(0) NULL DEFAULT NULL COMMENT '二维码生成方式,枚举类型:0 不生成;1 生成二维码;',
  `TemplateFileModel` int(0) NULL DEFAULT NULL COMMENT '模版模式,枚举类型:0 rtf模版;1 vsto模式的word模版;2 vsto模式的excel模版;',
  `Idx` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Idx',
  `MyFrmID` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单编号',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '单据模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_billtemplate
-- ----------------------------

-- ----------------------------
-- Table structure for wf_ccdept
-- ----------------------------
DROP TABLE IF EXISTS `wf_ccdept`;
CREATE TABLE `wf_ccdept`  (
  `FK_Node` int(0) NOT NULL COMMENT '节点,主外键:对应物理表:WF_Node,表描述:节点',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门,主外键:对应物理表:Port_Dept,表描述:部门',
  PRIMARY KEY (`FK_Node`, `FK_Dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '抄送部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_ccdept
-- ----------------------------

-- ----------------------------
-- Table structure for wf_ccemp
-- ----------------------------
DROP TABLE IF EXISTS `wf_ccemp`;
CREATE TABLE `wf_ccemp`  (
  `FK_Node` int(0) NOT NULL COMMENT '节点 - 主键',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人员,主外键:对应物理表:Port_Emp,表描述:用户',
  PRIMARY KEY (`FK_Node`, `FK_Emp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '抄送人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_ccemp
-- ----------------------------

-- ----------------------------
-- Table structure for wf_cclist
-- ----------------------------
DROP TABLE IF EXISTS `wf_cclist`;
CREATE TABLE `wf_cclist`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `Doc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `Sta` int(0) NULL DEFAULT NULL COMMENT '状态',
  `FK_Flow` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FlowName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点',
  `NodeName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT '工作ID',
  `FID` int(0) NULL DEFAULT NULL COMMENT 'FID',
  `Rec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送人员',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送日期',
  `CCTo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送给',
  `CCToName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送给(人员名称)',
  `CCToOrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送到组织',
  `CCToOrgName` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送给组织名称',
  `CDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打开时间',
  `ReadDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阅读时间',
  `PFlowNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父流程编号',
  `PWorkID` int(0) NULL DEFAULT NULL COMMENT '父流程WorkID',
  `InEmpWorks` int(0) NULL DEFAULT NULL COMMENT '是否加入待办列表',
  `Domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Domain',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '抄送列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_cclist
-- ----------------------------

-- ----------------------------
-- Table structure for wf_ccstation
-- ----------------------------
DROP TABLE IF EXISTS `wf_ccstation`;
CREATE TABLE `wf_ccstation`  (
  `FK_Node` int(0) NOT NULL COMMENT '节点,主外键:对应物理表:WF_Node,表描述:节点',
  `FK_Station` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作岗位,主外键:对应物理表:Port_Station,表描述:岗位',
  PRIMARY KEY (`FK_Node`, `FK_Station`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '抄送岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_ccstation
-- ----------------------------

-- ----------------------------
-- Table structure for wf_ch
-- ----------------------------
DROP TABLE IF EXISTS `wf_ch`;
CREATE TABLE `wf_ch`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT '工作ID',
  `FID` int(0) NULL DEFAULT NULL COMMENT 'FID',
  `Title` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `FK_Flow` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程',
  `FK_FlowT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点',
  `FK_NodeT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `Sender` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人',
  `SenderT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人名称',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当事人',
  `FK_EmpT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当事人名称',
  `GroupEmps` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关当事人',
  `GroupEmpsNames` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关当事人名称',
  `GroupEmpsNum` int(0) NULL DEFAULT NULL COMMENT '相关当事人数量',
  `DTFrom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务下达时间',
  `DTTo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务处理时间',
  `SDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应完成日期',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属部门',
  `FK_DeptT` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `FK_NY` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隶属月份',
  `DTSWay` int(0) NULL DEFAULT NULL COMMENT '考核方式,枚举类型:0 不考核;1 按照时效考核;2 按照工作量考核;',
  `TimeLimit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规定限期',
  `OverMinutes` float NULL DEFAULT NULL COMMENT '逾期分钟',
  `UseDays` float NULL DEFAULT NULL COMMENT '实际使用天',
  `OverDays` float NULL DEFAULT NULL COMMENT '逾期天',
  `CHSta` int(0) NULL DEFAULT NULL COMMENT '状态',
  `WeekNum` int(0) NULL DEFAULT NULL COMMENT '第几周',
  `Points` float NULL DEFAULT NULL COMMENT '总扣分',
  `MyNum` int(0) NULL DEFAULT NULL COMMENT '个数',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '时效考核' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_ch
-- ----------------------------

-- ----------------------------
-- Table structure for wf_cheval
-- ----------------------------
DROP TABLE IF EXISTS `wf_cheval`;
CREATE TABLE `wf_cheval`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `FK_Flow` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FlowName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT '工作ID',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '评价节点',
  `NodeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '停留节点',
  `Rec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价人',
  `RecName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价人名称',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价日期',
  `EvalEmpNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被考核的人员编号',
  `EvalEmpName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被考核的人员名称',
  `EvalCent` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价分值',
  `EvalNote` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `FK_Dept` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `DeptName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `FK_NY` varchar(7) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年月',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作质量评价' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_cheval
-- ----------------------------

-- ----------------------------
-- Table structure for wf_chnode
-- ----------------------------
DROP TABLE IF EXISTS `wf_chnode`;
CREATE TABLE `wf_chnode`  (
  `WorkID` int(0) NULL DEFAULT NULL COMMENT 'WorkID',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点',
  `NodeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `FK_Emp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人',
  `FK_EmpT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人名称',
  `StartDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划开始时间',
  `EndDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划结束时间',
  `GT` int(0) NULL DEFAULT NULL COMMENT '工天',
  `Scale` float NULL DEFAULT NULL COMMENT '阶段占比',
  `TotalScale` float NULL DEFAULT NULL COMMENT '总进度',
  `ChanZhi` float NULL DEFAULT NULL COMMENT '产值',
  `AtPara` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  `MyPK` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'MyPK - 主键',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点时限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_chnode
-- ----------------------------

-- ----------------------------
-- Table structure for wf_cond
-- ----------------------------
DROP TABLE IF EXISTS `wf_cond`;
CREATE TABLE `wf_cond`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `RefFlowNo` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `CondType` int(0) NULL DEFAULT NULL COMMENT '条件类型',
  `DataFrom` int(0) NULL DEFAULT NULL COMMENT '条件数据来源0表单,1岗位(对方向条件有效)',
  `FK_Flow` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程',
  `SubFlowNo` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流程编号',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点ID(对方向条件有效)',
  `ToNodeID` int(0) NULL DEFAULT NULL COMMENT 'ToNodeID（对方向条件有效）',
  `FK_Attr` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性',
  `AttrKey` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性键',
  `AttrName` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名称',
  `FK_Operator` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运算符号',
  `OperatorValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '要运算的值',
  `OperatorValueT` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '要运算的值T',
  `Note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `AtPara` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '条件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_cond
-- ----------------------------

-- ----------------------------
-- Table structure for wf_deptflowsearch
-- ----------------------------
DROP TABLE IF EXISTS `wf_deptflowsearch`;
CREATE TABLE `wf_deptflowsearch`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Emp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  `FK_Flow` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程部门数据查询权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_deptflowsearch
-- ----------------------------

-- ----------------------------
-- Table structure for wf_direction
-- ----------------------------
DROP TABLE IF EXISTS `wf_direction`;
CREATE TABLE `wf_direction`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Flow` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程',
  `Node` int(0) NULL DEFAULT NULL COMMENT '从节点',
  `ToNode` int(0) NULL DEFAULT NULL COMMENT '到节点',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '计算优先级顺序',
  `Des` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程',
  `ToNodeName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '到达节点名称',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点方向信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_direction
-- ----------------------------
INSERT INTO `wf_direction` VALUES ('001_101_102', '001', 101, 102, 0, '', '');
INSERT INTO `wf_direction` VALUES ('001_102_103', '001', 102, 103, 0, '', '');
INSERT INTO `wf_direction` VALUES ('001_103_104', '001', 103, 104, 0, '', '');

-- ----------------------------
-- Table structure for wf_directionstation
-- ----------------------------
DROP TABLE IF EXISTS `wf_directionstation`;
CREATE TABLE `wf_directionstation`  (
  `FK_Direction` int(0) NOT NULL COMMENT '节点 - 主键',
  `FK_Station` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作岗位,主外键:对应物理表:Port_Station,表描述:岗位',
  PRIMARY KEY (`FK_Direction`, `FK_Station`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_directionstation
-- ----------------------------

-- ----------------------------
-- Table structure for wf_doctemplate
-- ----------------------------
DROP TABLE IF EXISTS `wf_doctemplate`;
CREATE TABLE `wf_doctemplate`  (
  `No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'No - 主键',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FilePath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板路径',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `FK_Flow` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公文模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_doctemplate
-- ----------------------------

-- ----------------------------
-- Table structure for wf_emp
-- ----------------------------
DROP TABLE IF EXISTS `wf_emp`;
CREATE TABLE `wf_emp`  (
  `No` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'No - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Name',
  `UseSta` int(0) NULL DEFAULT NULL COMMENT '用户状态0禁用,1正常.',
  `Tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tel',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_Dept',
  `Email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `AlertWay` int(0) NULL DEFAULT NULL COMMENT '收听方式,枚举类型:0 不接收;1 短信;2 邮件;3 内部消息;4 QQ消息;5 RTX消息;6 MSN消息;',
  `Author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权人',
  `AuthorDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权日期',
  `Token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'token',
  `AuthorWay` int(0) NULL DEFAULT NULL COMMENT '授权方式',
  `AuthorToDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权到日期',
  `AuthorFlows` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '可以执行的授权流程',
  `Stas` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位s',
  `Depts` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Deptss',
  `Msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Msg',
  `Style` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Style',
  `OrgNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  `SPass` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片签名密码',
  `Idx` int(0) NULL DEFAULT NULL COMMENT 'Idx',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'AtPara',
  `StartFlows` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '可以发起的流程',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_emp
-- ----------------------------
INSERT INTO `wf_emp` VALUES ('admin', 'admin', 1, '', '', 'zhoupeng@ccflow.org', 3, '', '', '', 0, '', '', '', '', '', '', '', '', 0, '', '{\"Start\":[{\"No\":\"001\",\"Name\":\"请假流程-经典表单-演示\",\"IsBatchStart\":0,\"FK_FlowSort\":\"100\",\"FK_FlowSortText\":\"日常办公类\",\"Domain\":\"\",\"IsStartInMobile\":1,\"Idx\":0}],\"Sort\":[{\"No\":\"100\",\"Name\":\"日常办公类\",\"Domain\":\"\"}]}');
INSERT INTO `wf_emp` VALUES ('fuhui', '福惠', 1, NULL, NULL, 'fuhui@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('guobaogeng', '郭宝庚', 1, NULL, NULL, 'guobaogeng@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('guoxiangbin', '郭祥斌', 1, NULL, NULL, 'guoxiangbin@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('liping', '李萍', 1, NULL, NULL, 'liping@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('liyan', '李言', 1, NULL, NULL, 'liyan@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('qifenglin', '祁凤林', 1, NULL, NULL, 'qifenglin@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('ry', '若依', 1, '15666666666', '105', '', 3, '', '', '', 0, '', '', '', '', '', '', '', '', 0, '', '');
INSERT INTO `wf_emp` VALUES ('yangyilei', '杨依雷', 1, NULL, NULL, 'yangyilei@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('zhanghaicheng', '张海成', 1, NULL, NULL, 'zhanghaicheng@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('zhangyifan', '张一帆', 1, NULL, NULL, 'zhangyifan@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('zhoupeng', '周朋', 1, NULL, NULL, 'zhoupeng@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('zhoushengyu', '周升雨', 1, NULL, NULL, 'zhoushengyu@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');
INSERT INTO `wf_emp` VALUES ('zhoutianjiao', '周天娇', 1, NULL, NULL, 'zhoutianjiao@ccflow.org', 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '');

-- ----------------------------
-- Table structure for wf_findworkerrole
-- ----------------------------
DROP TABLE IF EXISTS `wf_findworkerrole`;
CREATE TABLE `wf_findworkerrole`  (
  `OID` int(0) NOT NULL COMMENT 'OID - 主键',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Name',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `SortVal0` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SortVal0',
  `SortText0` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SortText0',
  `SortVal1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SortVal1',
  `SortText1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SortText1',
  `SortVal2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SortText2',
  `SortText2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SortText2',
  `SortVal3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SortVal3',
  `SortText3` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SortText3',
  `TagVal0` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TagVal0',
  `TagVal1` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TagVal1',
  `TagVal2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TagVal2',
  `TagVal3` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TagVal3',
  `TagText0` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TagText0',
  `TagText1` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TagText1',
  `TagText2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TagText2',
  `TagText3` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TagText3',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用',
  `Idx` int(0) NULL DEFAULT NULL COMMENT 'IDX',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '找人规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_findworkerrole
-- ----------------------------

-- ----------------------------
-- Table structure for wf_flow
-- ----------------------------
DROP TABLE IF EXISTS `wf_flow`;
CREATE TABLE `wf_flow`  (
  `No` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `FK_FlowSort` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程类别,外键:对应物理表:WF_FlowSort,表描述:流程类别',
  `Name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `FlowMark` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程标记',
  `FlowEventEntity` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程事件实体',
  `TitleRole` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题生成规则',
  `IsCanStart` int(0) NULL DEFAULT NULL COMMENT '可以独立启动否？(独立启动的流程可以显示在发起流程列表里)',
  `IsFullSA` int(0) NULL DEFAULT NULL COMMENT '是否自动计算未来的处理人？',
  `GuestFlowRole` int(0) NULL DEFAULT NULL COMMENT '是否外部用户参与流程(非组织结构人员参与的流程)',
  `FlowAppType` int(0) NULL DEFAULT NULL COMMENT '流程应用类型,枚举类型:0 业务流程;1 工程类(项目组流程);2 公文流程(VSTO);',
  `Draft` int(0) NULL DEFAULT NULL COMMENT '草稿规则,枚举类型:0 无(不设草稿);1 保存到待办;2 保存到草稿箱;',
  `FlowDeleteRole` int(0) NULL DEFAULT NULL COMMENT '流程实例删除规则,枚举类型:0 超级管理员可以删除;1 分级管理员可以删除;2 发起人可以删除;3 节点启动删除按钮的操作员;',
  `IsToParentNextNode` int(0) NULL DEFAULT NULL COMMENT '子流程结束时，让父流程自动运行到下一步',
  `HelpUrl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助文档',
  `SysType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统类型',
  `Tester` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起测试人',
  `NodeAppType` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型枚举(可为Null)',
  `NodeAppTypeText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务类型枚举(可为Null)',
  `ChartType` int(0) NULL DEFAULT NULL COMMENT '节点图形类型,枚举类型:0 几何图形;1 肖像图片;',
  `HostRun` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行主机(IP+端口)',
  `IsBatchStart` int(0) NULL DEFAULT NULL COMMENT '是否可以批量发起流程？(如果是就要设置发起的需要填写的字段,多个用逗号分开)',
  `BatchStartFields` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起字段s',
  `HistoryFields` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '历史查看字段',
  `IsResetData` int(0) NULL DEFAULT NULL COMMENT '是否启用开始节点数据重置按钮？已经取消)',
  `IsLoadPriData` int(0) NULL DEFAULT NULL COMMENT '是否自动装载上一笔数据？',
  `IsDBTemplate` int(0) NULL DEFAULT NULL COMMENT '是否启用数据模版？',
  `IsStartInMobile` int(0) NULL DEFAULT NULL COMMENT '是否可以在手机里启用？(如果发起表单特别复杂就不要在手机里启用了)',
  `IsMD5` int(0) NULL DEFAULT NULL COMMENT '是否是数据加密流程(MD5数据加密防篡改)',
  `DataStoreModel` int(0) NULL DEFAULT NULL COMMENT '流程数据存储模式,枚举类型:0 数据轨迹模式;1 数据合并模式;',
  `PTable` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FlowNoteExp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注的表达式',
  `BillNoFormat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据编号格式',
  `BuessFields` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键业务字段',
  `FlowFrmModel` int(0) NULL DEFAULT NULL COMMENT '流程全局表单类型,枚举类型:0 完整版-2019年更早版本;1 绑定表单库的表单;2 表单树模式;3 自定义(嵌入)表单;4 SDK表单;',
  `FrmUrl` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单Url',
  `IsFrmEnable` int(0) NULL DEFAULT NULL COMMENT '是否显示表单',
  `IsTruckEnable` int(0) NULL DEFAULT NULL COMMENT '是否显示轨迹图',
  `IsTimeBaseEnable` int(0) NULL DEFAULT NULL COMMENT '是否显示时间轴',
  `IsTableEnable` int(0) NULL DEFAULT NULL COMMENT '是否显示时间表',
  `IsOPEnable` int(0) NULL DEFAULT NULL COMMENT '是否显示操作',
  `DesignerNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设计者编号',
  `DesignerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设计者名称',
  `DesignTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `FlowRunWay` int(0) NULL DEFAULT NULL COMMENT '运行方式',
  `RunObj` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行内容',
  `Note` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程描述',
  `RunSQL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程结束执行后执行的SQL',
  `NumOfBill` int(0) NULL DEFAULT NULL COMMENT '是否有单据',
  `NumOfDtl` int(0) NULL DEFAULT NULL COMMENT 'NumOfDtl',
  `AvgDay` double NULL DEFAULT NULL COMMENT '平均运行用天',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '显示顺序号(在发起列表中)',
  `SDTOfFlowRole` int(0) NULL DEFAULT NULL COMMENT '流程计划完成日期计算规则',
  `SDTOfFlowRoleSQL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程计划完成日期计算规则SQL',
  `Paras` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `WorkModel` int(0) NULL DEFAULT NULL COMMENT '工作模式',
  `DRCtrlType` int(0) NULL DEFAULT NULL COMMENT '部门查询权限控制方式',
  `StartLimitRole` int(0) NULL DEFAULT NULL COMMENT '启动限制规则',
  `StartLimitPara` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则内容',
  `StartLimitAlert` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '限制提示',
  `StartLimitWhen` int(0) NULL DEFAULT NULL COMMENT '提示时间',
  `StartGuideWay` int(0) NULL DEFAULT NULL COMMENT '前置导航方式',
  `StartGuideLink` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '右侧的连接',
  `StartGuideLab` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接标签',
  `StartGuidePara1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数1',
  `StartGuidePara2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数2',
  `StartGuidePara3` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数3',
  `IsAutoSendSubFlowOver` int(0) NULL DEFAULT NULL COMMENT '(当前节点为子流程时)是否检查所有子流程完成后父流程自动发送',
  `Ver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  `AtPara` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  `DataDTSWay` int(0) NULL DEFAULT NULL COMMENT '同步方式',
  `DTSDBSrc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源',
  `DTSBTable` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务表名',
  `DTSBTablePK` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务表主键',
  `DTSSpecNodes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '同步字段',
  `DTSTime` int(0) NULL DEFAULT NULL COMMENT '执行同步时间点',
  `DTSFields` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要同步的字段s,中间用逗号分开.',
  `MyDeptRole` int(0) NULL DEFAULT NULL COMMENT '本部门发起的流程,枚举类型:0 仅部门领导可以查看;1 部门下所有的人都可以查看;2 本部门里指定岗位的人可以查看;',
  `PStarter` int(0) NULL DEFAULT NULL COMMENT '发起人可看(必选)',
  `PWorker` int(0) NULL DEFAULT NULL COMMENT '参与人可看(必选)',
  `PCCer` int(0) NULL DEFAULT NULL COMMENT '被抄送人可看(必选)',
  `PMyDept` int(0) NULL DEFAULT NULL COMMENT '本部门人可看',
  `PPMyDept` int(0) NULL DEFAULT NULL COMMENT '直属上级部门可看(比如:我是)',
  `PPDept` int(0) NULL DEFAULT NULL COMMENT '上级部门可看',
  `PSameDept` int(0) NULL DEFAULT NULL COMMENT '平级部门可看',
  `PSpecDept` int(0) NULL DEFAULT NULL COMMENT '指定部门可看',
  `PSpecDeptExt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `PSpecSta` int(0) NULL DEFAULT NULL COMMENT '指定的岗位可看',
  `PSpecStaExt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位编号',
  `PSpecGroup` int(0) NULL DEFAULT NULL COMMENT '指定的权限组可看',
  `PSpecGroupExt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限组',
  `PSpecEmp` int(0) NULL DEFAULT NULL COMMENT '指定的人员可看',
  `PSpecEmpExt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定的人员编号',
  `TrackOrderBy` int(0) NULL DEFAULT 0 COMMENT '排序方式',
  `SubFlowShowType` int(0) NULL DEFAULT 0 COMMENT '子流程轨迹图显示模式',
  `IsEnableDBVer` int(0) NULL DEFAULT 0 COMMENT '是否是启用数据版本控制',
  `TitleRoleNodes` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生成标题的节点',
  `CreateDate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Creater` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建人',
  `IsJM` int(0) NULL DEFAULT 0 COMMENT '是否是数据加密流程(把所有字段加密存储)',
  `AdvEmps` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '高级查询人员',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程模版主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_flow
-- ----------------------------
INSERT INTO `wf_flow` VALUES ('001', '100', '请假流程-经典表单-演示', '', '', '', 1, 0, 0, 0, 0, 0, 0, NULL, '', NULL, NULL, NULL, 1, '', 0, '', '', 0, 0, 0, 1, 0, 1, '', '', '', '', 0, '', 1, 1, 1, 1, 1, NULL, NULL, NULL, 0, '', '', '', 0, 0, 0, 0, 0, '', '@StartNodeX=200@StartNodeY=50@EndNodeX=200@EndNodeY=350', 0, 0, 0, '', '', 0, 0, '', '', '', '', '', 0, '2022-01-03 20:11:16', '', '@FrmEvents_AutoNum=0@PushMsgs_AutoNum=0', 0, '', '', '', '', 0, '', 0, 1, 1, 1, 1, 1, 1, 1, 1, '', 1, '', 1, '', 1, '', 0, 0, 0, '', '', '', 0, '');

-- ----------------------------
-- Table structure for wf_floworg
-- ----------------------------
DROP TABLE IF EXISTS `wf_floworg`;
CREATE TABLE `wf_floworg`  (
  `FlowNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '流程 - 主键',
  `OrgNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到组织,主外键:对应物理表:Port_Org,表描述:独立组织',
  PRIMARY KEY (`FlowNo`, `OrgNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程对应组织' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_floworg
-- ----------------------------

-- ----------------------------
-- Table structure for wf_flowsort
-- ----------------------------
DROP TABLE IF EXISTS `wf_flowsort`;
CREATE TABLE `wf_flowsort`  (
  `No` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `ParentNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点No',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `OrgNo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织编号(0为系统组织)',
  `Domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域/系统编号',
  `Idx` int(0) NULL DEFAULT NULL COMMENT 'Idx',
  `ShortName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '简称',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程类别' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_flowsort
-- ----------------------------
INSERT INTO `wf_flowsort` VALUES ('1', '0', '流程树', '0', '', 0, '');
INSERT INTO `wf_flowsort` VALUES ('100', '1', '日常办公类', '0', '', 0, '');
INSERT INTO `wf_flowsort` VALUES ('101', '1', '财务类', '0', '', 0, '');
INSERT INTO `wf_flowsort` VALUES ('102', '1', '人力资源类', '0', '', 0, '');

-- ----------------------------
-- Table structure for wf_frmnode
-- ----------------------------
DROP TABLE IF EXISTS `wf_frmnode`;
CREATE TABLE `wf_frmnode`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点编号',
  `FK_Frm` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `FrmSln` int(0) NULL DEFAULT NULL COMMENT '表单控制方案',
  `FK_Flow` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FrmType` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单类型',
  `IsPrint` int(0) NULL DEFAULT NULL COMMENT '是否可以打印',
  `IsEnableLoadData` int(0) NULL DEFAULT NULL COMMENT '是否启用装载填充事件',
  `IsDefaultOpen` int(0) NULL DEFAULT NULL COMMENT '是否默认打开',
  `IsCloseEtcFrm` int(0) NULL DEFAULT NULL COMMENT '打开时是否关闭其它的页面？',
  `IsEnableFWC` int(0) NULL DEFAULT NULL COMMENT '是否启用审核组件？',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  `WhoIsPK` int(0) NULL DEFAULT NULL COMMENT '谁是主键？',
  `Is1ToN` int(0) NULL DEFAULT NULL COMMENT '是否1变N？',
  `HuiZong` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子线程要汇总的数据表',
  `FrmEnableRole` int(0) NULL DEFAULT NULL COMMENT '表单启用规则',
  `FrmEnableExp` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '启用的表达式',
  `TempleteFile` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模版文件',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '是否显示',
  `GuanJianZiDuan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字段',
  `FrmNameShow` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单显示名字',
  `CheckField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签批字段',
  `BillNoField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据编号字段',
  `CheckFieldText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签批字段',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_frmnode
-- ----------------------------

-- ----------------------------
-- Table structure for wf_frmorg
-- ----------------------------
DROP TABLE IF EXISTS `wf_frmorg`;
CREATE TABLE `wf_frmorg`  (
  `FrmID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单 - 主键',
  `OrgNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到组织,主外键:对应物理表:Port_Org,表描述:独立组织',
  PRIMARY KEY (`FrmID`, `OrgNo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表单对应组织' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_frmorg
-- ----------------------------

-- ----------------------------
-- Table structure for wf_generworkerlist
-- ----------------------------
DROP TABLE IF EXISTS `wf_generworkerlist`;
CREATE TABLE `wf_generworkerlist`  (
  `WorkID` int(0) NOT NULL COMMENT '工作ID - 主键',
  `FK_Emp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '人员 - 主键',
  `FK_Node` int(0) NOT NULL COMMENT '节点ID - 主键',
  `FID` int(0) NULL DEFAULT NULL COMMENT '流程ID',
  `FK_EmpText` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员名称',
  `FK_NodeText` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `FK_Flow` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员所在部门',
  `SDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应完成日期',
  `DTOfWarning` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '警告日期',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录时间(接受工作日期)',
  `CDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成时间',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '是否可用',
  `IsRead` int(0) NULL DEFAULT NULL COMMENT '是否读取',
  `IsPass` int(0) NULL DEFAULT NULL COMMENT '是否通过(对合流节点有效)',
  `WhoExeIt` int(0) NULL DEFAULT NULL COMMENT '谁执行它',
  `Sender` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人',
  `PRI` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `PressTimes` int(0) NULL DEFAULT NULL COMMENT '催办次数',
  `DTOfHungUp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂起时间',
  `DTOfUnHungUp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计解除挂起时间',
  `HungUpTimes` int(0) NULL DEFAULT NULL COMMENT '挂起次数',
  `GuestNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部用户编号',
  `GuestName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部用户名称',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  `AtPara` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'AtPara',
  PRIMARY KEY (`WorkID`, `FK_Emp`, `FK_Node`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_generworkerlist
-- ----------------------------

-- ----------------------------
-- Table structure for wf_generworkflow
-- ----------------------------
DROP TABLE IF EXISTS `wf_generworkflow`;
CREATE TABLE `wf_generworkflow`  (
  `WorkID` int(0) NOT NULL COMMENT 'WorkID - 主键',
  `FID` int(0) NULL DEFAULT NULL COMMENT 'FID',
  `FK_FlowSort` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别,外键:对应物理表:WF_FlowSort,表描述:流程类别',
  `SysType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统类别',
  `FK_Flow` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程,外键:对应物理表:WF_Flow,表描述:流程',
  `FlowName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `Title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `WFSta` int(0) NULL DEFAULT NULL COMMENT '流程状态,枚举类型:0 运行中;1 已完成;2 其他;',
  `WFState` int(0) NULL DEFAULT NULL COMMENT '流程状态,枚举类型:0 空白;1 草稿;2 运行中;3 已完成;4 挂起;5 退回;6 转发;7 删除;8 加签;9 冻结;10 批处理;11 加签回复状态;',
  `Starter` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起人',
  `StarterName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起人',
  `Sender` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录日期',
  `SendDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程活动时间',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT 'FK_Node',
  `NodeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前节点名称',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门,外键:对应物理表:Port_Dept,表描述:部门',
  `DeptName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `PRI` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `SDTOfNode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点应完成时间',
  `SDTOfFlow` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程应完成时间',
  `SDTOfFlowWarning` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程预警时间',
  `PFlowNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PWorkID` int(0) NULL DEFAULT NULL COMMENT '父流程ID',
  `PNodeID` int(0) NULL DEFAULT NULL COMMENT '父流程调用节点',
  `PFID` int(0) NULL DEFAULT NULL COMMENT '父流程调用的PFID',
  `PEmp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `GuestNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户编号',
  `GuestName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  `BillNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据编号',
  `FlowNote` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `TodoEmps` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '待办人员',
  `TodoEmpsNum` int(0) NULL DEFAULT NULL COMMENT '待办人员数量',
  `TaskSta` int(0) NULL DEFAULT NULL COMMENT '共享状态',
  `AtPara` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数(流程运行设置临时存储的参数)',
  `Emps` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参与人(格式:@zhangshan,张三@lishi,李四)',
  `GUID` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'GUID',
  `FK_NY` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月份,外键:对应物理表:Pub_NY,表描述:月份',
  `WeekNum` int(0) NULL DEFAULT NULL COMMENT '周次',
  `TSpan` int(0) NULL DEFAULT NULL COMMENT '时间间隔',
  `TodoSta` int(0) NULL DEFAULT NULL COMMENT '待办状态',
  `Domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域/系统编号',
  `PrjNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PrjNo',
  `PrjName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PrjNo',
  `OrgNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'OrgNo',
  `HungupTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '挂起日期',
  PRIMARY KEY (`WorkID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程查询' ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for wf_hungup
-- ----------------------------
DROP TABLE IF EXISTS `wf_hungup`;
CREATE TABLE `wf_hungup`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT 'WorkID',
  `HungUpWay` int(0) NULL DEFAULT NULL COMMENT '挂起方式,枚举类型:0 无限挂起;1 按指定的时间解除挂起并通知我自己;2 按指定的时间解除挂起并通知所有人;',
  `Note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '挂起原因(标题与内容支持变量)',
  `Rec` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂起人',
  `DTOfHungUp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂起时间',
  `DTOfUnHungUp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际解除挂起时间',
  `DTOfUnHungUpPlan` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计解除挂起时间',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '挂起' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_hungup
-- ----------------------------

-- ----------------------------
-- Table structure for wf_labnote
-- ----------------------------
DROP TABLE IF EXISTS `wf_labnote`;
CREATE TABLE `wf_labnote`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Name` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'null',
  `FK_Flow` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程',
  `X` int(0) NULL DEFAULT NULL COMMENT 'X坐标',
  `Y` int(0) NULL DEFAULT NULL COMMENT 'Y坐标',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_labnote
-- ----------------------------

-- ----------------------------
-- Table structure for wf_node
-- ----------------------------
DROP TABLE IF EXISTS `wf_node`;
CREATE TABLE `wf_node`  (
  `NodeID` int(0) NOT NULL COMMENT 'NodeID - 主键',
  `FK_Flow` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FlowName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `WhoExeIt` int(0) NULL DEFAULT NULL COMMENT '谁执行它,枚举类型:0 操作员执行;1 机器执行;2 混合执行;',
  `ReadReceipts` int(0) NULL DEFAULT NULL COMMENT '已读回执,枚举类型:0 不回执;1 自动回执;2 由上一节点表单字段决定;3 由SDK开发者参数决定;',
  `CancelRole` int(0) NULL DEFAULT NULL COMMENT '撤销规则,枚举类型:0 上一步可以撤销;1 不能撤销;2 上一步与开始节点可以撤销;3 指定的节点可以撤销;',
  `CancelDisWhenRead` int(0) NULL DEFAULT NULL COMMENT '对方已经打开就不能撤销',
  `IsOpenOver` int(0) NULL DEFAULT NULL COMMENT '已阅即完成?',
  `IsSendDraftSubFlow` int(0) NULL DEFAULT NULL COMMENT '是否发送草稿子流程?',
  `IsToParentNextNode` int(0) NULL DEFAULT NULL COMMENT '子流程运行到该节点时，让父流程自动运行到下一步',
  `IsGuestNode` int(0) NULL DEFAULT NULL COMMENT '是否是外部用户执行的节点(非组织结构人员参与处理工作的节点)?',
  `IsYouLiTai` int(0) NULL DEFAULT NULL COMMENT '该节点是否是游离态',
  `FocusField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '焦点字段',
  `NodeAppType` int(0) NULL DEFAULT NULL COMMENT '节点业务类型',
  `FWCSta` int(0) NULL DEFAULT NULL COMMENT '审核组件状态,枚举类型:0 禁用;1 启用;2 只读;',
  `FWCAth` int(0) NULL DEFAULT NULL COMMENT '附件上传,枚举类型:0 不启用;1 多附件;2 单附件(暂不支持);3 图片附件(暂不支持);',
  `DeliveryWay` int(0) NULL DEFAULT NULL COMMENT '运行模式',
  `SelfParas` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义属性',
  `Step` int(0) NULL DEFAULT NULL COMMENT '步骤',
  `Tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作提示',
  `RunModel` int(0) NULL DEFAULT NULL COMMENT '运行模式',
  `SubThreadType` int(0) NULL DEFAULT NULL COMMENT '子线程类型,枚举类型:0 同表单;1 异表单;',
  `PassRate` double NULL DEFAULT NULL COMMENT '完成通过率',
  `SubFlowStartWay` int(0) NULL DEFAULT NULL COMMENT '子线程启动方式,枚举类型:0 不启动;1 指定的字段启动;2 按明细表启动;',
  `SubFlowStartParas` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启动参数',
  `ThreadIsCanDel` int(0) NULL DEFAULT NULL COMMENT '是否可以删除子线程(当前节点已经发送出去的线程，并且当前节点是分流，或者分合流有效，在子线程退回后的操作)？',
  `ThreadIsCanShift` int(0) NULL DEFAULT NULL COMMENT '是否可以移交子线程(当前节点已经发送出去的线程，并且当前节点是分流，或者分合流有效，在子线程退回后的操作)？',
  `IsAllowRepeatEmps` int(0) NULL DEFAULT NULL COMMENT '是否允许子线程接受人员重复(仅当分流点向子线程发送时有效)?',
  `AutoRunEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用自动运行？(仅当分流点向子线程发送时有效)',
  `AutoRunParas` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自动运行SQL',
  `IsSendBackNode` int(0) NULL DEFAULT NULL COMMENT '是否是发送返回节点(发送当前节点,自动发送给该节点的发送人,发送节点.)?',
  `AutoJumpRole0` int(0) NULL DEFAULT NULL COMMENT '处理人就是发起人',
  `AutoJumpRole1` int(0) NULL DEFAULT NULL COMMENT '处理人已经出现过',
  `AutoJumpRole2` int(0) NULL DEFAULT NULL COMMENT '处理人与上一步相同',
  `WhenNoWorker` int(0) NULL DEFAULT NULL COMMENT '(是)找不到人就跳转,(否)提示错误.',
  `SendLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送按钮标签',
  `SendJS` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮JS函数',
  `SaveLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '保存按钮标签',
  `SaveEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `CCLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送按钮标签',
  `CCRole` int(0) NULL DEFAULT NULL COMMENT '抄送规则,枚举类型:0 不能抄送;1 手工抄送;2 自动抄送;3 手工与自动;4 按表单SysCCEmps字段计算;5 在发送前打开抄送窗口;',
  `QRCodeLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码标签',
  `QRCodeRole` int(0) NULL DEFAULT NULL COMMENT '二维码规则,枚举类型:0 无;1 查看流程表单-无需权限;2 查看流程表单-需要登录;3 外部账户协作模式处理工作;',
  `ShiftLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '移交按钮标签',
  `ShiftEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `DelLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除按钮标签',
  `DelEnable` int(0) NULL DEFAULT NULL COMMENT '删除规则,枚举类型:0 不能删除;1 逻辑删除;2 记录日志方式删除;3 彻底删除;4 让用户决定删除方式;',
  `EndFlowLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束流程按钮标签',
  `EndFlowEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `ShowParentFormLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查看父流程按钮标签',
  `ShowParentFormEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `OfficeBtnLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公文按钮标签',
  `OfficeBtnEnable` int(0) NULL DEFAULT NULL COMMENT '文件状态,枚举类型:0 不可用;1 可编辑;2 不可编辑;',
  `OfficeFileType` int(0) NULL DEFAULT NULL COMMENT '文件类型,枚举类型:0 word文件;1 WPS文件;',
  `OfficeBtnLocal` int(0) NULL DEFAULT NULL COMMENT '按钮位置,枚举类型:0 工具栏上;1 表单标签(divID=GovDocFile);',
  `PrintHtmlLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印Html标签',
  `PrintHtmlEnable` int(0) NULL DEFAULT NULL COMMENT '(打印Html)是否启用',
  `PrintHtmlMyView` int(0) NULL DEFAULT NULL COMMENT '(打印Html)显示在查看器工具栏?',
  `PrintHtmlMyCC` int(0) NULL DEFAULT NULL COMMENT '(打印Html)显示在抄送工具栏?',
  `PrintPDFLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印pdf标签',
  `PrintPDFEnable` int(0) NULL DEFAULT NULL COMMENT '(打印pdf)是否启用',
  `PrintPDFMyView` int(0) NULL DEFAULT NULL COMMENT '(打印pdf)显示在查看器工具栏?',
  `PrintPDFMyCC` int(0) NULL DEFAULT NULL COMMENT '(打印pdf)显示在抄送工具栏?',
  `PrintPDFModle` int(0) NULL DEFAULT NULL COMMENT 'PDF打印规则,枚举类型:0 全部打印;1 单个表单打印(针对树形表单);',
  `ShuiYinModle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PDF水印内容',
  `PrintZipLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打包下载zip按钮标签',
  `PrintZipEnable` int(0) NULL DEFAULT NULL COMMENT '(打包下载zip)是否启用',
  `PrintZipMyView` int(0) NULL DEFAULT NULL COMMENT '(打包下载zip)显示在查看器工具栏?',
  `PrintZipMyCC` int(0) NULL DEFAULT NULL COMMENT '(打包下载zip)显示在抄送工具栏?',
  `PrintDocLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印单据按钮标签',
  `PrintDocEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `TrackLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轨迹按钮标签',
  `TrackEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `HungLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '挂起按钮标签',
  `HungEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `SearchLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查询按钮标签',
  `SearchEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `HuiQianLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会签标签',
  `HuiQianRole` int(0) NULL DEFAULT NULL COMMENT '会签模式,枚举类型:0 不启用;1 协作模式;4 组长模式;',
  `HuiQianLeaderRole` int(0) NULL DEFAULT NULL COMMENT '组长会签规则,枚举类型:0 只有一个组长;1 最后一个组长发送;2 任意组长发送;',
  `AddLeaderLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加主持人',
  `AddLeaderEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `TCLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流转自定义',
  `TCEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `PRILab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重要性',
  `PRIEnable` int(0) NULL DEFAULT NULL COMMENT '重要性规则,枚举类型:0 不启用;1 只读;2 编辑;',
  `CHLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点时限',
  `CHRole` int(0) NULL DEFAULT NULL COMMENT '时限规则,枚举类型:0 禁用;1 启用;2 只读;3 启用并可以调整流程应完成时间;',
  `AllotLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分配按钮标签',
  `AllotEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `FocusLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关注',
  `FocusEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `ConfirmLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '确认按钮标签',
  `ConfirmEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `ListLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列表按钮标签',
  `ListEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `BatchLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批量审核标签',
  `BatchEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `NoteLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注标签',
  `NoteEnable` int(0) NULL DEFAULT NULL COMMENT '启用规则,枚举类型:0 禁用;1 启用;2 只读;',
  `HelpLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助标签',
  `HelpRole` int(0) NULL DEFAULT NULL COMMENT '帮助显示规则,枚举类型:0 禁用;1 启用;2 强制提示;3 选择性提示;',
  `NextLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下一条',
  `NextRole` int(0) NULL DEFAULT NULL COMMENT '获得规则,枚举类型:0 禁用;1 相同节点;2 相同流程;3 相同的人;4 不限流程;',
  `ThreadLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子线程按钮标签',
  `ThreadEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `ThreadKillRole` int(0) NULL DEFAULT NULL COMMENT '子线程删除方式,枚举类型:0 不能删除;1 手工删除;2 自动删除;',
  `JumpWayLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转按钮标签',
  `JumpWay` int(0) NULL DEFAULT NULL COMMENT '跳转规则,枚举类型:0 不能跳转;1 只能向后跳转;2 只能向前跳转;3 任意节点跳转;4 按指定规则跳转;',
  `JumpToNodes` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可跳转的节点',
  `ReturnLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退回按钮标签',
  `ReturnRole` int(0) NULL DEFAULT NULL COMMENT '退回规则,枚举类型:0 不能退回;1 只能退回上一个节点;2 可退回以前任意节点;3 可退回指定的节点;4 由流程图设计的退回路线决定;',
  `ReturnAlert` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被退回后信息提示',
  `IsBackTracking` int(0) NULL DEFAULT NULL COMMENT '是否可以原路返回(启用退回功能才有效)',
  `IsKillEtcThread` int(0) NULL DEFAULT NULL COMMENT '是否全部子线程退回(子线程退回到分流节点有效)',
  `ReturnCHEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用退回考核规则',
  `ReturnOneNodeRole` int(0) NULL DEFAULT NULL COMMENT '单节点退回规则,枚举类型:0 不启用;1 按照[退回信息填写字段]作为退回意见直接退回;2 按照[审核组件]填写的信息作为退回意见直接退回;',
  `ReturnField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退回信息填写字段',
  `ReturnReasonsItems` varchar(999) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退回原因',
  `TAlertRole` int(0) NULL DEFAULT NULL COMMENT '逾期提醒规则',
  `TAlertWay` int(0) NULL DEFAULT NULL COMMENT '逾期提醒方式',
  `WAlertRole` int(0) NULL DEFAULT NULL COMMENT '预警提醒规则',
  `WAlertWay` int(0) NULL DEFAULT NULL COMMENT '预警提醒方式',
  `TCent` float NULL DEFAULT NULL COMMENT '扣分(每延期1小时)',
  `CHWay` int(0) NULL DEFAULT NULL COMMENT '考核方式',
  `IsEval` int(0) NULL DEFAULT NULL COMMENT '是否工作质量考核',
  `OutTimeDeal` int(0) NULL DEFAULT NULL COMMENT '超时处理方式',
  `CCWriteTo` int(0) NULL DEFAULT NULL COMMENT '抄送数据写入规则,枚举类型:0 写入抄送列表;1 写入待办;2 写入待办与抄送列表;',
  `CCIsAttr` int(0) NULL DEFAULT NULL COMMENT '按表单字段抄送',
  `CCFormAttr` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送人员字段',
  `CCIsStations` int(0) NULL DEFAULT NULL COMMENT '是否启用？-按照岗位抄送',
  `CCStaWay` int(0) NULL DEFAULT NULL COMMENT '抄送岗位计算方式,枚举类型:0 仅按岗位计算;1 按岗位智能计算(当前节点);2 按岗位智能计算(发送到节点);3 按岗位与部门的交集;4 按直线上级部门找岗位下的人员(当前节点);5 按直线上级部门找岗位下的人员(接受节点);',
  `CCIsDepts` int(0) NULL DEFAULT NULL COMMENT '是否启用？-按照部门抄送',
  `CCIsEmps` int(0) NULL DEFAULT NULL COMMENT '是否启用？-按照人员抄送',
  `CCIsSQLs` int(0) NULL DEFAULT NULL COMMENT '是否启用？-按照SQL抄送',
  `CCSQL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SQL表达式',
  `CCTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抄送标题',
  `CCDoc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '抄送内容(标题与内容支持变量)',
  `FWCLab` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示标签',
  `FWCShowModel` int(0) NULL DEFAULT NULL COMMENT '显示方式,枚举类型:0 表格方式;1 自由模式;',
  `FWCType` int(0) NULL DEFAULT NULL COMMENT '审核组件,枚举类型:0 审核组件;1 日志组件;2 周报组件;3 月报组件;',
  `FWCNodeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点意见名称',
  `FWCTrackEnable` int(0) NULL DEFAULT NULL COMMENT '轨迹图是否显示？',
  `FWCListEnable` int(0) NULL DEFAULT NULL COMMENT '历史审核信息是否显示？(否,仅出现意见框)',
  `FWCIsShowAllStep` int(0) NULL DEFAULT NULL COMMENT '在轨迹表里是否显示所有的步骤？',
  `FWCOpLabel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作名词(审核/审阅/批示)',
  `FWCDefInfo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认审核信息',
  `SigantureEnabel` int(0) NULL DEFAULT NULL COMMENT '操作人显示方式,枚举类型:0 不签名;1 图片签名;2 写字板;',
  `FWCIsFullInfo` int(0) NULL DEFAULT NULL COMMENT '如果用户未审核是否按照默认意见填充？',
  `FWC_X` float(11, 2) NULL DEFAULT NULL COMMENT '位置X',
  `FWC_Y` float(11, 2) NULL DEFAULT NULL COMMENT '位置Y',
  `FWC_H` float(11, 2) NULL DEFAULT NULL COMMENT '高度(0=100%)',
  `FWC_W` float(11, 2) NULL DEFAULT NULL COMMENT '宽度(0=100%)',
  `FWCFields` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批格式字段',
  `FWCIsShowTruck` int(0) NULL DEFAULT NULL COMMENT '是否显示未审核的轨迹？',
  `FWCIsShowReturnMsg` int(0) NULL DEFAULT NULL COMMENT '是否显示退回信息？',
  `FWCOrderModel` int(0) NULL DEFAULT NULL COMMENT '协作模式下操作员显示顺序,枚举类型:0 按审批时间先后排序;1 按照接受人员列表先后顺序(官职大小);',
  `FWCMsgShow` int(0) NULL DEFAULT NULL COMMENT '审核意见显示方式,枚举类型:0 都显示;1 仅显示自己的意见;',
  `FWCVer` int(0) NULL DEFAULT NULL COMMENT '审核意见保存规则,枚举类型:0 1个节点1个人保留1个意见;1 保留节点历史意见(默认);',
  `CheckField` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签批字段',
  `CheckFieldText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签批字段',
  `FWCView` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见立场',
  `CheckNodes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作节点s',
  `ICON` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点ICON图片路径',
  `NodeWorkType` int(0) NULL DEFAULT NULL COMMENT '节点类型',
  `FrmAttr` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FrmAttr',
  `IsBUnit` int(0) NULL DEFAULT NULL COMMENT '是否是节点模版(业务单元)',
  `TimeLimit` float(11, 2) NULL DEFAULT NULL COMMENT '限期(天)',
  `TWay` int(0) NULL DEFAULT NULL COMMENT '时间计算方式',
  `WarningDay` float(11, 2) NULL DEFAULT NULL COMMENT '工作预警(天)',
  `DoOutTime` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '超时处理内容',
  `Doc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `IsTask` int(0) NULL DEFAULT NULL COMMENT '允许分配工作否?',
  `IsDeleteModel` int(0) NULL DEFAULT NULL COMMENT '是否删除中间节点信息(不是原来返回时有效)',
  `IsExpSender` int(0) NULL DEFAULT NULL COMMENT '本节点接收人不允许包含上一步发送人',
  `DeliveryParas` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问规则设置',
  `NodeFrmID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点表单ID',
  `SaveModel` int(0) NULL DEFAULT NULL COMMENT '保存模式',
  `IsCanDelFlow` int(0) NULL DEFAULT NULL COMMENT '是否可以删除流程',
  `TodolistModel` int(0) NULL DEFAULT NULL COMMENT '多人处理规则',
  `TeamLeaderConfirmRole` int(0) NULL DEFAULT NULL COMMENT '组长确认规则',
  `TeamLeaderConfirmDoc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组长确认设置内容',
  `IsRM` int(0) NULL DEFAULT NULL COMMENT '是否启用投递路径自动记忆功能?',
  `IsHandOver` int(0) NULL DEFAULT NULL COMMENT '是否可以移交',
  `BlockModel` int(0) NULL DEFAULT NULL COMMENT '阻塞模式',
  `BlockExp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阻塞表达式',
  `BlockAlert` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '被阻塞提示信息',
  `CondModel` int(0) NULL DEFAULT NULL COMMENT '方向条件控制规则',
  `SFActiveFlows` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可触发的子流程编号(多个用逗号分开)',
  `BatchRole` int(0) NULL DEFAULT NULL COMMENT '批处理',
  `BatchListCount` int(0) NULL DEFAULT NULL COMMENT '批处理数量',
  `BatchParas` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `FormType` int(0) NULL DEFAULT NULL COMMENT '表单类型',
  `FormUrl` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单URL',
  `TurnToDeal` int(0) NULL DEFAULT NULL COMMENT '转向处理',
  `TurnToDealDoc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送后提示信息',
  `NodePosType` int(0) NULL DEFAULT NULL COMMENT '位置',
  `HisStas` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位',
  `HisDeptStrs` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `HisToNDs` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '转到的节点',
  `HisBillIDs` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单据IDs',
  `HisSubFlows` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'HisSubFlows',
  `PTable` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物理表',
  `GroupStaNDs` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位分组节点',
  `X` int(0) NULL DEFAULT NULL COMMENT 'X坐标',
  `Y` int(0) NULL DEFAULT NULL COMMENT 'Y坐标',
  `RefOneFrmTreeType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '独立表单类型',
  `DoOutTimeCond` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行超时的条件',
  `AtPara` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  `SF_H` float(11, 2) NULL DEFAULT NULL COMMENT '高度',
  `SF_W` float(11, 2) NULL DEFAULT NULL COMMENT '宽度',
  `SelectAccepterLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接受人按钮标签',
  `SelectAccepterEnable` int(0) NULL DEFAULT NULL COMMENT '方式,枚举类型:0 不启用;1 单独启用;2 在发送前打开;3 转入新页面;',
  `WorkCheckLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核按钮标签',
  `WorkCheckEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `AskforLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加签标签',
  `AskforEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `WebOffice` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公文标签',
  `WebOfficeEnable` int(0) NULL DEFAULT NULL COMMENT '文档启用方式,枚举类型:0 不启用;1 按钮方式;2 标签页置后方式;3 标签页置前方式;',
  `SFLab` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示标签',
  `SFSta` int(0) NULL DEFAULT NULL COMMENT '组件状态,枚举类型:0 禁用;1 启用;2 只读;',
  `SFShowModel` int(0) NULL DEFAULT NULL COMMENT '显示方式,枚举类型:0 表格方式;1 自由模式;',
  `SFCaption` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接标题',
  `SFDefInfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可启动的子流程编号(多个用逗号分开)',
  `SF_X` float(11, 2) NULL DEFAULT NULL COMMENT '位置X',
  `SF_Y` float(11, 2) NULL DEFAULT NULL COMMENT '位置Y',
  `SFFields` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批格式字段',
  `SFShowCtrl` int(0) NULL DEFAULT NULL COMMENT '显示控制方式,枚举类型:0 可以看所有的子流程;1 仅仅可以看自己发起的子流程;',
  `SFOpenType` int(0) NULL DEFAULT NULL COMMENT '打开子流程显示,枚举类型:0 工作查看器;1 傻瓜表单轨迹查看器;',
  `FrmThreadLab` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示标签',
  `FrmThreadSta` int(0) NULL DEFAULT NULL COMMENT '组件状态,枚举类型:0 禁用;1 启用;',
  `FrmThread_X` float(11, 2) NULL DEFAULT NULL COMMENT '位置X',
  `FrmThread_Y` float(11, 2) NULL DEFAULT NULL COMMENT '位置Y',
  `FrmThread_H` float(11, 2) NULL DEFAULT NULL COMMENT '高度',
  `FrmThread_W` float(11, 2) NULL DEFAULT NULL COMMENT '宽度',
  `FrmTrackLab` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示标签',
  `FrmTrackSta` int(0) NULL DEFAULT NULL COMMENT '组件状态,枚举类型:0 禁用;1 显示轨迹图;2 显示轨迹表;',
  `FrmTrack_X` float(11, 2) NULL DEFAULT NULL COMMENT '位置X',
  `FrmTrack_Y` float(11, 2) NULL DEFAULT NULL COMMENT '位置Y',
  `FrmTrack_H` float(11, 2) NULL DEFAULT NULL COMMENT '高度',
  `FrmTrack_W` float(11, 2) NULL DEFAULT NULL COMMENT '宽度',
  `FTCLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示标签',
  `FTCSta` int(0) NULL DEFAULT NULL COMMENT '组件状态,枚举类型:0 禁用;1 只读;2 可设置人员;',
  `FTCWorkModel` int(0) NULL DEFAULT NULL COMMENT '工作模式,枚举类型:0 简洁模式;1 高级模式;',
  `FTC_X` float(11, 2) NULL DEFAULT NULL COMMENT '位置X',
  `FTC_Y` float(11, 2) NULL DEFAULT NULL COMMENT '位置Y',
  `FTC_H` float(11, 2) NULL DEFAULT NULL COMMENT '高度',
  `FTC_W` float(11, 2) NULL DEFAULT NULL COMMENT '宽度',
  `SelectorModel` int(0) NULL DEFAULT NULL COMMENT '显示方式,枚举类型:0 按岗位;1 按部门;2 按人员;3 按SQL;4 按SQL模版计算;5 使用通用人员选择器;6 部门与岗位的交集;7 自定义Url;8 使用通用部门岗位人员选择器;9 按岗位智能计算(操作员所在部门);',
  `FK_SQLTemplate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SQL模版',
  `FK_SQLTemplateText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SQL模版',
  `IsAutoLoadEmps` int(0) NULL DEFAULT NULL COMMENT '是否自动加载上一次选择的人员？',
  `IsSimpleSelector` int(0) NULL DEFAULT NULL COMMENT '是否单项选择(只能选择一个人)？',
  `IsEnableDeptRange` int(0) NULL DEFAULT NULL COMMENT '是否启用部门搜索范围限定(对使用通用人员选择器有效)？',
  `IsEnableStaRange` int(0) NULL DEFAULT NULL COMMENT '是否启用岗位搜索范围限定(对使用通用人员选择器有效)？',
  `SelectorP1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分组参数:可以为空,比如:SELECT No,Name,ParentNo FROM  Port_Dept',
  `SelectorP2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作员数据源:比如:SELECT No,Name,FK_Dept FROM  Port_Emp',
  `SelectorP3` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '默认选择的数据源:比如:SELECT FK_Emp FROM  WF_GenerWorkerList WHERE FK_Node=102 AND WorkID=@WorkID',
  `SelectorP4` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '强制选择的数据源:比如:SELECT FK_Emp FROM  WF_GenerWorkerList WHERE FK_Node=102 AND WorkID=@WorkID',
  `IsResetAccepter` int(0) NULL DEFAULT 0 COMMENT '可逆节点时是否重新计算接收人',
  `SubFlowX` int(0) NULL DEFAULT 0 COMMENT '子流程设计器位置X',
  `SubFlowY` int(0) NULL DEFAULT 0 COMMENT '子流程设计器位置Y',
  `ScripRole` int(0) NULL DEFAULT 0 COMMENT '小纸条规则',
  `USSWorkIDRole` int(0) NULL DEFAULT 0 COMMENT '是否允许子线程接受人员重复(对子线程点有效)?',
  `IsBackResetAccepter` int(0) NULL DEFAULT 0 COMMENT '原路返回后是否自动计算接收人',
  `ThreadIsCanAdd` int(0) NULL DEFAULT 0 COMMENT '是否可以增加子线程(当前节点已经发送出去的线程，并且当前节点是分流，或者分合流有效)？',
  `AutoJumpExp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表达式',
  `SkipTime` int(0) NULL DEFAULT 0 COMMENT '执行跳转事件',
  `FrmDBVerLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '数据版本' COMMENT '数据版本',
  `FrmDBVerEnable` int(0) NULL DEFAULT 0 COMMENT '是否启用',
  `FrmDBRemarkLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '数据批阅' COMMENT '数据批阅',
  `FrmDBRemarkEnable` int(0) NULL DEFAULT 0 COMMENT '数据批阅',
  `ScripLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '小纸条' COMMENT '小纸条标签',
  `FlowBBSLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '评论' COMMENT '评论标签',
  `FlowBBSRole` int(0) NULL DEFAULT 0 COMMENT '评论规则',
  `IMLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '即时通讯' COMMENT '即时通讯标签',
  `IMEnable` int(0) NULL DEFAULT 0 COMMENT '即时通讯规则',
  `ShowParentFormEnableMyView` int(0) NULL DEFAULT 0 COMMENT '查看父流程是否启用',
  `TrackEnableMyView` int(0) NULL DEFAULT 1 COMMENT '轨迹是否启用',
  `FrmDBVerMyView` int(0) NULL DEFAULT 0 COMMENT '数据版本是否启用',
  `FrmDBRemarkEnableMyView` int(0) NULL DEFAULT 0 COMMENT '数据批阅',
  `PressLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '催办' COMMENT '催办',
  `PressEnable` int(0) NULL DEFAULT 1 COMMENT '是否启用',
  `RollbackLab` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '回滚' COMMENT '回滚',
  `RollbackEnable` int(0) NULL DEFAULT 1 COMMENT '是否启用',
  `ShowParentFormEnableMyCC` int(0) NULL DEFAULT 0 COMMENT '查看父流程是否启用',
  `TrackEnableMyCC` int(0) NULL DEFAULT 1 COMMENT '轨迹是否启用',
  `FrmDBVerMyCC` int(0) NULL DEFAULT 0 COMMENT '数据版本是否启用',
  `AllSubFlowOverRole` int(0) NULL DEFAULT 0 COMMENT '所有子流程结束规则',
  `SkipNodeID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '运行到指定的节点',
  `SkipNodeIDText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '运行到指定的节点',
  PRIMARY KEY (`NodeID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '选择器' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_node
-- ----------------------------
INSERT INTO `wf_node` VALUES (101, '001', '请假流程-经典表单-演示', '填写请假申请单', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 4, '', 1, '', 0, 0, 100, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '发送', '', '保存', 1, '抄送', 0, '二维码', 0, '移交', 0, '删除', 0, '结束流程', 0, '查看父流程', 0, '打开公文', 0, 0, 0, '打印Html', 0, 0, 0, '打印pdf', 0, 0, 0, 0, '', '打包下载', 0, 0, 0, '打印单据', 0, '轨迹', 1, '挂起', 0, '查询', 0, '会签', 0, 0, '加主持人', 0, '流转自定义', 0, '重要性', 0, '节点时限', 0, '分配', 0, '关注', 0, '确认', 0, '列表', 1, '批量审核', 0, '备注', 0, '帮助提示', 0, '下一条', 0, '子线程', 0, 0, '跳转', 0, '', '退回', 0, '', 1, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', '', '', '审核信息', 1, 0, '', 1, 1, 0, '审核', '', 0, 1, 300.00, 500.00, 0.00, 400.00, '', 0, 0, 0, 0, 0, '', '', '', '', '前台', 1, '', 0, 2.00, 0, 1.00, '', '', 1, 0, 1, '', '', 0, 0, 0, 0, '', 1, 0, 0, '', '', 2, '', 0, 12, '', 0, 'http://', 0, '', 0, '', '', '@102', '', '', '', '@101@102@104', 52, 46, '', '', '@IsYouLiTai=0@FrmEvents_AutoNum=0', 300.00, 400.00, '接受人', 0, '审核', 0, '加签', 0, '公文', 0, '子流程', 0, 1, '启动子流程', '', 5.00, 5.00, '', 0, 0, '子线程', 0, 5.00, 5.00, 300.00, 400.00, '轨迹', 0, 5.00, 5.00, 300.00, 400.00, '流转自定义', 0, 0, 5.00, 5.00, 300.00, 400.00, 5, '', '', 1, 0, 0, 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, '数据版本', 0, '数据批阅', 0, '小纸条', '评论', 0, '即时通讯', 0, 0, 1, 0, 0, '催办', 1, '回滚', 1, 0, 1, 0, 0, '', '');
INSERT INTO `wf_node` VALUES (102, '001', '请假流程-经典表单-演示', '部门经理审批', 0, 0, 0, 0, 0, 0, 0, 0, 0, '审核意见:@BMJLSP_Note', 0, 0, 0, 4, '', 2, '', 0, 0, 100, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '发送', '', '保存', 1, '抄送', 0, '二维码', 0, '移交', 0, '删除', 0, '结束流程', 0, '查看父流程', 0, '打开公文', 0, 0, 0, '打印Html', 0, 0, 0, '打印pdf', 0, 0, 0, 0, '', '打包下载', 0, 0, 0, '打印单据', 0, '轨迹', 1, '挂起', 0, '查询', 0, '会签', 0, 0, '加主持人', 0, '流转自定义', 0, '重要性', 0, '节点时限', 0, '分配', 0, '关注', 0, '确认', 0, '列表', 1, '批量审核', 0, '备注', 0, '帮助提示', 0, '下一条', 0, '子线程', 0, 0, '跳转', 0, '', '退回', 1, '', 1, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', '', '', '审核信息', 1, 0, '', 1, 1, 0, '审核', '', 0, 1, 300.00, 500.00, 0.00, 400.00, '', 0, 0, 0, 0, 0, '', '', '', '', '审核', 0, '', 0, 1.00, 1, 1.00, '', '', 1, 0, 1, '', '', 0, 0, 0, 0, '', 1, 0, 0, '', '', 2, '', 0, 12, '', 0, 'http://', 0, '', 1, '', '', '@103', '', '', '', '@101@102@104', 244, 221, '', '', '@IsYouLiTai=0', 300.00, 400.00, '接受人', 0, '审核', 0, '加签', 0, '公文', 0, '子流程', 0, 1, '启动子流程', '', 5.00, 5.00, '', 0, 0, '子线程', 0, 5.00, 5.00, 300.00, 400.00, '轨迹', 0, 5.00, 5.00, 300.00, 400.00, '流转自定义', 0, 0, 5.00, 5.00, 300.00, 400.00, 5, '', '', 1, 0, 0, 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, '数据版本', 0, '数据批阅', 0, '小纸条', '评论', 0, '即时通讯', 0, 0, 1, 0, 0, '催办', 1, '回滚', 1, 0, 1, 0, 0, '', '');
INSERT INTO `wf_node` VALUES (103, '001', '请假流程-经典表单-演示', '总经理审批', 0, 0, 0, 0, 0, 0, 0, 0, 0, '审核意见:@ZJLSP_Note', 0, 0, 0, 14, '', 3, '', 0, 0, 100, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '发送', '', '保存', 1, '抄送', 0, '二维码', 0, '移交', 0, '删除', 0, '结束流程', 0, '查看父流程', 0, '打开公文', 0, 0, 0, '打印Html', 0, 0, 0, '打印pdf', 0, 0, 0, 0, '', '打包下载', 0, 0, 0, '打印单据', 0, '轨迹', 1, '挂起', 0, '查询', 0, '会签', 0, 0, '加主持人', 0, '流转自定义', 0, '重要性', 0, '节点时限', 0, '分配', 0, '关注', 0, '确认', 0, '列表', 1, '批量审核', 0, '备注', 0, '帮助提示', 0, '下一条', 0, '子线程', 0, 0, '跳转', 0, '', '退回', 1, '', 1, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', '', '', '审核信息', 1, 0, '', 1, 1, 0, '审核', '', 0, 1, 300.00, 500.00, 0.00, 400.00, '', 0, 0, 0, 0, 1, '', '', '', '', '审核.png', 0, '', 0, 1.00, 1, 1.00, '', '', 1, 0, 1, '', '', 0, 0, 0, 0, '', 1, 0, 0, '', '', 2, '', 0, 12, '', 0, 'http://', 0, '', 1, '@01', '@01', '@104', '', '', '', '@103', 421, 84, '', '', '@IsYouLiTai=0', 300.00, 400.00, '接受人', 0, '审核', 0, '加签', 0, '公文', 0, '子流程', 0, 1, '启动子流程', '', 5.00, 5.00, '', 0, 0, '子线程', 0, 5.00, 5.00, 300.00, 400.00, '轨迹', 0, 5.00, 5.00, 300.00, 400.00, '流转自定义', 0, 0, 5.00, 5.00, 300.00, 400.00, 5, '', '', 1, 0, 0, 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, '数据版本', 0, '数据批阅', 0, '小纸条', '评论', 0, '即时通讯', 0, 0, 1, 0, 0, '催办', 1, '回滚', 1, 0, 1, 0, 0, '', '');
INSERT INTO `wf_node` VALUES (104, '001', '请假流程-经典表单-演示', '反馈给申请人', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 7, '', 4, '', 0, 0, 100, 0, '', 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '发送', '', '保存', 1, '抄送', 0, '二维码', 0, '移交', 0, '删除', 0, '结束流程', 0, '查看父流程', 0, '打开公文', 0, 0, 0, '打印Html', 0, 0, 0, '打印pdf', 0, 0, 0, 0, '', '打包下载', 0, 0, 0, '打印单据', 0, '轨迹', 1, '挂起', 0, '查询', 0, '会签', 0, 0, '加主持人', 0, '流转自定义', 0, '重要性', 0, '节点时限', 0, '分配', 0, '关注', 0, '确认', 0, '列表', 1, '批量审核', 0, '备注', 0, '帮助提示', 0, '下一条', 0, '子线程', 0, 0, '跳转', 0, '', '退回', 1, '', 1, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, '', '', '', '审核信息', 1, 0, '', 1, 1, 0, '审核', '', 0, 1, 300.00, 500.00, 0.00, 400.00, '', 0, 0, 0, 0, 1, '', '', '', '', '审核.png', 0, '', 0, 1.00, 1, 1.00, '', '', 1, 0, 1, '', '', 0, 0, 0, 0, '', 1, 0, 0, '', '', 2, '', 0, 12, '', 0, 'http://', 0, '', 2, '', '', '', '', '', '', '@101@102@104', 580, 190, '', '', '@IsYouLiTai=0', 300.00, 400.00, '接受人', 0, '审核', 0, '加签', 0, '公文', 0, '子流程', 0, 1, '启动子流程', '', 5.00, 5.00, '', 0, 0, '子线程', 0, 5.00, 5.00, 300.00, 400.00, '轨迹', 0, 5.00, 5.00, 300.00, 400.00, '流转自定义', 0, 0, 5.00, 5.00, 300.00, 400.00, 5, '', '', 1, 0, 0, 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, '', 0, '数据版本', 0, '数据批阅', 0, '小纸条', '评论', 0, '即时通讯', 0, 0, 1, 0, 0, '催办', 1, '回滚', 1, 0, 1, 0, 0, '', '');

-- ----------------------------
-- Table structure for wf_nodecancel
-- ----------------------------
DROP TABLE IF EXISTS `wf_nodecancel`;
CREATE TABLE `wf_nodecancel`  (
  `FK_Node` int(0) NOT NULL COMMENT '节点 - 主键',
  `CancelTo` int(0) NOT NULL COMMENT '撤销到 - 主键',
  PRIMARY KEY (`FK_Node`, `CancelTo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '可撤销的节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_nodecancel
-- ----------------------------

-- ----------------------------
-- Table structure for wf_nodedept
-- ----------------------------
DROP TABLE IF EXISTS `wf_nodedept`;
CREATE TABLE `wf_nodedept`  (
  `FK_Node` int(0) NOT NULL COMMENT '节点 - 主键',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门,主外键:对应物理表:Port_Dept,表描述:部门',
  PRIMARY KEY (`FK_Node`, `FK_Dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_nodedept
-- ----------------------------

-- ----------------------------
-- Table structure for wf_nodeemp
-- ----------------------------
DROP TABLE IF EXISTS `wf_nodeemp`;
CREATE TABLE `wf_nodeemp`  (
  `FK_Node` int(0) NOT NULL COMMENT 'Node - 主键',
  `FK_Emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '到人员,主外键:对应物理表:Port_Emp,表描述:用户',
  PRIMARY KEY (`FK_Node`, `FK_Emp`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点人员' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_nodeemp
-- ----------------------------

-- ----------------------------
-- Table structure for wf_nodereturn
-- ----------------------------
DROP TABLE IF EXISTS `wf_nodereturn`;
CREATE TABLE `wf_nodereturn`  (
  `FK_Node` int(0) NOT NULL COMMENT '节点 - 主键',
  `ReturnTo` int(0) NOT NULL COMMENT '退回到 - 主键',
  PRIMARY KEY (`FK_Node`, `ReturnTo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '可退回的节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_nodereturn
-- ----------------------------

-- ----------------------------
-- Table structure for wf_nodestation
-- ----------------------------
DROP TABLE IF EXISTS `wf_nodestation`;
CREATE TABLE `wf_nodestation`  (
  `FK_Node` int(0) NOT NULL COMMENT '节点 - 主键',
  `FK_Station` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作岗位,主外键:对应物理表:Port_Station,表描述:岗位',
  PRIMARY KEY (`FK_Node`, `FK_Station`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_nodestation
-- ----------------------------
INSERT INTO `wf_nodestation` VALUES (103, '01');

-- ----------------------------
-- Table structure for wf_nodesubflow
-- ----------------------------
DROP TABLE IF EXISTS `wf_nodesubflow`;
CREATE TABLE `wf_nodesubflow`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Flow` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主流程编号',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '主流程节点',
  `SubFlowType` int(0) NULL DEFAULT NULL COMMENT '子流程类型',
  `SubFlowModel` int(0) NULL DEFAULT NULL COMMENT '子流程模式',
  `IsAutoSendSubFlowOver` int(0) NULL DEFAULT NULL COMMENT '子流程结束规则',
  `IsAutoSendSLSubFlowOver` int(0) NULL DEFAULT NULL COMMENT '同级子流程结束规则',
  `SubFlowNo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流程编号',
  `SubFlowName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流程名称',
  `StartOnceOnly` int(0) NULL DEFAULT NULL COMMENT '仅能被调用1次',
  `IsEnableSpecFlowStart` int(0) NULL DEFAULT NULL COMMENT '指定的流程启动后,才能启动该子流程(请在文本框配置子流程).',
  `SpecFlowStart` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流程编号',
  `SpecFlowStartNote` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsEnableSpecFlowOver` int(0) NULL DEFAULT NULL COMMENT '指定的流程结束后,才能启动该子流程(请在文本框配置子流程).',
  `SpecFlowOver` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流程编号',
  `SpecFlowOverNote` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ExpType` int(0) NULL DEFAULT NULL COMMENT '表达式类型',
  `CondExp` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条件表达式',
  `YBFlowReturnRole` int(0) NULL DEFAULT NULL COMMENT '退回方式',
  `ReturnToNode` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要退回的节点',
  `SendModel` int(0) NULL DEFAULT NULL COMMENT '自动触发的子流程发送方式',
  `SubFlowStartModel` int(0) NULL DEFAULT NULL COMMENT '启动模式',
  `SubFlowSta` int(0) NULL DEFAULT NULL COMMENT '状态,枚举类型:0 禁用;1 启用;2 只读;',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序',
  `SubFlowCopyFields` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父流程字段对应子流程字段',
  `BackCopyRole` int(0) NULL DEFAULT NULL COMMENT '子流程结束后数据字段反填规则',
  `ParentFlowCopyFields` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流程字段对应父流程字段',
  `InvokeTime` int(0) NULL DEFAULT NULL COMMENT '调用时间,枚举类型:0 发送时;1 工作到达时;',
  `CompleteReStart` int(0) NULL DEFAULT NULL COMMENT '该子流程运行结束后才可以重新发起.',
  `IsEnableSQL` int(0) NULL DEFAULT NULL COMMENT '按照指定的SQL配置.',
  `SpecSQL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SQL语句',
  `IsEnableSameLevelNode` int(0) NULL DEFAULT NULL COMMENT '按照指定平级子流程节点完成后启动.',
  `SameLevelNode` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平级子流程节点',
  `SubFlowLab` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启动文字标签',
  `SubFlowHidTodolist` int(0) NULL DEFAULT NULL COMMENT '发送后是否隐藏父流程待办',
  `SubFlowShowModel` int(0) NULL DEFAULT NULL COMMENT '展现模式',
  `ParentNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父节点的值',
  `SubFlowGuideSQL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子流程前置导航配置SQL',
  `SubFlowGuideGroup` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组的SQL',
  `SubFlowGuideEnNoFiled` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体No字段',
  `SubFlowGuideEnNameFiled` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体Name字段',
  `YanXuToNode` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '延续到的节点',
  `ReturnToNodeText` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要退回的节点',
  `ParentFlowSendNextStepRole` int(0) NULL DEFAULT 0 COMMENT '父流程自动运行到下一步规则',
  `ParentFlowOverRole` int(0) NULL DEFAULT 0 COMMENT '父流程结束规则',
  `SubFlowNodeID` int(0) NULL DEFAULT 0 COMMENT '指定子流程节点ID',
  `X` int(0) NULL DEFAULT 0 COMMENT 'X',
  `Y` int(0) NULL DEFAULT 0 COMMENT 'Y',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '子流程(所有类型子流程属性)' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_nodesubflow
-- ----------------------------

-- ----------------------------
-- Table structure for wf_nodeteam
-- ----------------------------
DROP TABLE IF EXISTS `wf_nodeteam`;
CREATE TABLE `wf_nodeteam`  (
  `FK_Node` int(0) NOT NULL COMMENT '节点 - 主键',
  `FK_Team` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户组,主外键:对应物理表:Port_Team,表描述:用户组',
  PRIMARY KEY (`FK_Node`, `FK_Team`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_nodeteam
-- ----------------------------

-- ----------------------------
-- Table structure for wf_nodetoolbar
-- ----------------------------
DROP TABLE IF EXISTS `wf_nodetoolbar`;
CREATE TABLE `wf_nodetoolbar`  (
  `OID` int(0) NOT NULL COMMENT 'OID - 主键',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点',
  `Title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `ExcType` int(0) NULL DEFAULT NULL COMMENT '执行类型,枚举类型:0 超链接;1 函数;',
  `UrlExt` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接/函数',
  `Target` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标',
  `IsMyFlow` int(0) NULL DEFAULT 0 COMMENT '工作处理器',
  `IsMyTree` int(0) NULL DEFAULT 0 COMMENT '流程树',
  `IsMyView` int(0) NULL DEFAULT 0 COMMENT '工作查看器',
  `IsMyCC` int(0) NULL DEFAULT 0 COMMENT '抄送工具栏',
  `IconPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ICON路径',
  `Idx` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `MyFileName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `MyFilePath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFilePath',
  `MyFileExt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MyFileExt',
  `WebPath` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'WebPath',
  `MyFileH` int(0) NULL DEFAULT 0 COMMENT 'MyFileH',
  `MyFileW` int(0) NULL DEFAULT 0 COMMENT 'MyFileW',
  `MyFileSize` float NULL DEFAULT NULL COMMENT 'MyFileSize',
  `ShowWhere` int(0) NULL DEFAULT 1 COMMENT '显示位置',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义工具栏' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_nodetoolbar
-- ----------------------------

-- ----------------------------
-- Table structure for wf_part
-- ----------------------------
DROP TABLE IF EXISTS `wf_part`;
CREATE TABLE `wf_part`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Flow` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `PartType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `Tag0` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag0',
  `Tag1` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag1',
  `Tag2` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag2',
  `Tag3` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag3',
  `Tag4` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag4',
  `Tag5` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag5',
  `Tag6` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag6',
  `Tag7` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag7',
  `Tag8` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag8',
  `Tag9` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag9',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_part
-- ----------------------------

-- ----------------------------
-- Table structure for wf_powermodel
-- ----------------------------
DROP TABLE IF EXISTS `wf_powermodel`;
CREATE TABLE `wf_powermodel`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块',
  `PowerFlag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `PowerFlagName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标记名称',
  `PowerCtrlType` int(0) NULL DEFAULT NULL COMMENT '控制类型,枚举类型:0 岗位;1 人员;',
  `EmpNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `EmpName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员名称',
  `StaNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位编号',
  `StaName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `FlowNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FrmID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限模型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_powermodel
-- ----------------------------

-- ----------------------------
-- Table structure for wf_pushmsg
-- ----------------------------
DROP TABLE IF EXISTS `wf_pushmsg`;
CREATE TABLE `wf_pushmsg`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Flow` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点',
  `FK_Event` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件类型',
  `PushWay` int(0) NULL DEFAULT NULL COMMENT '推送方式,枚举类型:0 按照指定节点的工作人员;1 按照指定的工作人员;2 按照指定的工作岗位;3 按照指定的部门;4 按照指定的SQL;5 按照系统指定的字段;',
  `PushDoc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推送保存内容',
  `Tag` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Tag',
  `SMSPushWay` int(0) NULL DEFAULT NULL COMMENT '短消息发送方式',
  `SMSField` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短消息字段',
  `SMSDoc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '短消息内容模版',
  `SMSNodes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SMS节点s',
  `SMSPushModel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短消息发送设置',
  `MailPushWay` int(0) NULL DEFAULT NULL COMMENT '邮件发送方式',
  `MailAddress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件字段',
  `MailTitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件标题模版',
  `MailDoc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '邮件内容模版',
  `MailNodes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Mail节点s',
  `BySQL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按照SQL计算',
  `ByEmps` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送给指定的人员',
  `AtPara` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'AtPara',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '消息推送' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_pushmsg
-- ----------------------------

-- ----------------------------
-- Table structure for wf_rememberme
-- ----------------------------
DROP TABLE IF EXISTS `wf_rememberme`;
CREATE TABLE `wf_rememberme`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点',
  `FK_Emp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前操作人员',
  `Objs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分配人员',
  `ObjsExt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分配人员Ext',
  `Emps` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '所有的工作人员',
  `EmpsExt` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作人员Ext',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '记忆我' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_rememberme
-- ----------------------------

-- ----------------------------
-- Table structure for wf_returnwork
-- ----------------------------
DROP TABLE IF EXISTS `wf_returnwork`;
CREATE TABLE `wf_returnwork`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT 'WorkID',
  `ReturnNode` int(0) NULL DEFAULT NULL COMMENT '退回节点',
  `ReturnNodeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退回节点名称',
  `Returner` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退回人',
  `ReturnerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退回人名称',
  `ReturnToNode` int(0) NULL DEFAULT NULL COMMENT 'ReturnToNode',
  `ReturnToEmp` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退回给',
  `BeiZhu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '退回原因',
  `RDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退回日期',
  `IsBackTracking` int(0) NULL DEFAULT NULL COMMENT '是否要原路返回?',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退回轨迹' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_returnwork
-- ----------------------------

-- ----------------------------
-- Table structure for wf_selectaccper
-- ----------------------------
DROP TABLE IF EXISTS `wf_selectaccper`;
CREATE TABLE `wf_selectaccper`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '接受人节点',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT 'WorkID',
  `FK_Emp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'FK_Emp',
  `EmpName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'EmpName',
  `DeptName` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `AccType` int(0) NULL DEFAULT NULL COMMENT '类型(@0=接受人@1=抄送人)',
  `Rec` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录人',
  `Info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办理意见信息',
  `IsRemember` int(0) NULL DEFAULT NULL COMMENT '以后发送是否按本次计算',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号(可以用于流程队列审核模式)',
  `Tag` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维度信息Tag',
  `TimeLimit` int(0) NULL DEFAULT NULL COMMENT '时限-天',
  `TSpanHour` float NULL DEFAULT NULL COMMENT '时限-小时',
  `ADT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到达日期(计划)',
  `SDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应完成日期(计划)',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '选择接受/抄送人信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_selectaccper
-- ----------------------------

-- ----------------------------
-- Table structure for wf_sqltemplate
-- ----------------------------
DROP TABLE IF EXISTS `wf_sqltemplate`;
CREATE TABLE `wf_sqltemplate`  (
  `No` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `SQLType` int(0) NULL DEFAULT NULL COMMENT '模版SQL类型,枚举类型:0 方向条件;1 接受人规则;2 下拉框数据过滤;3 级联下拉框;4 PopVal开窗返回值;5 人员选择器人员选择范围;',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SQL说明',
  `Docs` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'SQL模版',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'SQL模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_sqltemplate
-- ----------------------------

-- ----------------------------
-- Table structure for wf_task
-- ----------------------------
DROP TABLE IF EXISTS `wf_task`;
CREATE TABLE `wf_task`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Flow` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `Starter` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起人',
  `ToNode` int(0) NULL DEFAULT NULL COMMENT '到达的节点',
  `ToEmps` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到达人员',
  `Paras` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '参数',
  `TaskSta` int(0) NULL DEFAULT NULL COMMENT '任务状态',
  `Msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息',
  `StartDT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起时间',
  `RDT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '插入数据时间',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_task
-- ----------------------------

-- ----------------------------
-- Table structure for wf_testapi
-- ----------------------------
DROP TABLE IF EXISTS `wf_testapi`;
CREATE TABLE `wf_testapi`  (
  `No` varchar(92) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试过程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_testapi
-- ----------------------------

-- ----------------------------
-- Table structure for wf_testcase
-- ----------------------------
DROP TABLE IF EXISTS `wf_testcase`;
CREATE TABLE `wf_testcase`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `FK_Flow` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `ParaType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `Vals` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值s',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义流程测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_testcase
-- ----------------------------

-- ----------------------------
-- Table structure for wf_testsample
-- ----------------------------
DROP TABLE IF EXISTS `wf_testsample`;
CREATE TABLE `wf_testsample`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试名称',
  `FK_API` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试的API,外键:对应物理表:WF_TestAPI,表描述:测试过程',
  `FK_Ver` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试的版本,外键:对应物理表:WF_TestVer,表描述:测试版本',
  `DTFrom` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '从',
  `DTTo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '到',
  `TimeUse` float NULL DEFAULT NULL COMMENT '用时(毫秒)',
  `TimesPerSecond` float NULL DEFAULT NULL COMMENT '每秒跑多少个?',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_testsample
-- ----------------------------

-- ----------------------------
-- Table structure for wf_testver
-- ----------------------------
DROP TABLE IF EXISTS `wf_testver`;
CREATE TABLE `wf_testver`  (
  `No` varchar(92) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号 - 主键',
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`No`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试版本' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_testver
-- ----------------------------

-- ----------------------------
-- Table structure for wf_transfercustom
-- ----------------------------
DROP TABLE IF EXISTS `wf_transfercustom`;
CREATE TABLE `wf_transfercustom`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK - 主键',
  `WorkID` int(0) NULL DEFAULT NULL COMMENT 'WorkID',
  `FK_Node` int(0) NULL DEFAULT NULL COMMENT '节点ID',
  `NodeName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点名称',
  `Worker` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人(多个人用逗号分开)',
  `WorkerName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人(多个人用逗号分开)',
  `SubFlowNo` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '要经过的子流程编号',
  `PlanDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划完成日期',
  `TodolistModel` int(0) NULL DEFAULT NULL COMMENT '多人工作处理模式',
  `IsEnable` int(0) NULL DEFAULT NULL COMMENT '是否启用',
  `Idx` int(0) NULL DEFAULT NULL COMMENT '顺序号',
  PRIMARY KEY (`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义运行路径' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_transfercustom
-- ----------------------------

-- ----------------------------
-- Table structure for wf_workflowdeletelog
-- ----------------------------
DROP TABLE IF EXISTS `wf_workflowdeletelog`;
CREATE TABLE `wf_workflowdeletelog`  (
  `OID` int(0) NOT NULL COMMENT 'OID - 主键',
  `FID` int(0) NULL DEFAULT NULL COMMENT 'FID',
  `FK_Dept` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门,外键:对应物理表:Port_Dept,表描述:部门',
  `Title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `FlowStarter` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起人',
  `FlowStartRDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起时间',
  `FK_Flow` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程,外键:对应物理表:WF_Flow,表描述:流程',
  `FlowEnderRDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后处理时间',
  `FlowEndNode` int(0) NULL DEFAULT NULL COMMENT '停留节点',
  `FlowDaySpan` float NULL DEFAULT NULL COMMENT '跨度(天)',
  `FlowEmps` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与人',
  `Oper` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除人员',
  `OperDept` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除人员部门',
  `OperDeptName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除人员名称',
  `DeleteNote` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '删除原因',
  `DeleteDT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除日期',
  PRIMARY KEY (`OID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '流程删除日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_frmprinttemplate
-- ----------------------------
DROP TABLE IF EXISTS `sys_frmprinttemplate`;
CREATE TABLE `sys_frmprinttemplate`  (
  `MyPK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键MyPK',
  `Name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `TempFilePath` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板路径',
  `NodeID` int(0) NULL DEFAULT 0 COMMENT '节点ID',
  `FlowNo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `FrmID` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表单ID',
  `TemplateFileModel` int(0) NULL DEFAULT 0 COMMENT '模版模式',
  `PrintFileType` int(0) NULL DEFAULT 0 COMMENT '生成的文件类型',
  `PrintOpenModel` int(0) NULL DEFAULT 0 COMMENT '生成的文件打开方式',
  `AthSaveWay` int(0) NULL DEFAULT 0 COMMENT '实例的保存方式',
  `QRModel` int(0) NULL DEFAULT 0 COMMENT '二维码生成方式',
  `Idx` int(0) NULL DEFAULT 0 COMMENT 'Idx',
  `TempalteFile` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上传模板',
  PRIMARY KEY (`MyPK`) USING BTREE,
  INDEX `Sys_FrmPrintTemplate_MyPK`(`MyPK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '打印模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wf_workflowdeletelog
-- ----------------------------

-- ----------------------------
-- View structure for port_dept
-- ----------------------------
DROP VIEW IF EXISTS `port_dept`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `port_dept` AS select `d`.`dept_id` AS `No`,`d`.`dept_name` AS `Name`,'' AS `NameOfPath`,`d`.`parent_id` AS `ParentNo`,'' AS `Idx`,'' AS `OrgNo`,`d`.`leader` AS `Leader`,'' AS `DeptType` from `sys_dept` `d`;


-- ----------------------------
-- View structure for port_deptemp
-- ----------------------------
DROP VIEW IF EXISTS `port_deptemp`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `port_deptemp` AS select concat(`sd`.`dept_id`,'_',`uu`.`login_name`) AS `MyPK`,`sd`.`dept_id` AS `FK_Dept`,`uu`.`login_name` AS `FK_Emp`,'' AS `OrgNo` from (`sys_user` `uu` join `sys_dept` `sd`) where (`uu`.`dept_id` = `sd`.`dept_id`);

-- ----------------------------
-- View structure for port_deptempstation
-- ----------------------------
DROP VIEW IF EXISTS `port_deptempstation`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `port_deptempstation` AS select concat(`sd`.`dept_id`,'_',`uu`.`login_name`,'_',`sp`.`post_id`) AS `MyPK`,`sd`.`dept_id` AS `FK_Dept`,`sp`.`post_id` AS `FK_Station`,`uu`.`login_name` AS `FK_Emp`,'' AS `OrgNo` from ((`sys_user` `uu` join `sys_dept` `sd`) join `sys_user_post` `sp`) where ((`uu`.`user_id` = `sp`.`user_id`) and (`uu`.`dept_id` = `sd`.`dept_id`));

-- ----------------------------
-- View structure for port_deptstation
-- ----------------------------
DROP VIEW IF EXISTS `port_deptstation`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `port_deptstation` AS select `sd`.`dept_id` AS `FK_Dept`,`sp`.`post_id` AS `FK_Station` from ((`sys_user` `uu` join `sys_dept` `sd`) join `sys_user_post` `sp`) where ((`uu`.`user_id` = `sp`.`user_id`) and (`uu`.`dept_id` = `sd`.`dept_id`));

-- ----------------------------
-- View structure for port_emp
-- ----------------------------
DROP VIEW IF EXISTS `port_emp`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `port_emp` AS select `u`.`login_name` AS `NO`,`u`.`user_name` AS `Name`,`u`.`password` AS `Pass`,concat(`u`.`dept_id`,'') AS `FK_Dept`,'' AS `SID`,`u`.`phonenumber` AS `Tel`,`u`.`email` AS `Email`,'' AS `PinYin`,'' AS `SignType`,'' AS `Idx`,'' AS `UserType`,'' AS `OrgNo`,'' AS `Token`,'' AS `Leader`,'' AS `LeaderName`,'0' AS `EmpSta` from `sys_user` `u`;

-- ----------------------------
-- View structure for port_station
-- ----------------------------
DROP VIEW IF EXISTS `port_station`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `port_station` AS select concat(`p`.`post_id`,'') AS `No`,`p`.`post_name` AS `Name`,'1' AS `FK_StationType`,'' AS `OrgNo` from `sys_post` `p`;

-- ----------------------------
-- View structure for v_flowstarterbpm
-- ----------------------------
DROP VIEW IF EXISTS `v_flowstarterbpm`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_flowstarterbpm` AS select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`c`.`FK_Emp` AS `FK_Emp`,`c`.`OrgNo` AS `OrgNo` from ((`wf_node` `a` join `wf_nodestation` `b`) join `port_deptempstation` `c`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`NodeID` = `b`.`FK_Node`) and (`b`.`FK_Station` = `c`.`FK_Station`) and ((`a`.`DeliveryWay` = 0) or (`a`.`DeliveryWay` = 14))) union select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`c`.`FK_Emp` AS `FK_Emp`,`c`.`OrgNo` AS `OrgNo` from ((`wf_node` `a` join `wf_nodedept` `b`) join `port_deptemp` `c`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`NodeID` = `b`.`FK_Node`) and (`b`.`FK_Dept` = `c`.`FK_Dept`) and (`a`.`DeliveryWay` = 1)) union select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`b`.`FK_Emp` AS `FK_Emp`,'' AS `OrgNo` from (`wf_node` `a` join `wf_nodeemp` `b`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`NodeID` = `b`.`FK_Node`) and (`a`.`DeliveryWay` = 3)) union select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`b`.`NO` AS `FK_Emp`,`b`.`OrgNo` AS `OrgNo` from (`wf_node` `a` join `port_emp` `b`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`DeliveryWay` = 4)) union select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`e`.`FK_Emp` AS `FK_Emp`,`e`.`OrgNo` AS `OrgNo` from (((`wf_node` `a` join `wf_nodedept` `b`) join `wf_nodestation` `c`) join `port_deptempstation` `e`) where ((`a`.`NodePosType` = 0) and ((`a`.`WhoExeIt` = 0) or (`a`.`WhoExeIt` = 2)) and (`a`.`NodeID` = `b`.`FK_Node`) and (`a`.`NodeID` = `c`.`FK_Node`) and (`b`.`FK_Dept` = `e`.`FK_Dept`) and (`c`.`FK_Station` = `e`.`FK_Station`) and (`a`.`DeliveryWay` = 9)) union select `a`.`FK_Flow` AS `FK_Flow`,`a`.`FlowName` AS `FlowName`,`c`.`NO` AS `FK_Emp`,`b`.`OrgNo` AS `OrgNo` from ((`wf_node` `a` join `wf_floworg` `b`) join `port_emp` `c`) where ((`a`.`FK_Flow` = `b`.`FlowNo`) and (`b`.`OrgNo` = `c`.`OrgNo`) and (`a`.`DeliveryWay` = 22));

DROP VIEW IF EXISTS `wf_empworks`;
CREATE ALGORITHM = UNDEFINED  SQL SECURITY DEFINER VIEW `wf_empworks` AS SELECT  `a`.`PRI` AS `PRI`,  `a`.`WorkID` AS `WorkID`,  `b`.`IsRead` AS `IsRead`,  `a`.`Starter` AS `Starter`,  `a`.`StarterName` AS `StarterName`,  `a`.`WFState` AS `WFState`,  `a`.`FK_Dept` AS `FK_Dept`,  `a`.`DeptName` AS `DeptName`,  `a`.`FK_Flow` AS `FK_Flow`,  `a`.`FlowName` AS `FlowName`,  `a`.`PWorkID` AS `PWorkID`,  `a`.`PFlowNo` AS `PFlowNo`,  `b`.`FK_Node` AS `FK_Node`,  `b`.`FK_NodeText` AS `NodeName`,  `a`.`Title` AS `Title`,  `a`.`RDT` AS `RDT`,  `b`.`RDT` AS `ADT`,  `b`.`SDT` AS `SDT`,  `b`.`FK_Emp` AS `FK_Emp`,  `b`.`FID` AS `FID`,  `a`.`FK_FlowSort` AS `FK_FlowSort`,  `a`.`SysType` AS `SysType`,  `a`.`SDTOfNode` AS `SDTOfNode`,  `b`.`PressTimes` AS `PressTimes`,  `a`.`GuestNo` AS `GuestNo`,  `a`.`GuestName` AS `GuestName`,  `a`.`BillNo` AS `BillNo`,  `a`.`FlowNote` AS `FlowNote`,  `a`.`TodoEmps` AS `TodoEmps`,  `a`.`TodoEmpsNum` AS `TodoEmpsNum`,  `a`.`TodoSta` AS `TodoSta`,  `a`.`TaskSta` AS `TaskSta`,  0 AS `ListType`,  `a`.`Sender` AS `Sender`,  `a`.`AtPara` AS `AtPara`,  `a`.`Domain` AS `Domain`,  `a`.`OrgNo` AS `OrgNo` FROM  ( `wf_generworkflow` `a` JOIN `wf_generworkerlist` `b` ) WHERE  ((      `b`.`IsEnable` = 1       )     AND ( `b`.`IsPass` = 0 )     AND ( `a`.`WorkID` = `b`.`WorkID` )     AND ( `a`.`FK_Node` = `b`.`FK_Node` )     AND ( `a`.`WFState` <> 0 )   AND ( `b`.`WhoExeIt` <> 1 )) UNION SELECT  `a`.`PRI` AS `PRI`,  `a`.`WorkID` AS `WorkID`,  `b`.`Sta` AS `IsRead`,  `a`.`Starter` AS `Starter`,  `a`.`StarterName` AS `StarterName`,  2 AS `WFState`,  `a`.`FK_Dept` AS `FK_Dept`,  `a`.`DeptName` AS `DeptName`,  `a`.`FK_Flow` AS `FK_Flow`,  `a`.`FlowName` AS `FlowName`,  `a`.`PWorkID` AS `PWorkID`,  `a`.`PFlowNo` AS `PFlowNo`,  `b`.`FK_Node` AS `FK_Node`,  `b`.`NodeName` AS `NodeName`,  `a`.`Title` AS `Title`,  `a`.`RDT` AS `RDT`,  `b`.`RDT` AS `ADT`,  `b`.`RDT` AS `SDT`,  `b`.`CCTo` AS `FK_Emp`,  `b`.`FID` AS `FID`,  `a`.`FK_FlowSort` AS `FK_FlowSort`,  `a`.`SysType` AS `SysType`,  `a`.`SDTOfNode` AS `SDTOfNode`,  0 AS `PressTimes`,  `a`.`GuestNo` AS `GuestNo`,  `a`.`GuestName` AS `GuestName`,  `a`.`BillNo` AS `BillNo`,  `a`.`FlowNote` AS `FlowNote`,  `a`.`TodoEmps` AS `TodoEmps`,  `a`.`TodoEmpsNum` AS `TodoEmpsNum`, 0 AS `TodoSta`,  0 AS `TaskSta`,  1 AS `ListType`,  `b`.`Rec` AS `Sender`,((      0 <> '@IsCC=1'       )   OR ( 0 <> `a`.`AtPara` )) AS `AtPara`,  `a`.`Domain` AS `Domain`,  `a`.`OrgNo` AS `OrgNo` FROM  ( `wf_generworkflow` `a` JOIN `wf_cclist` `b` ) WHERE  ((      `a`.`WorkID` = `b`.`WorkID`       )     AND ( `b`.`Sta` <= 1 )   AND ( `b`.`InEmpWorks` = 1 )   AND ( `a`.`WFState` <> 0 ));


SET FOREIGN_KEY_CHECKS = 1;
