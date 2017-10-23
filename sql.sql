#生活服务分类表
CREATE TABLE `o2o_category`(
`id` int(11) unsigned NOT NULL auto_increment,
`name` varchar(50) not null default '',
#子类
`parent_id` int(10) unsigned not null default 0,
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`),
key parent_id(`parent_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;


#城市表
CREATE TABLE `o2o_city`(
`id` int(11) unsigned NOT NULL auto_increment,
`name` varchar(50) not null default '',
#城市英文名
`uname` varchar(50) not null default '',
#子类
`parent_id` int(10) unsigned not null default 0,
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`),
key parent_id(`parent_id`),
unique key`uname`(`uname`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;


#商圈表
CREATE TABLE `o2o_area`(
`id` int(11) unsigned NOT NULL auto_increment,
`name` varchar(50) not null default '',
`city_id` int(11) unsigned not null default 0,
#子类
`parent_id` int(10) unsigned not null default 0,
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`),
key parent_id(`parent_id`),
unique key`city_id`(`city_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;



#商户表
CREATE TABLE `o2o_bis`(
`id` int(11) unsigned NOT NULL auto_increment,
`name` varchar(50) not null default '',
`email` varchar(50) not null default '',
`logo` varchar(255) not null default '',
`licence_logo` varchar(255) not null default '',
`description` text not null,
`city_id` int(11) unsigned not null default 0,
`city_path` varchar(50) not null default '',
#银行信息
`bank_info` varchar(50) not null default '',
#金额
`money` decimal(20,2) not null default '0.00',
#开户名称
`bank_name` varchar(50) not null default '',
#开户人姓名
`bank_user` varchar(50) not null default '',
#法人
`faren` varchar(20) not null default '',
#法人联系方式
`faren_tel` varchar(20) not null default '',
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`),
key city_id(`city_id`),
key name(`name`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;



#商户账号表
CREATE TABLE `o2o_bis_accout`(
`id` int(11) unsigned NOT NULL auto_increment,
`username` varchar(50) not null default '',
`password` char(32) not null default '',
#不同的随机数
`code` varchar(10) not null default '',
#最后登录的ip
`last_login_ip` varchar(20) not null default '',
`last_login_time` int(11) not null default 0,
#属于哪个商户 空值不能问'',因为int类型自能是数值
`bis_id`  int(11) unsigned not null default 0,
#是否是总管理员
`is_main` tinyint(1) unsigned not null default 0,
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`),
key bis_id(`bis_id`),
key username(`username`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;



#商户门店表
CREATE TABLE `o2o_bis_location`(
`id` int(11) unsigned NOT NULL auto_increment,
`name` varchar(50) not null default '',
`logo` varchar(255) not null default '',
`address` varchar(255) not null default '',
#电话
`tel` varchar(20) not null default '',
#联系人
`contact` varchar(20) not null default '',
#经纬度
`xpoint` varchar(20) not null default '',
`ypoint` varchar(20) not null default '',
`bis_id` int(11) unsigned not null default 0,
`city_id` int(11) unsigned not null default 0,
`city_path` varchar(50) not null default '',
#分类
`category_id` int(11) unsigned not null default 0,
`category_path` varchar(50)  not null default '',
`open_time` int(11) unsigned not null default 0,
#信息介绍
`content` text not null,
#是否是总店
`is_main` tinyint(1) unsigned not null default 0,
#地址
`api_address` varchar(255) not null default '',
#银行信息
`bank_info` varchar(50) not null default '',
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`),
key city_id(`city_id`),
key bis_id(`bis_id`),
key category_id(`category_id`),
key name(`name`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;



#团购商品表
create table `o2o_deal`(
`id` int(11) unsigned not null auto_increment,
`name` varchar(100) not null default '',
`category_id` int(11) not null default 0,
`se_category_id` int(11) not null default 0,
`bis_id` int(11) not null default 0,
`location_ids` varchar(100) not null default '',
`image` varchar(200) not null default '',
`description` text not null,
`start_time` int(11) not null default 0,
`end_time` int(11) not null default 0,
 `origin_price` decimal(20,2) not null default '0.00',
 `current_price` decimal(20,2) not null default '0.00',
`city_id` int(11) not null default 0,
`buy_count` int(11) not null default 0,
`total_count` int(11) not null default 0,
`coupons_end_time` int(11) not null default 0,
`coupons_begin_time` int(11) not null default 0,
`xpoint` varchar(20) not null default '',
`ypoint` varchar(20) not null default '',
`bis-account_id` int(10) not null default 0,
`balance_price`  decimal(20,2) not null default '0.00',
`notes` text not null,
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`),
key category_id(`category_id`),
key se_category_id(`se_category_id`),
key city_id(`city_id`),
key start_time(`start_time`),
key end_time(`end_time`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

#团购商品表
create table `o2o_user`(
`id` int(11)  unsigned not null auto_increment,
`username` varchar(20) not null default '',
`password` char(32) not null default '',
#不同的随机数
`code`varchar(10) not null default '',
#最后登录的ip
`last_login_ip` varchar(20) not null default '',
`last_login_time` int(11) not null default 0,
`email` varchar(30) not null default '',
`mobile` varchar(20) not null default '',
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`),
unique key username(`username`),
unique key email(`email`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;


#推荐商品表
create table `o2o_featured`(
`id` int(11)  unsigned not null auto_increment,
`type` tinyint(1) not null default 0,
`title` varchar(30) not null default '',
`image` varchar(255) not null default '',
`description` varchar(255) not null default '',
#排序
`listorder` int(8) unsigned not null default 0,
#状态
`status` tinyint(1) not null default 0,
#创建时间
`create_time` int(11) unsigned not null default 0,
#更新时间
`update_time` int(11) unsigned not null default 0,
primary key (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;