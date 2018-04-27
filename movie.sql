/*
Navicat MySQL Data Transfer

Source Server         : movie
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : movie

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2018-01-10 12:25:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cus_id` varchar(11) DEFAULT NULL,
  `cus_name` varchar(40) DEFAULT NULL,
  `cus_sex` varchar(2) DEFAULT NULL,
  `cus_phone` varchar(11) DEFAULT NULL,
  `vip_id` varchar(11) DEFAULT NULL,
  `cus_viptime` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('CUS80000001', '王豪杰', '男', '13848910364', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000002', '陈觉柽', '男', '13845678911', '2', '5天');
INSERT INTO `customer` VALUES ('CUS80000003', '方伟杰', '男', '18645678912', '3', '16天');
INSERT INTO `customer` VALUES ('CUS80000004', '卢传文', '男', '18945646910', '4', '18天');
INSERT INTO `customer` VALUES ('CUS80000005', '张翔宇', '男', '15915467911', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000006', '郑心奕', '男', '13945563412', '2', '25天');
INSERT INTO `customer` VALUES ('CUS80000007', '吴枭宇', '男', '13676588910', '3', '13天');
INSERT INTO `customer` VALUES ('CUS80000008', '尹琪宝', '男', '18953438992', '4', '27天');
INSERT INTO `customer` VALUES ('CUS80000009', '林杨坤', '男', '13845888914', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000010', '史晨柯', '男', '13945564552', '2', '29天');
INSERT INTO `customer` VALUES ('CUS80000011', '江信朋', '男', '18045678889', '3', '7天');
INSERT INTO `customer` VALUES ('CUS80000012', '郭浩晨', '男', '18645678912', '4', '10天');
INSERT INTO `customer` VALUES ('CUS80000013', '翁天翔', '男', '15915467911', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000014', '陈鸿波', '男', '15968766783', '2', '18天');
INSERT INTO `customer` VALUES ('CUS80000015', '徐畅阳', '男', '18645678912', '3', '21天');
INSERT INTO `customer` VALUES ('CUS80000016', '胡田昊', '男', '18832338373', '4', '8天');
INSERT INTO `customer` VALUES ('CUS80000017', '董堃昊', '男', '18745368919', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000018', '马振豪', '男', '18645678912', '2', '23天');
INSERT INTO `customer` VALUES ('CUS80000019', '孙锴成', '男', '15915467911', '3', '17天');
INSERT INTO `customer` VALUES ('CUS80000020', '马宇腾', '男', '18005888690', '4', '8天');
INSERT INTO `customer` VALUES ('CUS80000021', '李溧君', '女', '13845678911', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000022', '孔宁静', '女', '15977896783', '2', '9天');
INSERT INTO `customer` VALUES ('CUS80000023', '胡晴雯', '女', '13945564552', '3', '13天');
INSERT INTO `customer` VALUES ('CUS80000024', '应静雪', '女', '13775628971', '4', '25天');
INSERT INTO `customer` VALUES ('CUS80000025', '胡夏璐', '女', '15977896783', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000026', '潘晨婷', '女', '13845678911', '2', '17天');
INSERT INTO `customer` VALUES ('CUS80000027', '陈彩霞', '女', '18956924567', '3', '27天');
INSERT INTO `customer` VALUES ('CUS80000028', '陈嘉露', '女', '15977896783', '4', '23天');
INSERT INTO `customer` VALUES ('CUS80000029', '何小义', '女', '18997666983', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000030', '卢秀秀', '女', '18005888690', '2', '26天');
INSERT INTO `customer` VALUES ('CUS80000031', '胡淑婷', '女', '18997666983', '3', '14天');
INSERT INTO `customer` VALUES ('CUS80000032', '将依群', '女', '18005888690', '4', '24天');
INSERT INTO `customer` VALUES ('CUS80000033', '陈丹娅', '女', '18669876809', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000034', '胡淑媛', '女', '18997666983', '2', '17天');
INSERT INTO `customer` VALUES ('CUS80000035', '孔百慧', '女', '18956924567', '3', '16天');
INSERT INTO `customer` VALUES ('CUS80000036', '王莹莹', '女', '13945564552', '4', '13天');
INSERT INTO `customer` VALUES ('CUS80000037', '杨秀萍', '女', '18669876809', '1', '永久');
INSERT INTO `customer` VALUES ('CUS80000038', '张湘楠', '女', '18956924567', '2', '16天');
INSERT INTO `customer` VALUES ('CUS80000039', '赵艳琳', '女', '13869906233', '3', '18天');
INSERT INTO `customer` VALUES ('CUS80000040', '周丽斓', '女', '18997666983', '4', '26天');
INSERT INTO `customer` VALUES ('', '', '男', '', '', '');
INSERT INTO `customer` VALUES ('', '', '男', '', '', '');
INSERT INTO `customer` VALUES ('', '', '男', '', '', '');

-- ----------------------------
-- Table structure for hall
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall` (
  `hal_id` varchar(11) DEFAULT NULL,
  `hal_name` varchar(40) DEFAULT NULL,
  `hal_rows` int(11) DEFAULT NULL,
  `hal_seats` int(11) DEFAULT NULL,
  `hal_count` int(11) DEFAULT NULL,
  `hal_kind` varchar(40) DEFAULT NULL,
  `hal_state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES ('HALL001', '1号厅', '8', '16', '128', '小', '1');
INSERT INTO `hall` VALUES ('HALL002', '2号厅', '8', '16', '128', '小', '1');
INSERT INTO `hall` VALUES ('HALL003', '3号厅', '9', '15', '135', '小', '1');
INSERT INTO `hall` VALUES ('HALL004', '4号厅', '9', '15', '135', '小', '1');
INSERT INTO `hall` VALUES ('HALL005', '5号厅', '12', '20', '240', '大', '1');
INSERT INTO `hall` VALUES ('HALL006', '6号厅', '11', '21', '231', '大', '1');
INSERT INTO `hall` VALUES ('HALL007', '7号厅', '12', '20', '240', '大', '1');
INSERT INTO `hall` VALUES ('HALL008', '8号厅', '11', '21', '231', '大', '1');
INSERT INTO `hall` VALUES ('HALL009', 'IMAX1厅', '9', '16', '145', '小', '1');
INSERT INTO `hall` VALUES ('HALL010', 'IMAX2厅', '12', '21', '252', '大', '0');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'admin', '123456', '1');
INSERT INTO `login` VALUES ('2', '88', 'iiiii', '1');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `mov_id` varchar(11) DEFAULT NULL,
  `mov_name` varchar(40) DEFAULT NULL,
  `mov_introduce` varchar(255) DEFAULT NULL,
  `mov_indate` varchar(10) DEFAULT NULL,
  `mov_outdate` varchar(10) DEFAULT NULL,
  `mov_time` varchar(40) DEFAULT NULL,
  `mov_director` varchar(40) DEFAULT NULL,
  `mov_star` varchar(40) DEFAULT NULL,
  `mov_style` varchar(40) DEFAULT NULL,
  `mov_kind` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('LMA20170001', '星球大战：最后的绝地武士', '摧毁了恐怖的弑星者基地之后，蕾伊（黛茜·雷德利饰）独自前往遥远的星系，寻访隐居的卢克·天行者（马克·哈米尔饰），\r\n	   在他的的指导下接受原力训练，同时展开一场史诗般的冒险，揭开原力的古老秘密，探索那不为人知的过去。\r\n	   芬恩（约翰·波耶加饰）、波·达默龙（奥斯卡·伊萨克饰）和义军则面对着第一秩序更加凶狠的反扑，\r\n	   引发正义的抵抗组织和邪恶的第一秩序之间新的一轮对抗。', '2017-01-05', '2018-02-05', '152', '莱恩·约翰逊', '黛茜·雷德利，约翰·波耶加', '3D', '科幻、动作、冒险');
INSERT INTO `movie` VALUES ('LMA20170002', '芳华', '在充满理想和激情的军队文工团，一群正值芳华的青春少年，经历着成长中的爱情萌发与充斥变数的人生命运。\r\n	  乐于助人、质朴善良的刘峰（黄轩饰）和从农村来的屡遭文工团女兵歧视与排斥的何小萍（苗苗饰），\r\n	  意外离开了浪漫安逸的文工团，卷入了残酷的战争，在战场上继续绽放着血染的芳华。他们感受着集体生活的痛与暖、\r\n	  故人的分别与重逢，还有时代变革之下，每个人的渺小脆弱和无力招架。而昔日的文工团战友萧穗子（钟楚曦饰）、\r\n	  林丁丁（杨采钰饰）、郝淑雯（李晓峰饰）、陈灿（王天辰饰）等人，在大时代的背景', '2017-12-15', '2018-01-15', '136', '冯小刚', '黄轩，苗苗，钟楚曦，杨采钰，李晓峰', '2D', '剧情、战争');
INSERT INTO `movie` VALUES ('LMA20170003', '前任3：再见前任', '相恋多年的孟云和林佳在一次争吵后分手。分手后的两人看似过着各自的生活，却都因为心系对方又要故作洒脱而相互暗自较劲。\r\n	  当两人想要重归于好时却发现早已回不去了，两人遗憾的擦身而过，变成了最熟悉的陌生人。', '2017-12-29', '2018-01-29', '120', '田羽生', '韩庚，郑恺，于文文，曾梦雪，罗米，韩文亮', '2D', '喜剧，爱情');

-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play` (
  `pla_id` varchar(11) DEFAULT NULL,
  `hal_id` varchar(11) DEFAULT NULL,
  `mov_id` varchar(11) DEFAULT NULL,
  `pla_starttime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pla_price` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of play
-- ----------------------------
INSERT INTO `play` VALUES ('PLAY2017001', 'HALL009', 'LMA20170001', '2018-01-10 10:30:00', '43.50');
INSERT INTO `play` VALUES ('PLAY2017002', 'HALL005', 'LMA20170001', '2018-01-10 12:00:00', '43.50');
INSERT INTO `play` VALUES ('PLAY2017003', 'HALL002', 'LMA20170001', '2018-01-10 13:30:00', '43.50');
INSERT INTO `play` VALUES ('PLAY2017004', 'HALL009', 'LMA20170001', '2018-01-10 14:40:00', '43.50');
INSERT INTO `play` VALUES ('PLAY2017005', 'HALL006', 'LMA20170001', '2018-01-10 17:30:00', '43.50');
INSERT INTO `play` VALUES ('PLAY2017006', 'HALL002', 'LMA20170001', '2018-01-10 18:20:00', '43.50');
INSERT INTO `play` VALUES ('PLAY2017007', 'HALL005', 'LMA20170001', '2018-01-10 20:00:00', '43.50');
INSERT INTO `play` VALUES ('PLAY2017008', 'HALL010', 'LMA20170001', '2018-01-10 21:10:00', '43.50');
INSERT INTO `play` VALUES ('PLAY2017009', 'HALL001', 'LMA20170002', '2018-01-10 12:10:00', '40.00');
INSERT INTO `play` VALUES ('PLAY2017010', 'HALL004', 'LMA20170002', '2018-01-10 14:40:00', '40.00');
INSERT INTO `play` VALUES ('PLAY2017011', 'HALL008', 'LMA20170002', '2018-01-10 17:15:00', '40.00');
INSERT INTO `play` VALUES ('PLAY2017012', 'HALL001', 'LMA20170002', '2018-01-10 20:10:00', '40.00');
INSERT INTO `play` VALUES ('PLAY2017013', 'HALL010', 'LMA20170003', '2018-01-10 09:40:00', '46.75');
INSERT INTO `play` VALUES ('PLAY2017014', 'HALL003', 'LMA20170003', '2018-01-10 11:20:00', '46.75');
INSERT INTO `play` VALUES ('PLAY2017015', 'HALL010', 'LMA20170003', '2018-01-10 12:20:00', '46.75');
INSERT INTO `play` VALUES ('PLAY2017016', 'HALL006', 'LMA20170003', '2018-01-10 13:20:00', '46.75');
INSERT INTO `play` VALUES ('PLAY2017017', 'HALL007', 'LMA20170003', '2018-01-10 15:40:00', '46.75');
INSERT INTO `play` VALUES ('PLAY2017018', 'HALL003', 'LMA20170003', '2018-01-10 16:00:00', '46.75');
INSERT INTO `play` VALUES ('PLAY2017019', 'HALL005', 'LMA20170003', '2018-01-10 18:40:00', '46.75');
INSERT INTO `play` VALUES ('PLAY2017020', 'HALL009', 'LMA20170003', '2018-01-10 19:30:00', '46.75');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `sta_id` varchar(11) DEFAULT NULL,
  `sta_name` varchar(40) DEFAULT NULL,
  `sta_sex` varchar(2) DEFAULT NULL,
  `sta_kind` varchar(40) DEFAULT NULL,
  `sta_phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('STAFF001', '张三', '男', '经理', '15968798848');
INSERT INTO `staff` VALUES ('STAFF002', '王丽', '女', '售票员', '18632945848');
INSERT INTO `staff` VALUES ('STAFF003', '赵芸', '女', '售票员', '15958975418');

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `tic_id` varchar(11) DEFAULT NULL,
  `tic_price` double DEFAULT NULL,
  `hal_number` int(11) DEFAULT NULL,
  `pla_id` varchar(11) DEFAULT NULL,
  `tic_code` varchar(40) DEFAULT NULL,
  `cus_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES ('TIC10001', '0', '64', 'PLAY2017001', 'WFGG1859T', 'CUS80000001');
INSERT INTO `ticket` VALUES ('TIC10002', '0', '56', 'PLAY2017002', 'DFE1521EY', 'CUS80000002');
INSERT INTO `ticket` VALUES ('TIC10003', '0', '64', 'PLAY2017003', 'WEHF1859U', 'CUS80000003');
INSERT INTO `ticket` VALUES ('TIC10004', '0', '56', 'PLAY2017004', 'AS1521E9I', 'CUS80000004');
INSERT INTO `ticket` VALUES ('TIC10005', '0', '64', 'PLAY2017005', '5EHF1859O', 'CUS80000005');
INSERT INTO `ticket` VALUES ('TIC10006', '0', '56', 'PLAY2017006', 'WE1521E9P', 'CUS80000006');
INSERT INTO `ticket` VALUES ('TIC10007', '0', '64', 'PLAY2017007', 'WEFF18597', 'CUS80000007');
INSERT INTO `ticket` VALUES ('TIC10008', '0', '56', 'PLAY2017008', 'W41521E98', 'CUS80000008');
INSERT INTO `ticket` VALUES ('TIC10009', '0', '64', 'PLAY2017009', 'REHF18DFY', 'CUS80000009');
INSERT INTO `ticket` VALUES ('TIC10010', '0', '56', 'PLAY2017010', 'WE1521E9Q', 'CUS80000010');
INSERT INTO `ticket` VALUES ('TIC10011', '0', '64', 'PLAY2017011', 'YEHD1859W', 'CUS80000011');
INSERT INTO `ticket` VALUES ('TIC10012', '0', '56', 'PLAY2017012', 'WE15D1E9E', 'CUS80000012');
INSERT INTO `ticket` VALUES ('TIC10013', '0', '64', 'PLAY2017013', 'WFGGFS85R', 'CUS80000013');
INSERT INTO `ticket` VALUES ('TIC10014', '0', '56', 'PLAY2017014', 'WE15F1EYU', 'CUS80000014');
INSERT INTO `ticket` VALUES ('TIC10015', '0', '64', 'PLAY2017015', 'WEHD1AF9A', 'CUS80000015');
INSERT INTO `ticket` VALUES ('TIC10016', '0', '56', 'PLAY2017016', 'WE1521E9S', 'CUS80000016');
INSERT INTO `ticket` VALUES ('TIC10017', '0', '64', 'PLAY2017017', 'WEHFF459D', 'CUS80000017');
INSERT INTO `ticket` VALUES ('TIC10018', '0', '56', 'PLAY2017018', 'W32521E9F', 'CUS80000018');
INSERT INTO `ticket` VALUES ('TIC10019', '0', '64', 'PLAY2017019', 'W4FRF189G', 'CUS80000019');
INSERT INTO `ticket` VALUES ('TIC10020', '0', '56', 'PLAY2017020', '4E152TE9H', 'CUS80000020');
INSERT INTO `ticket` VALUES ('TIC10021', '0', '64', 'PLAY2017001', 'WEHF2359J', 'CUS80000021');
INSERT INTO `ticket` VALUES ('TIC10022', '0', '56', 'PLAY2017002', 'WE1TG1E9K', 'CUS80000022');
INSERT INTO `ticket` VALUES ('TIC10023', '0', '64', 'PLAY2017003', '5THF185JL', 'CUS80000023');
INSERT INTO `ticket` VALUES ('TIC10024', '0', '56', 'PLAY2017004', 'FR1521E9Z', 'CUS80000024');
INSERT INTO `ticket` VALUES ('TIC10025', '0', '64', 'PLAY2017005', 'WEH4G859X', 'CUS80000025');
INSERT INTO `ticket` VALUES ('TIC10026', '0', '56', 'PLAY2017006', 'WF1541E9C', 'CUS80000026');
INSERT INTO `ticket` VALUES ('TIC10027', '0', '64', 'PLAY2017007', 'WEHFD856V', 'CUS80000027');
INSERT INTO `ticket` VALUES ('TIC10028', '0', '56', 'PLAY2017008', 'WE1521E9B', 'CUS80000028');
INSERT INTO `ticket` VALUES ('TIC10029', '0', '64', 'PLAY2017009', '4EHF1859N', 'CUS80000029');
INSERT INTO `ticket` VALUES ('TIC10030', '0', '56', 'PLAY2017010', '3E1DR1E9M', 'CUS80000030');
INSERT INTO `ticket` VALUES ('TIC10031', '0', '64', 'PLAY2017011', 'ER4F18594', 'CUS80000031');
INSERT INTO `ticket` VALUES ('TIC10032', '0', '56', 'PLAY2017012', '4R1521E9H', 'CUS80000032');
INSERT INTO `ticket` VALUES ('TIC10033', '0', '64', 'PLAY2017013', '6YHF1859E', 'CUS80000033');
INSERT INTO `ticket` VALUES ('TIC10034', '0', '56', 'PLAY2017014', 'GT1521E96', 'CUS80000034');
INSERT INTO `ticket` VALUES ('TIC10035', '0', '64', 'PLAY2017015', 'H6HF1859E', 'CUS80000035');
INSERT INTO `ticket` VALUES ('TIC10036', '0', '64', 'PLAY2017016', '4FHF1859G', 'CUS80000036');
INSERT INTO `ticket` VALUES ('TIC10037', '0', '56', 'PLAY2017017', 'H61521E9T', 'CUS80000037');
INSERT INTO `ticket` VALUES ('TIC10038', '0', '64', 'PLAY2017018', 'F3RV18592', 'CUS80000038');
INSERT INTO `ticket` VALUES ('TIC10039', '0', '56', 'PLAY2017019', 'EFC521E9W', 'CUS80000039');
INSERT INTO `ticket` VALUES ('TIC10040', '0', '56', 'PLAY2017020', '2WE521E9X', 'CUS80000040');
INSERT INTO `ticket` VALUES ('gmpd3dal', '43.5', '11', 'PLAY2017001', 'v8740dzy6nq60gto', '');
INSERT INTO `ticket` VALUES ('qgvkxu3u', '43.5', '16', 'PLAY2017001', 'ngdlxi23n8ts5l6k', '');
INSERT INTO `ticket` VALUES ('3qx8ashc', '43.5', '11', 'PLAY2017001', '1ya4cmt1uderwkje', '');
INSERT INTO `ticket` VALUES ('c1tgaqkg', '43.5', '15', 'PLAY2017001', '50ntpf8vn99d322z', '');
INSERT INTO `ticket` VALUES ('b9fozx28', '43.5', '12', 'PLAY2017001', 'ms5e3ice6j41kxuq', '');

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `vip_id` varchar(11) DEFAULT NULL,
  `vip_price` varchar(40) DEFAULT NULL,
  `vip_level` varchar(40) DEFAULT NULL,
  `vip_discount` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES ('1', '0', '普通', '1.0');
INSERT INTO `vip` VALUES ('2', '30', '白银', '0.9');
INSERT INTO `vip` VALUES ('3', '50', '黄金', '0.7');
INSERT INTO `vip` VALUES ('4', '100', '钻石', '0.5');
