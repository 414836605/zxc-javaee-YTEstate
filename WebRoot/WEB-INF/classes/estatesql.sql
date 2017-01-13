drop database if exists estate;
create database estate default character set utf8;

use estate;

/* 业主信息表 */
drop table if exists `owner`;
create table `owner` (
  `owner_id` int(11) not null auto_increment,
  `owner_name` varchar(20) not null,
  `owner_perid` varchar(30) not null,
  `owner_sex` varchar(20) not null,
  `owner_phone` varchar(20) default null,
  `owner_email` varchar(40) default null,
  `owner_info` varchar(255) default null,
  `owner_build` int(10) not null,
  `owner_home` varchar(6) not null,
  `owner_garage` int(10) not null,
  `owner_park` int(10) not null,
  primary key (`owner_id`)
) default charset=utf8;

insert into `owner` values ('1', '刘德华', '210722197006067334', '男', '17728290875', '678657656@qq.com', '妻子与女儿', '1', '001', '1', '1');
insert into `owner` values ('2', '张涛', '210732319770809234', '男', '13842342384', '123232343@qq.com', '单身', '2', '002', '2', '2');
insert into `owner` values ('3', '周润发', '210710197607268765', '男', '12288890987', '124454556@qq.com', '单身', '3', '003', '3', '3');
insert into `owner` values ('4', '薛之谦', '21078919805278976', '男', '22227756626', '232223222@163.com', '单身', '1', 'a16', '4', '4');
insert into `owner` values ('5', '古丽扎纳', '210789198808239876', '女', '22222112121', '333223323@163.com', '丈夫', '2', 'b23', '5', '5');
insert into `owner` values ('6', '刘晓庆', '210288196002209876', '女', '22222222222', '434332232@163.com', '丈夫与儿子', '3', 'a12', '6', '6');
insert into `owner` values ('7', '刘德华', '210722197006067334', '男', '17728290875', '678657656@qq.com', '妻子与女儿', '1', '001', '1', '1');
insert into `owner` values ('8', '张涛', '210732319770809234', '男', '13842342384', '123232343@qq.com', '单身', '2', '002', '2', '2');
insert into `owner` values ('9', '周润发', '210710197607268765', '男', '12288890987', '124454556@qq.com', '单身', '3', '003', '3', '3');
insert into `owner` values ('10', '薛之谦', '21078919805278976', '男', '22227756626', '232223222@163.com', '单身', '1', 'a16', '4', '4');
insert into `owner` values ('11', '古丽扎纳', '210789198808239876', '女', '22222112121', '333223323@163.com', '丈夫', '2', 'b23', '5', '5');
insert into `owner` values ('12', '刘晓庆', '210288196002209876', '女', '22222222222', '434332232@163.com', '丈夫与儿子', '3', 'a12', '6', '6');

/* 楼宇表 */
drop table if exists `build`;
create table `build` (
  `build_id` int(11) not null auto_increment,
  `build_type` varchar(20) not null,
  `build_area` int(10) not null,
  `build_fee` float not null,
  primary key (`build_id`)
) default charset=utf8;

insert into `build` values ('1', '门市', '125', '150');
insert into `build` values ('2', '普通住宅', '60', '40');
insert into `build` values ('3', '高层住宅', '85', '80');
insert into `build` values ('4', '门市', '125', '150');
insert into `build` values ('5', '普通住宅', '60', '40');
insert into `build` values ('6', '高层住宅', '85', '80');
insert into `build` values ('7', '门市', '125', '150');
insert into `build` values ('8', '普通住宅', '60', '40');
insert into `build` values ('9', '高层住宅', '85', '80');
insert into `build` values ('10', '高层住宅', '85', '80');
insert into `build` values ('11', '门市', '125', '150');
insert into `build` values ('12', '普通住宅', '60', '40');
insert into `build` values ('13', '高层住宅', '85', '80');

/* 车库表 */
drop table if exists `garage`;
create table `garage` (
  `garage_id` int(10) not null auto_increment,
  `garage_area` int(10) not null,
  `garage_fee` float not null,
  primary key (`garage_id`)
) default charset=utf8;

insert into `garage` values ('1', '16', '10');
insert into `garage` values ('2', '20', '15');
insert into `garage` values ('3', '14', '15');
insert into `garage` values ('4', '20', '20');
insert into `garage` values ('5', '15', '10');
insert into `garage` values ('6', '16', '15');
insert into `garage` values ('7', '16', '10');
insert into `garage` values ('8', '20', '15');
insert into `garage` values ('9', '14', '15');
insert into `garage` values ('10', '20', '20');
insert into `garage` values ('11', '15', '10');
insert into `garage` values ('12', '16', '15');

/* 车位表 */
drop table if exists `park`;
create table `park` (
  `park_id` int(10) not null auto_increment,
  `park_area` int(10) not null,
  `park_fee` float not null,
  primary key (`park_id`)
) charset=utf8;

insert into `park` values ('1', '12', '16');
insert into `park` values ('2', '7', '10');
insert into `park` values ('3', '8', '14');
insert into `park` values ('4', '10', '12');
insert into `park` values ('5', '13', '14');
insert into `park` values ('6', '13', '15');
insert into `park` values ('7', '12', '16');
insert into `park` values ('8', '7', '10');
insert into `park` values ('9', '8', '14');
insert into `park` values ('10', '10', '12');
insert into `park` values ('11', '13', '14');
insert into `park` values ('12', '13', '15');

/* 缴费信息表 */
drop table if exists `fee`;
create table `fee` (
  `fee_id` int(11) not null auto_increment,
  `owner_id` int(11) not null,
  `fee_time` datetime not null,
  `fee_build` int(11) not null,
  `fee_garage` int(11) not null,
  `fee_park` int(11) not null,
  `fee_type` tinyint not null default '0',/* 0：未缴费，1：已缴费 */
  primary key (`fee_id`)
) default charset=utf8;

insert into `fee` values ('1', '1', '2016-03-13 00:00:00', '100', '100', '10', '1');
insert into `fee` values ('2', '2', '2016-03-13 00:00:00', '120', '100', '10', '0');
insert into `fee` values ('3', '3', '2016-03-13 00:00:00', '200', '100', '10', '0');
insert into `fee` values ('4', '4', '2016-03-13 00:00:00', '100', '100', '10', '0');
insert into `fee` values ('5', '5', '2016-03-13 00:00:00', '150', '100', '10', '0');
insert into `fee` values ('6', '6', '2016-03-13 00:00:00', '170', '100', '10', '0');
insert into `fee` values ('7', '1', '2016-03-13 00:00:00', '100', '100', '10', '0');
insert into `fee` values ('8', '2', '2016-03-13 00:00:00', '120', '100', '10',  '0');
insert into `fee` values ('9', '3', '2016-03-13 00:00:00', '200', '100', '10',  '0');
insert into `fee` values ('10', '4', '2016-03-13 00:00:00', '100', '100', '10',  '0');
insert into `fee` values ('11', '5', '2016-03-13 00:00:00', '150', '100', '10',  '0');
insert into `fee` values ('12', '6', '2016-03-13 00:00:00', '170', '100', '10',  '0');
insert into `fee` values ('13', '2', '2016-01-13 00:00:00', '120', '100', '10',  '1');
insert into `fee` values ('14', '3', '2016-02-13 00:00:00', '100', '100', '10',  '1');
insert into `fee` values ('15', '4', '2016-03-13 00:00:00', '100', '100', '10',  '1');
insert into `fee` values ('16', '5', '2016-04-13 00:00:00', '150', '100', '10',  '1');
insert into `fee` values ('17', '6', '2016-05-13 00:00:00', '170', '100', '10',  '1');
insert into `fee` values ('18', '1', '2016-06-13 00:00:00', '100', '100', '10',  '1');
insert into `fee` values ('19', '2', '2016-07-13 00:00:00', '120', '100', '10',  '1');
insert into `fee` values ('20', '3', '2016-08-13 00:00:00', '200', '100', '10',  '1');


/* 采购信息表  */
drop table if exists `buy`;
create table `buy` (
  `buy_id` int(11) not null auto_increment,
  `buy_name` varchar(20) not null,
  `buy_item` varchar(20) not null,
  `buy_num` int(11) not null,
  `buy_coast` float(20,0) not null,
  `buy_use` varchar(300) not null,
  `buy_phone` varchar(20) not null,
  `buy_time` datetime not null,
  `buy_status` tinyint not null default '0',/* 0：未审核，1：审核通过， 2：审核未通过 */
  `buy_reply` varchar(300) default '',/* 审核回复*/
  primary key (`buy_id`)
) default charset=utf8;

insert into `buy` values ('1', '张三', '变压器', 2, 2000, '更换变压器', '18866666666', '2016-03-13 00:00:00', 0, '');
insert into `buy` values ('2', '张三', '变压器', 2, 2000, '更换变压器', '18866666666', '2016-01-13 00:00:00', 1, '');
insert into `buy` values ('3', '张三', '墙砖', 2, 2000, '更换墙砖', '18866666666', '2016-02-13 00:00:00', 1, '');
insert into `buy` values ('4', '张三', '门', 2, 2000, '更换门', '18866666666', '2016-03-13 00:00:00', 1, '');
insert into `buy` values ('5', '张三', '电线', 2, 2000, '电线', '18866666666', '2016-04-13 00:00:00', 1, '');
insert into `buy` values ('6', '张三', '墙砖', 2, 2000, '更换墙砖', '18866666666', '2016-05-13 00:00:00', 1, '');
insert into `buy` values ('7', '张三', '门', 2, 2000, '更换门', '18866666666', '2016-06-13 00:00:00', 1, '');
insert into `buy` values ('8', '张三', '电线', 2, 2000, '电线', '18866666666', '2016-07-13 00:00:00', 1, '');
insert into `buy` values ('9', '张三', '墙砖', 2, 2000, '更换墙砖', '18866666666', '2016-08-13 00:00:00', 1, '');
insert into `buy` values ('10', '张三', '墙砖', 2, 2000, '更换墙砖', '18866666666', '2016-09-13 00:00:00', 1, '');

/* 维护信息表  */
drop table if exists `maintain`;
create table `maintain` (
  `maintain_id` int(11) not null auto_increment,
  `maintain_name` varchar(20) not null,
  `maintain_item` varchar(20) not null,
  `maintain_describe`  varchar(300) not null,
  `maintain_phone` varchar(20) not null,
  `maintain_time` datetime not null,
  `maintain_status` tinyint not null default '0',/* 0：未审核，1：审核通过， 2：审核未通过，3：验收通过，4：验收未通过*/
  primary key (`maintain_id`)
) default charset=utf8;

insert into `maintain` values ('1', '张三', '东墙墙面', '东墙墙面损坏', '18866666666', '2016-03-13 00:00:00', 0);

/* 员工表 */
drop table if exists `emp`;
create table `emp` (
  `emp_id` int(11) not null auto_increment,
  `emp_user` varchar(20) not null,
  `emp_password` varchar(20) not null,
  `emp_idcard` varchar(20) not null,
  `emp_role` int not null,
  `emp_name` varchar(20) not null,
  `emp_sex` varchar(20) not null,
  `emp_birthdate` datetime not null,
  `emp_email` varchar(40) default null,
  `emp_phone` varchar(20) default null,
  `emp_address` varchar(80) default null,
  `emp_info` varchar(255) default null,
  `dept_id` int(10) not null,
  /* 1---------开发者(admin  123456)
	2---------普通员工
	3---------维修工
	4---------人资干事
	5---------会计
	6---------收费员*/
  `job_id` int(10) not null,
  /*
	1---------开发部
	2---------服务部
	3---------维修部
	4---------人事部
	5---------财务部
	6---------收费部
	*/
  primary key (`emp_id`)
) default charset=utf8;

insert into `emp` values ('1', 'admin', '123456', '21090419700326151X', '1', '方瑞科技', '男', '1993-07-04 19:03:25', '1010543618@qq.com', '1010543618', '辽宁工程技术大学', '开发者', '1', '1');
insert into `emp` values ('2', 'panda', '123456', '210902196303173020', '1', '周维', '男', '1993-07-04 19:03:25', '610479001@qq.com', '18342910801', '辽宁工程技术大学', '开发者', '1', '1');
insert into `emp` values ('3', 'zhr1993', '123456', '210902196303173020', '2', '张盼盼', '女', '1993-03-23 19:07:46', '1971941570@qq.com', '18424324456', '沈阳大学', '人事部员', '2', '2');
insert into `emp` values ('4', 'lxx', '123456', '210902196303173020', '3', '李筱松', '男', '1990-02-06 00:00:12', 'xs@163.com', '17432523423', '沈阳建筑大学', '维护部', '3', '3');
insert into `emp` values ('5', 'yy666', '123456', '21090419700326151X', '6', '于圆圆', '女', '1990-12-06 19:22:55', 'yynice@hotmail.com', '13434245423', '东北财经大学', '财务部', '6', '6');
insert into `emp` values ('6', 'ztt', '123456', '21090419700326151X', '5', '章天天', '女', '1990-06-05 19:54:47', 'ttgood@qq.com', '13953452666', '辽宁财贸学院', '收费部', '5', '5');
insert into `emp` values ('7', 'lht', '123456', '21090419700326151X', '4', '刘海涛', '男', '1992-12-23 20:00:09', 'haitao@163.com', '13953423673', '辽宁林业职业技术学院', '人事部', '4', '4');
insert into `emp` values ('8', 'admin2', '123456', '21090419700326151X', '1', '方瑞科技', '男', '1993-07-04 19:03:25', '1010543618@qq.com', '1010543618', '辽宁工程技术大学', '开发者', '1', '1');
insert into `emp` values ('9', 'panda2', '123456', '21090419700326151X', '1', '周维', '男', '1993-07-04 19:03:25', '610479001@qq.com', '18342910801', '辽宁工程技术大学', '开发者', '1', '1');
insert into `emp` values ('10', 'zhr19932', '123456', '210902196303173020', '2', '张盼盼', '女', '1993-03-23 19:07:46', '1971941570@qq.com', '18424324456', '沈阳大学', '人事部员', '2', '2');
insert into `emp` values ('11', 'lxx2', '123456', '210902196303173020', '3', '李筱松', '男', '1990-02-06 00:00:12', 'xs@163.com', '17432523423', '沈阳建筑大学', '维护部', '3', '3');
insert into `emp` values ('12', 'yy6662', '123456', '210902196303173020', '6', '于圆圆', '女', '1990-12-06 19:22:55', 'yynice@hotmail.com', '13434245423', '东北财经大学', '财务部', '6', '6');
insert into `emp` values ('13', 'ztt2', '123456', '210902196303173020', '5', '章天天', '女', '1990-06-05 19:54:47', 'ttgood@qq.com', '13953452666', '辽宁财贸学院', '收费部', '5', '5');
insert into `emp` values ('14', 'lht2', '123456', '210902196303173020', '4', '刘海涛', '男', '1992-12-23 20:00:09', 'haitao@163.com', '13953423673', '辽宁林业职业技术学院', '人事部', '4', '4');

/* 入职申请表 */
drop table if exists `entry`;
create table `entry` (
  `entry_id` int(11) not null auto_increment,
  `entry_name` varchar(20) not null,
  `entry_sex` varchar(20) not null,
  `entry_email` varchar(40) default null,
  `entry_phone` varchar(20) default null,
  `entry_address` varchar(80) default null,
  `entry_info` varchar(255) default null,
  `dept_id` int(10) not null,
  /* 1---------开发者(admin  123456)
	2---------普通员工
	3---------维修工
	4---------人资干事
	5---------会计
	6---------收费员*/
  `job_id` int(10) not null,
  /*
	1---------开发部
	2---------服务部
	3---------维修部
	4---------人事部
	5---------财务部
	6---------收费部
	*/
	`status` tinyint not null default '0',
	/* 
	0：入职申请未审核，
	1：入职申请审核通过， 
	2：入职申请审核未通过，
	3：入职申请审核通过， 
	4：入职申请审核未通过，
	（转正审核通过存入员工表）
	*/
  primary key (`entry_id`)
) default charset=utf8;

insert into `entry` values ('1', '张三', '男', '18866666666@qq.com', '18866666666', '辽宁省阜新市', '五年工作经验', 2, 2, 0);


/* 员工请假表 */
drop table if exists `empleave`;
create table `empleave` (
  `empleave_id` int(11) not null auto_increment,
  `empleave_name` varchar(20) not null,
  `empleave_phone` varchar(20) default null,
  `empleave_reason` varchar(255) default null,
  `empleave_day` int(10) default null,
  `job_id` int(10) not null,
  /*
	1---------开发部
	2---------服务部
	3---------维修部
	4---------人事部
	5---------财务部
	6---------收费部
	*/
	`empleave_status` tinyint not null default '0',
	/* 
	0：申请未审批，
	1：申请审批通过， 
	2：申请审批未通过，
	3：已销假
	*/
  primary key (`empleave_id`)
) default charset=utf8;

insert into `empleave` values ('1', '张三', '18866666666', '家里有事', 1, 2, 0);


/* 工资详细表*/
drop table if exists `salary`;
create table `salary` (
  `salary_id` int(11) not null auto_increment,
  `emp_id` int(11) not null,
  /*银行账号*/
  `salary_bc` varchar(20) not null,
  /*每日工资*/
  `salary_day` int(11) not null,
  /*出勤天数*/
  `salary_attendance` tinyint not null,
  /*补工资*/
  `salary_add` int(11) not null default '0',
  /*满勤*/
  `salary_full` int(11) not null default '0',
  /*每日加班金额*/
  `salary_overtime_money` int(11) not null default '0',
  /*加班天数*/
  `salary_overtime_day` int(11) not null default '0',
  /*补助*/
  `salary_subsidy` int(11) not null default '0',
  /*餐补*/
  `salary_meal` int(11) not null default '0',
  /*扣款话费*/
  `salary_deduct_phone` int(11) not null default '0',
  /*扣款罚款*/
  `salary_deduct_fine` int(11) not null default '0',
  /*扣款税金*/
  `salary_deduct_tax` int(11) not null default '0',
  /*扣款保险*/
  `salary_deduct_insurance` int(11) not null default '0',
  /*发放时间*/
  `salary_time` datetime not null,
  primary key (`salary_id`)
) engine=innodb auto_increment=2 default charset=utf8;


insert into `salary` values ('1', '1', '6227777789700789651', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2016-1-1');
insert into `salary` values ('2', '2', '6227777789700789652', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2016-2-1');
insert into `salary` values ('3', '3', '6227777789700789653', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2016-3-1');
insert into `salary` values ('4', '4', '6227777789700789654', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2016-4-1');
insert into `salary` values ('5', '5', '6227777789700789655', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2016-5-1');
insert into `salary` values ('6', '6', '6227777789700789656', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2016-6-1');
insert into `salary` values ('7', '1', '6227777789700789651', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2015-7-1');
insert into `salary` values ('8', '2', '6227777789700789652', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2015-8-1');
insert into `salary` values ('9', '3', '6227777789700789653', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2015-9-1');
insert into `salary` values ('10', '4', '6227777789700789654', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2015-10-1');
insert into `salary` values ('11', '5', '6227777789700789655', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2015-11-1');
insert into `salary` values ('12', '6', '6227777789700789656', '150', '30', '100', '100', '100', '30', '10', '10', '50', '50', '50', '50', '2015-12-1');













/* 
部门表  (废弃)
drop table if exists `dept`;
create table `dept` (
  `dept_id` int(10) not null auto_increment,
  `dept_name` varchar(20) not null,
  `dept_loc` varchar(20) not null,
  primary key (`dept_id`)
)default charset=utf8;

insert into `dept` values ('1', '开发部', '101室');
insert into `dept` values ('2', '人事部', '102室');
insert into `dept` values ('3', '服务部', '103室');
insert into `dept` values ('4', '收费部', '104室');
insert into `dept` values ('5', '维护部', '105室');
insert into `dept` values ('6', '财务部', '106室');

工资统计表 (废弃)
drop table if exists `money`;
create table `money` (
  `money_id` int(11) not null auto_increment,
  `emp_id` int(11) not null,
  `money_att` int(2) not null default '1',
  `money_time` datetime not null,
  primary key (`money_id`)
) engine=innodb auto_increment=3 default charset=utf8;

insert into `money` values ('1', '1', '1', '2016-06-21 21:59:12');
insert into `money` values ('2', '2', '1', '2016-06-19 21:59:28');

维护信息表  (废弃)
drop table if exists `source`;
create table `source` (
  `source_id` int(11) not null auto_increment,
  `source_item` varchar(20) not null,
  `source_num` int(11) not null,
  `source_coast` float(20,0) not null,
  `source_time` datetime not null,
  `source_name` varchar(20) default null,
  primary key (`source_id`)
) default charset=utf8;

职务表 (废弃)
drop table if exists `job`;
create table `job` (
  `job_id` int(10) not null auto_increment,
  `job_name` varchar(20) not null,
  primary key (`job_id`)
) engine=innodb auto_increment=7 default charset=utf8;

insert into `job` values ('1', '开发者');
insert into `job` values ('2', '服务员');
insert into `job` values ('3', '水管工');
insert into `job` values ('4', '经理');
insert into `job` values ('5', '收费员');
insert into `job` values ('6', '会计');

图片表 (废弃)
drop table if exists `image`;
create table `image` (
  `image_id` int(10) not null auto_increment,
  `image_type` varchar(20) not null,
  `image_ref_id` int(10) not null,
  `image_data` blob,
  primary key (`image_id`)
) engine=innodb default charset=utf8;

*/
