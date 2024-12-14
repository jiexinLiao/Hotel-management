/*
 Navicat Premium Data Transfer

 Source Server         : locahost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 25/03/2023 14:10:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hotel_book
-- ----------------------------
DROP TABLE IF EXISTS `hotel_book`;
CREATE TABLE `hotel_book`  (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '预约id',
  `room_type_id` bigint(20) NULL DEFAULT NULL COMMENT '房间类型id',
  `room_id` bigint(20) NULL DEFAULT NULL COMMENT '房间id',
  `in_time` datetime(0) NULL DEFAULT NULL COMMENT '入住时间',
  `out_time` datetime(0) NULL DEFAULT NULL COMMENT '离开时间',
  `book_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '预约人',
  `book_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '预约人手机',
  `book_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '预约人邮箱',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `move_in` int(4) NOT NULL DEFAULT 0 COMMENT '是否入住，1是 0否',
  `move_out` int(4) NOT NULL DEFAULT 0 COMMENT '是否离开，1是 0否',
  `book_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约编码',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店预约表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_book
-- ----------------------------
INSERT INTO `hotel_book` VALUES (19, 1, NULL, '2023-03-29 00:00:00', '2023-03-30 00:00:00', '张先生', '13677656768', 'gary17355@163.com', '', NULL, '', NULL, 0, 0, 'xxx-vip-19');

-- ----------------------------
-- Table structure for hotel_carousel
-- ----------------------------
DROP TABLE IF EXISTS `hotel_carousel`;
CREATE TABLE `hotel_carousel`  (
  `carousel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_carousel
-- ----------------------------
INSERT INTO `hotel_carousel` VALUES (1, '家庭套餐', '享受家人美好时光', '/profile/upload/2023/03/24/6f74fd20222402ec249c60fd8cec6e52_20230324210321A001.jpeg', 1, '', '2023-03-21 16:56:12', '', '2023-03-24 21:03:23');
INSERT INTO `hotel_carousel` VALUES (2, '精品单间', '让你的旅途更舒适', '/profile/upload/2023/03/24/7b52cf49e8abc8fff7be979af5268cc3_20230324210328A002.jpeg', 2, '', '2023-03-21 16:56:12', '', '2023-03-24 21:03:29');
INSERT INTO `hotel_carousel` VALUES (3, '情侣套房', '享受美好双人世界', '/profile/upload/2023/03/24/89469b61a01669c282417d200148e051_20230324210412A003.jpg', 3, '', '2023-03-21 16:56:12', '', '2023-03-24 21:04:14');

-- ----------------------------
-- Table structure for hotel_menu
-- ----------------------------
DROP TABLE IF EXISTS `hotel_menu`;
CREATE TABLE `hotel_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `introduce` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单介绍描述',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单介绍详情',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_menu
-- ----------------------------
INSERT INTO `hotel_menu` VALUES (1, 0, '网站首页', NULL, 'index.html', NULL, NULL, NULL, 1, '', '2023-03-21 16:56:12', '', '2023-03-24 21:11:53');
INSERT INTO `hotel_menu` VALUES (2, 0, '房间介绍', '选择我们的酒店', 'hotel.html', '/profile/upload/2023/03/24/menu1_20230324211016A004.jpeg', NULL, '最便利的活动送给你们，最艰难的工作留给我们', 2, '', '2023-03-21 16:56:12', '', '2023-03-24 21:10:18');
INSERT INTO `hotel_menu` VALUES (3, 0, '服务介绍', '我们的服务', 'services.html', '/profile/upload/2023/03/24/menu2_20230324214036A040.jpeg', NULL, '最好的服务带给最爱的你们', 3, '', '2023-03-21 16:56:12', '', '2023-03-24 21:40:37');
INSERT INTO `hotel_menu` VALUES (4, 0, '新闻中心', '关注我们的新闻，了解最新活动和优惠', 'blog.html', '/profile/upload/2023/03/24/menu3_20230324211030A006.jpg', NULL, '关注我们的新闻，了解最新活动和优惠', 4, '', '2023-03-21 16:56:12', '', '2023-03-24 21:10:32');
INSERT INTO `hotel_menu` VALUES (5, 0, '联系我们', '联系我们', 'contact.html', '/profile/upload/2023/03/24/menu4_20230324211036A007.jpg', NULL, '联系我们获取服务', 5, '', '2023-03-21 16:56:12', '', '2023-03-24 21:10:38');

-- ----------------------------
-- Table structure for hotel_news
-- ----------------------------
DROP TABLE IF EXISTS `hotel_news`;
CREATE TABLE `hotel_news`  (
  `news_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '常识详细',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `is_show` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否显示标志（1是，0否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`news_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店新闻中心' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_news
-- ----------------------------
INSERT INTO `hotel_news` VALUES (1, '听说一种深海珍宝游到了彩蝶谷', '<p>都说龙趸全身是宝，不同部位适合烹制不同菜式，彩蝶谷美食廊素来以出品风味混搭、菜式做法多样而闻名，这次的龙趸系列当然也不会让老饕们失望，大厨以“焖炖焗蒸”等多种烹饪方式，为您带来十多款龙趸菜式，深海珍宝好多美味？小编近水楼台先尝味，您就暂时要“望梅止渴”，看着小编上图啦！</p><p>粤语常说“饮头啖汤”，注重食补健康的岭南人，尤其重视正式上菜前的暖场汤水，这道“天麻炖龙趸头”，用的是最为营养滋补的龙趸头，斩件加上天麻和其它配料入瓮慢火炖煮，将鱼头丰富的胶原和鲜味释放，加上淡淡的药材汤料的清香，味道清甜不油腻，最适合这种炎热的天气。</p><p>对美味的追求不只是大人的权利，这道“芙蓉蛋白蒸龙趸肉”特别适合小孩子，师傅以精湛刀法加工龙趸鱼，片片均匀，没有一丝骨头；蛋白加入龙趸骨熬制的鱼汤打匀，放入鱼片同蒸。火候控制要恰到好处，鱼片刚熟，芙蓉蛋白嫩滑，每一口都是鲜美鱼肉和蛋白，绝对是小孩子下饭的好选择。</p>', '/profile/upload/2023/03/24/room5_20230324213808A035.jpeg', 1, '1', '', '2023-03-21 16:56:12', '', '2023-03-24 21:38:10');
INSERT INTO `hotel_news` VALUES (2, '婚宴——定格幸福瞬间', '<p>dsafdsfds都说龙趸全身是宝，不同部位适合烹制不同菜式，彩蝶谷美食廊素来以出品风味混搭、菜式做法多样而闻名，这次的龙趸系列当然也不会让老饕们失望，大厨以“焖炖焗蒸”等多种烹饪方式，为您带来十多款龙趸菜式，深海珍宝好多美味？小编近水楼台先尝味，您就暂时要“望梅止渴”，看着小编上图啦！</p><p>粤语常说“饮头啖汤”，注重食补健康的岭南人，尤其重视正式上菜前的暖场汤水，这道“天麻炖龙趸头”，用的是最为营养滋补的龙趸头，斩件加上天麻和其它配料入瓮慢火炖煮，将鱼头丰富的胶原和鲜味释放，加上淡淡的药材汤料的清香，味道清甜不油腻，最适合这种炎热的天气。</p><p>对美味的追求不只是大人的权利，这道“芙蓉蛋白蒸龙趸肉”特别适合小孩子，师傅以精湛刀法加工龙趸鱼，片片均匀，没有一丝骨头；蛋白加入龙趸骨熬制的鱼汤打匀，放入鱼片同蒸。火候控制要恰到好处，鱼片刚熟，芙蓉蛋白嫩滑，每一口都是鲜美鱼肉和蛋白，绝对是小孩子下饭的好选择。</p>', '/profile/upload/2023/03/24/room2_20230324213817A036.jpeg', 2, '1', '', '2023-03-21 16:56:12', '', '2023-03-24 21:38:19');
INSERT INTO `hotel_news` VALUES (3, '任凭刮风下雨，也不能阻碍我的热情', '<p>说龙趸全身是宝，不同部位适合烹制不同菜式，彩蝶谷美食廊素来以出品风味混搭、菜式做法多样而闻名，这次的龙趸系列当然也不会让老饕们失望，大厨以“焖炖焗蒸”等多种烹饪方式，为您带来十多款龙趸菜式，深海珍宝好多美味？小编近水楼台先尝味，您就暂时要“望梅止渴”，看着小编上图啦！</p><p>粤语常说“饮头啖汤”，注重食补健康的岭南人，尤其重视正式上菜前的暖场汤水，这道“天麻炖龙趸头”，用的是最为营养滋补的龙趸头，斩件加上天麻和其它配料入瓮慢火炖煮，将鱼头丰富的胶原和鲜味释放，加上淡淡的药材汤料的清香，味道清甜不油腻，最适合这种炎热的天气。</p><p>对美味的追求不只是大人的权利，这道“芙蓉蛋白蒸龙趸肉”特别适合小孩子，师傅以精湛刀法加工龙趸鱼，片片均匀，没有一丝骨头；蛋白加入龙趸骨熬制的鱼汤打匀，放入鱼片同蒸。火候控制要恰到好处，鱼片刚熟，芙蓉蛋白嫩滑，每一口都是鲜美鱼肉和蛋白，绝对是小孩子下饭的好选择。</p>', '/profile/upload/2023/03/24/room8_20230324213835A037.jpeg', 3, '1', '', '2023-03-21 16:56:12', '', '2023-03-24 21:38:37');
INSERT INTO `hotel_news` VALUES (4, '七夕蟹逅，浓情蜜意', '<p>的撒大巴萨的巴萨计划</p><p>女粉丝打击开发商的开发你</p><p><br></p><p><br></p><p>负担翻山蹈海福克纳</p>', '/profile/upload/2023/03/24/487addff2a16447c02c8a8261c1e822f_20230324213850A038.jpeg', 4, '1', '', '2023-03-21 16:56:12', '', '2023-03-24 21:38:52');
INSERT INTO `hotel_news` VALUES (5, '婚宴——定格幸福瞬间', '<p>的活塞i的哈商大那是的那艘的就是大幅低开的士大夫十分你的伤口</p><p><br></p><p><br></p><p>负担翻山蹈海弄</p>', '/profile/upload/2023/03/24/c0e26df1e3d5839bb79388fbdb5e2406_20230324213924A039.jpg', 5, '1', '', '2023-03-21 16:56:12', '', '2023-03-24 21:39:27');

-- ----------------------------
-- Table structure for hotel_room
-- ----------------------------
DROP TABLE IF EXISTS `hotel_room`;
CREATE TABLE `hotel_room`  (
  `room_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `room_num` bigint(20) NULL DEFAULT NULL COMMENT '房间号',
  `room_type_id` bigint(20) NULL DEFAULT NULL COMMENT '房间类型id',
  `room_price` int(4) NULL DEFAULT NULL COMMENT '房间价格',
  `room_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `room_introduce` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间介绍',
  `room_detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '房间详情',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否上架（1是 0否）',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店房间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_room
-- ----------------------------
INSERT INTO `hotel_room` VALUES (1, 101, 1, 299, '/profile/upload/2023/03/24/room1_20230324211338A008.jpeg', '很舒服的房间', NULL, '1', 1, '', '2023-03-21 16:56:12', '', '2023-03-24 21:13:41');
INSERT INTO `hotel_room` VALUES (2, 102, 1, 299, '/profile/upload/2023/03/24/room1_20230324211749A014.jpeg', '11', '<p>11</p>', '1', 2, '', '2023-03-21 16:56:12', '', '2023-03-24 21:17:52');
INSERT INTO `hotel_room` VALUES (3, 103, 1, 299, '/profile/upload/2023/03/24/room1_20230324211758A015.jpeg', NULL, '<p><br></p>', '1', 3, '', '2023-03-21 16:56:12', '', '2023-03-24 21:18:00');
INSERT INTO `hotel_room` VALUES (4, 201, 2, 199, '/profile/upload/2023/03/24/room2_20230324211829A017.jpeg', '1', NULL, '1', 1, '', '2023-03-21 16:56:12', '', '2023-03-24 21:18:32');
INSERT INTO `hotel_room` VALUES (5, 202, 2, 199, '/profile/upload/2023/03/24/room2_20230324211842A018.jpeg', NULL, NULL, '1', 2, '', '2023-03-21 16:56:12', '', '2023-03-24 21:18:44');
INSERT INTO `hotel_room` VALUES (6, 203, 2, 199, '/profile/upload/2023/03/24/room2_20230324211850A019.jpeg', NULL, NULL, '1', 3, '', '2023-03-21 16:56:12', '', '2023-03-24 21:18:52');
INSERT INTO `hotel_room` VALUES (7, 301, 3, 388, '/profile/upload/2023/03/24/room3_20230324211952A021.jpeg', NULL, NULL, '1', 1, '', '2023-03-21 16:56:12', '', '2023-03-24 21:19:54');
INSERT INTO `hotel_room` VALUES (8, 302, 3, 388, '/profile/upload/2023/03/24/room3_20230324211940A020.jpeg', NULL, NULL, '1', 2, '', '2023-03-21 16:56:12', '', '2023-03-24 21:19:41');
INSERT INTO `hotel_room` VALUES (9, 303, 3, 388, '/profile/upload/2023/03/24/room3_20230324211959A022.jpeg', NULL, '<p>的巴士价绍</p><p><img src=\"/dev-api/profile/upload/2023/02/14/image-3_20230214195154A017.jpg\"></p>', '1', 3, '', '2023-03-21 16:56:12', '', '2023-03-24 21:20:04');
INSERT INTO `hotel_room` VALUES (10, 501, 4, 399, '/profile/upload/2023/03/24/room4_20230324212010A023.jpg', NULL, NULL, '1', 1, '', '2023-03-21 16:56:12', '', '2023-03-24 21:20:12');

-- ----------------------------
-- Table structure for hotel_room_type
-- ----------------------------
DROP TABLE IF EXISTS `hotel_room_type`;
CREATE TABLE `hotel_room_type`  (
  `room_type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '房间类型id',
  `room_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型名',
  `room_type_introduce` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型简介',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '多图',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否上架（1是 0否）',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `price` int(10) NULL DEFAULT NULL COMMENT '房间价钱',
  PRIMARY KEY (`room_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店房间类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_room_type
-- ----------------------------
INSERT INTO `hotel_room_type` VALUES (1, '商务单人大床房', '这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍', '/profile/upload/2023/03/24/room1_20230324211517A011.jpeg', '/profile/upload/2023/03/24/room1_20230324220125A001.jpeg,/profile/upload/2023/03/24/room6_20230324220128A002.jpeg', '0', 1, '', '2023-03-21 16:56:12', '', '2023-03-24 22:01:34', 2991);
INSERT INTO `hotel_room_type` VALUES (2, '商务双人标准间', '这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介', '/profile/upload/2023/03/24/room8_20230324211530A012.jpeg', '/profile/upload/2023/03/24/room8_20230324220145A003.jpeg,/profile/upload/2023/03/24/room9_20230324220147A004.jpeg', '0', 2, '', '2023-03-21 16:56:12', '', '2023-03-24 22:01:49', 199);
INSERT INTO `hotel_room_type` VALUES (3, '情侣套间', '1111111', '/profile/upload/2023/03/24/room3_20230324211537A013.jpeg', '/profile/upload/2023/03/24/room3_20230324220154A005.jpeg,/profile/upload/2023/03/24/room4_20230324220201A006.jpg', '0', 3, '', '2023-03-21 16:56:12', '', '2023-03-24 22:02:03', 388);
INSERT INTO `hotel_room_type` VALUES (4, '家庭套间', '22222222222', '/profile/upload/2023/03/24/room4_20230324211809A016.jpg', '/profile/upload/2023/03/24/room6_20230324220207A007.jpeg,/profile/upload/2023/03/24/room4_20230324220209A008.jpg', '0', 4, '', '2023-03-21 16:56:12', '', '2023-03-24 22:02:11', 399);

-- ----------------------------
-- Table structure for hotel_service
-- ----------------------------
DROP TABLE IF EXISTS `hotel_service`;
CREATE TABLE `hotel_service`  (
  `service_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '服务介绍',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_service
-- ----------------------------
INSERT INTO `hotel_service` VALUES (1, '可接受的酒店位置', '<p><span style=\"color: rgb(132, 132, 132);\">这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍 这里是该条的介绍这里是该条的介绍这</span></p>', NULL, '', '2023-03-21 16:56:12', '', NULL);
INSERT INTO `hotel_service` VALUES (2, '全年开放', '<p><span style=\"color: rgb(132, 132, 132);\">这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍 这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍 这里是该条的介绍这里是该条的介绍这里</span></p>', NULL, '', '2023-03-21 16:56:12', '', NULL);
INSERT INTO `hotel_service` VALUES (3, '可以预定', '<p><span style=\"color: rgb(132, 132, 132);\">这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍 这里是该条的介绍这里是该条的介绍这里是该条的</span></p>', NULL, '', '2023-03-21 16:56:12', '', NULL);
INSERT INTO `hotel_service` VALUES (4, '服务热心', '<p>这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里</p>', NULL, '', '2023-03-21 16:56:12', '', NULL);
INSERT INTO `hotel_service` VALUES (5, '免费wifi', '<p>这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里</p>', NULL, '', '2023-03-21 16:56:12', '', NULL);
INSERT INTO `hotel_service` VALUES (6, '免费接送', '<p>这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里是该条的介绍这里</p>', NULL, '', '2023-03-21 16:56:12', '', NULL);

-- ----------------------------
-- Table structure for hotel_special
-- ----------------------------
DROP TABLE IF EXISTS `hotel_special`;
CREATE TABLE `hotel_special`  (
  `special_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '特色id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特色名',
  `introduce` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '特色介绍',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `service_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '7：30~20：00' COMMENT '服务时间7：30~20：00',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`special_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店特色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_special
-- ----------------------------
INSERT INTO `hotel_special` VALUES (1, '餐厅', '<p>大撒和低俗啊大厦的牛撒此u暂时想不出</p><p><br></p><p><br></p><p><br></p><p>dsadghasdksandkjasn</p>', '/profile/upload/2023/03/24/food_20230324213224A029.jpeg', '7：30~20：00', '', '2023-03-21 16:56:12', '', '2023-03-24 21:32:26');
INSERT INTO `hotel_special` VALUES (2, '酒吧', '<p>表达式独霸世界的那看得开</p><p><br></p><p><br></p><p>的撒不好的话bask记得那是肯定就拿卡</p>', '/profile/upload/2023/03/24/bar_20230324213254A030.jpg', '7：30~20：00', '', '2023-03-21 16:56:12', '', '2023-03-24 21:32:56');
INSERT INTO `hotel_special` VALUES (3, '接送1', '<p>dsahudhasiud</p>', '/profile/upload/2023/03/24/car_20230324213337A031.jpeg', '7：30~20：00', '', '2023-03-21 16:56:12', '', '2023-03-24 21:33:39');
INSERT INTO `hotel_special` VALUES (4, '泳池', '<p>大撒大撒大撒大撒</p>', '/profile/upload/2023/03/24/pool_20230324213526A033.jpeg', '7：30~20：00', '', '2023-03-21 16:56:12', '', '2023-03-24 21:35:28');
INSERT INTO `hotel_special` VALUES (5, 'SPA', '<p>dsadsnahdhasiudans</p>', '/profile/upload/2023/03/24/spa_20230324213557A034.jpg', '7：30~20：00', '', '2023-03-21 16:56:12', '', '2023-03-24 21:36:00');
INSERT INTO `hotel_special` VALUES (6, '健身', '<p>但是大部分都是部分考生都能</p><p><br></p><p>的撒旦bask的</p>', '/profile/upload/2023/03/24/gym_20230324213440A032.jpeg', '7：30~20：00', '', '2023-03-21 16:56:12', '', '2023-03-24 21:34:42');

-- ----------------------------
-- Table structure for hotel_visitor
-- ----------------------------
DROP TABLE IF EXISTS `hotel_visitor`;
CREATE TABLE `hotel_visitor`  (
  `visitor_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '游客id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`visitor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游客' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-23 20:07:59', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-23 20:07:59', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-23 20:07:59', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2023-03-23 20:07:59', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-23 20:07:59', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-03-23 20:07:59', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-03-23 20:07:59', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-03-23 20:07:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-23 21:21:11');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2023-03-24 20:54:20');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2061 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-08-31 15:29:06', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2022-08-31 15:29:06', 'admin', '2022-10-18 22:51:03', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2022-08-31 15:29:06', 'admin', '2022-10-18 22:51:08', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-08-31 15:29:06', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-08-31 15:29:06', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-08-31 15:29:06', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-08-31 15:29:06', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-08-31 15:29:06', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-08-31 15:29:06', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-08-31 15:29:06', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-08-31 15:29:06', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-08-31 15:29:06', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-08-31 15:29:06', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-08-31 15:29:06', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-08-31 15:29:06', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-08-31 15:29:06', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-08-31 15:29:06', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-08-31 15:29:06', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-08-31 15:29:06', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-08-31 15:29:06', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-08-31 15:29:06', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-08-31 15:29:06', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-08-31 15:29:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '酒店官网', 0, 4, 'hotel', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'build', 'admin', '2022-08-31 15:38:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '菜单管理', 2000, 0, 'menu', 'hotel/menu/index', NULL, 1, 0, 'C', '0', '0', 'hotel:menu:list', 'cascader', 'admin', '2022-08-31 15:47:45', 'admin', '2022-09-14 19:50:45', '酒店菜单菜单');
INSERT INTO `sys_menu` VALUES (2008, '酒店菜单查询', 2007, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:menu:query', '#', 'admin', '2022-08-31 15:47:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '酒店菜单新增', 2007, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:menu:add', '#', 'admin', '2022-08-31 15:47:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '酒店菜单修改', 2007, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:menu:edit', '#', 'admin', '2022-08-31 15:47:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '酒店菜单删除', 2007, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:menu:remove', '#', 'admin', '2022-08-31 15:47:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '酒店菜单导出', 2007, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:menu:export', '#', 'admin', '2022-08-31 15:47:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '酒店预约', 2000, 1, 'book', 'hotel/book/index', NULL, 1, 0, 'C', '0', '0', 'hotel:book:list', 'row', 'admin', '2022-09-14 19:45:11', 'admin', '2022-09-14 19:53:30', '酒店预约菜单');
INSERT INTO `sys_menu` VALUES (2014, '酒店预约查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:book:query', '#', 'admin', '2022-09-14 19:45:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '酒店预约新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:book:add', '#', 'admin', '2022-09-14 19:45:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '酒店预约修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:book:edit', '#', 'admin', '2022-09-14 19:45:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '酒店预约删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:book:remove', '#', 'admin', '2022-09-14 19:45:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '酒店预约导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:book:export', '#', 'admin', '2022-09-14 19:45:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '轮播图管理', 2000, 2, 'carousel', 'hotel/carousel/index', NULL, 1, 0, 'C', '0', '0', 'hotel:carousel:list', 'clipboard', 'admin', '2022-09-14 19:45:25', 'admin', '2022-09-14 19:51:53', '轮播图菜单');
INSERT INTO `sys_menu` VALUES (2020, '轮播图查询', 2019, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:carousel:query', '#', 'admin', '2022-09-14 19:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '轮播图新增', 2019, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:carousel:add', '#', 'admin', '2022-09-14 19:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '轮播图修改', 2019, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:carousel:edit', '#', 'admin', '2022-09-14 19:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '轮播图删除', 2019, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:carousel:remove', '#', 'admin', '2022-09-14 19:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '轮播图导出', 2019, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:carousel:export', '#', 'admin', '2022-09-14 19:45:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '新闻管理', 2000, 8, 'news', 'hotel/news/index', NULL, 1, 0, 'C', '0', '0', 'hotel:news:list', 'international', 'admin', '2022-09-14 19:45:32', 'admin', '2022-09-14 19:53:01', '酒店新闻中心菜单');
INSERT INTO `sys_menu` VALUES (2026, '酒店新闻中心查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:news:query', '#', 'admin', '2022-09-14 19:45:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '酒店新闻中心新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:news:add', '#', 'admin', '2022-09-14 19:45:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '酒店新闻中心修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:news:edit', '#', 'admin', '2022-09-14 19:45:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '酒店新闻中心删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:news:remove', '#', 'admin', '2022-09-14 19:45:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '酒店新闻中心导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:news:export', '#', 'admin', '2022-09-14 19:45:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '酒店房间', 2000, 3, 'room', 'hotel/room/index', NULL, 1, 0, 'C', '0', '0', 'hotel:room:list', 'dict', 'admin', '2022-09-14 19:45:39', 'admin', '2022-09-14 19:52:04', '酒店房间菜单');
INSERT INTO `sys_menu` VALUES (2032, '酒店房间查询', 2031, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:room:query', '#', 'admin', '2022-09-14 19:45:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '酒店房间新增', 2031, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:room:add', '#', 'admin', '2022-09-14 19:45:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '酒店房间修改', 2031, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:room:edit', '#', 'admin', '2022-09-14 19:45:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '酒店房间删除', 2031, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:room:remove', '#', 'admin', '2022-09-14 19:45:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '酒店房间导出', 2031, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:room:export', '#', 'admin', '2022-09-14 19:45:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '酒店服务', 2000, 6, 'service', 'hotel/service/index', NULL, 1, 0, 'C', '0', '0', 'hotel:service:list', 'exit-fullscreen', 'admin', '2022-09-14 19:45:45', 'admin', '2022-09-14 19:52:41', '酒店服务菜单');
INSERT INTO `sys_menu` VALUES (2038, '酒店服务查询', 2037, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:service:query', '#', 'admin', '2022-09-14 19:45:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '酒店服务新增', 2037, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:service:add', '#', 'admin', '2022-09-14 19:45:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '酒店服务修改', 2037, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:service:edit', '#', 'admin', '2022-09-14 19:45:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '酒店服务删除', 2037, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:service:remove', '#', 'admin', '2022-09-14 19:45:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '酒店服务导出', 2037, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:service:export', '#', 'admin', '2022-09-14 19:45:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '房间类型管理', 2000, 3, 'type', 'hotel/type/index', NULL, 1, 0, 'C', '0', '0', 'hotel:type:list', 'build', 'admin', '2022-09-14 19:46:01', 'admin', '2022-09-14 19:52:31', '酒店房间类型菜单');
INSERT INTO `sys_menu` VALUES (2044, '酒店房间类型查询', 2043, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:type:query', '#', 'admin', '2022-09-14 19:46:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '酒店房间类型新增', 2043, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:type:add', '#', 'admin', '2022-09-14 19:46:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '酒店房间类型修改', 2043, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:type:edit', '#', 'admin', '2022-09-14 19:46:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '酒店房间类型删除', 2043, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:type:remove', '#', 'admin', '2022-09-14 19:46:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '酒店房间类型导出', 2043, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:type:export', '#', 'admin', '2022-09-14 19:46:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '游客管理', 2000, 9, 'visitor', 'hotel/visitor/index', NULL, 1, 0, 'C', '0', '0', 'hotel:visitor:list', 'peoples', 'admin', '2022-09-14 19:46:08', 'admin', '2022-09-14 19:51:35', '游客菜单');
INSERT INTO `sys_menu` VALUES (2050, '游客查询', 2049, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:visitor:query', '#', 'admin', '2022-09-14 19:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '游客新增', 2049, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:visitor:add', '#', 'admin', '2022-09-14 19:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '游客修改', 2049, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:visitor:edit', '#', 'admin', '2022-09-14 19:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '游客删除', 2049, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:visitor:remove', '#', 'admin', '2022-09-14 19:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '游客导出', 2049, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:visitor:export', '#', 'admin', '2022-09-14 19:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '酒店特色', 2000, 7, 'special', 'hotel/special/index', NULL, 1, 0, 'C', '0', '0', 'hotel:special:list', 'language', 'admin', '2022-09-14 19:46:35', 'admin', '2022-09-14 19:52:48', '酒店特色菜单');
INSERT INTO `sys_menu` VALUES (2056, '酒店特色查询', 2055, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:special:query', '#', 'admin', '2022-09-14 19:46:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '酒店特色新增', 2055, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:special:add', '#', 'admin', '2022-09-14 19:46:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '酒店特色修改', 2055, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:special:edit', '#', 'admin', '2022-09-14 19:46:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '酒店特色删除', 2055, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:special:remove', '#', 'admin', '2022-09-14 19:46:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '酒店特色导出', 2055, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'hotel:special:export', '#', 'admin', '2022-09-14 19:46:35', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-03-23 20:07:59', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-03-23 20:07:59', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '轮播图', 2, 'com.hotel.hotel.controller.HotelCarouselController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":1,\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"imagePath\":\"/profile/upload/2023/03/24/6f74fd20222402ec249c60fd8cec6e52_20230324210321A001.jpeg\",\"introduce\":\"享受家人美好时光\",\"name\":\"家庭套餐\",\"orderNum\":1,\"updateTime\":1679663003027,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:03:23');
INSERT INTO `sys_oper_log` VALUES (101, '轮播图', 2, 'com.hotel.hotel.controller.HotelCarouselController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":2,\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"imagePath\":\"/profile/upload/2023/03/24/7b52cf49e8abc8fff7be979af5268cc3_20230324210328A002.jpeg\",\"introduce\":\"让你的旅途更舒适\",\"name\":\"精品单间\",\"orderNum\":2,\"updateTime\":1679663009392,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:03:29');
INSERT INTO `sys_oper_log` VALUES (102, '轮播图', 2, 'com.hotel.hotel.controller.HotelCarouselController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/carousel', '127.0.0.1', '内网IP', '{\"carouselId\":3,\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"imagePath\":\"/profile/upload/2023/03/24/89469b61a01669c282417d200148e051_20230324210412A003.jpg\",\"introduce\":\"享受美好双人世界\",\"name\":\"情侣套房\",\"orderNum\":3,\"updateTime\":1679663054057,\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:04:14');
INSERT INTO `sys_oper_log` VALUES (103, '酒店菜单', 2, 'com.hotel.hotel.controller.HotelMenuController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/menu', '127.0.0.1', '内网IP', '{\"image\":\"/profile/upload/2023/03/24/menu1_20230324211016A004.jpeg\",\"introduce\":\"选择我们的酒店\",\"orderNum\":2,\"updateTime\":1679663417916,\"params\":{},\"parentId\":0,\"url\":\"hotel.html\",\"createBy\":\"\",\"children\":[],\"createTime\":1679388972000,\"updateBy\":\"\",\"name\":\"房间介绍\",\"menuId\":2,\"detail\":\"最便利的活动送给你们，最艰难的工作留给我们\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:10:17');
INSERT INTO `sys_oper_log` VALUES (104, '酒店菜单', 2, 'com.hotel.hotel.controller.HotelMenuController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/menu', '127.0.0.1', '内网IP', '{\"image\":\"/profile/upload/2023/03/24/menu2_20230324211024A005.jpeg\",\"introduce\":\"我们的服务\",\"orderNum\":3,\"updateTime\":1679663425519,\"params\":{},\"parentId\":0,\"url\":\"services.html\",\"createBy\":\"\",\"children\":[],\"createTime\":1679388972000,\"updateBy\":\"\",\"name\":\"服务介绍\",\"menuId\":3,\"detail\":\"最好的服务带给最爱的你们\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:10:25');
INSERT INTO `sys_oper_log` VALUES (105, '酒店菜单', 2, 'com.hotel.hotel.controller.HotelMenuController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/menu', '127.0.0.1', '内网IP', '{\"image\":\"/profile/upload/2023/03/24/menu3_20230324211030A006.jpg\",\"introduce\":\"关注我们的新闻，了解最新活动和优惠\",\"orderNum\":4,\"updateTime\":1679663431539,\"params\":{},\"parentId\":0,\"url\":\"blog.html\",\"createBy\":\"\",\"children\":[],\"createTime\":1679388972000,\"updateBy\":\"\",\"name\":\"新闻中心\",\"menuId\":4,\"detail\":\"关注我们的新闻，了解最新活动和优惠\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:10:31');
INSERT INTO `sys_oper_log` VALUES (106, '酒店菜单', 2, 'com.hotel.hotel.controller.HotelMenuController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/menu', '127.0.0.1', '内网IP', '{\"image\":\"/profile/upload/2023/03/24/menu4_20230324211036A007.jpg\",\"introduce\":\"联系我们\",\"orderNum\":5,\"updateTime\":1679663438063,\"params\":{},\"parentId\":0,\"url\":\"contact.html\",\"createBy\":\"\",\"children\":[],\"createTime\":1679388972000,\"updateBy\":\"\",\"name\":\"联系我们\",\"menuId\":5,\"detail\":\"联系我们获取服务\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:10:38');
INSERT INTO `sys_oper_log` VALUES (107, '酒店菜单', 2, 'com.hotel.hotel.controller.HotelMenuController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/menu', '127.0.0.1', '内网IP', '{\"orderNum\":1,\"updateTime\":1679663513127,\"params\":{},\"parentId\":0,\"url\":\"index.html\",\"createBy\":\"\",\"children\":[],\"createTime\":1679388972000,\"updateBy\":\"\",\"name\":\"网站首页\",\"menuId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:11:53');
INSERT INTO `sys_oper_log` VALUES (108, '酒店预约', 3, 'com.hotel.hotel.controller.HotelBookController.remove()', 'DELETE', 1, 'admin', NULL, '/hotel/book/15,16', '127.0.0.1', '内网IP', '{bookIds=15,16}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:12:36');
INSERT INTO `sys_oper_log` VALUES (109, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":299,\"roomCover\":\"/profile/upload/2023/03/24/room1_20230324211338A008.jpeg\",\"orderNum\":1,\"updateTime\":1679663620624,\"params\":{},\"roomId\":1,\"roomTypeId\":1,\"createBy\":\"\",\"roomNum\":101,\"createTime\":1679388972000,\"updateBy\":\"\",\"roomIntroduce\":\"很舒服的房间\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:13:40');
INSERT INTO `sys_oper_log` VALUES (110, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":299,\"roomCover\":\"/profile/upload/2023/03/24/room2_20230324211346A009.jpeg\",\"orderNum\":2,\"updateTime\":1679663627609,\"params\":{},\"roomId\":2,\"roomTypeId\":1,\"createBy\":\"\",\"roomNum\":102,\"createTime\":1679388972000,\"roomDetail\":\"<p>11</p>\",\"updateBy\":\"\",\"roomIntroduce\":\"11\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:13:47');
INSERT INTO `sys_oper_log` VALUES (111, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":299,\"roomCover\":\"/profile/upload/2023/03/24/room3_20230324211401A010.jpeg\",\"orderNum\":3,\"updateTime\":1679663643102,\"params\":{},\"roomId\":3,\"roomTypeId\":1,\"createBy\":\"\",\"roomNum\":103,\"createTime\":1679388972000,\"roomDetail\":\"<p><br></p>\",\"updateBy\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:14:03');
INSERT INTO `sys_oper_log` VALUES (112, '酒店房间类型', 2, 'com.hotel.hotel.controller.HotelRoomTypeController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/type', '127.0.0.1', '内网IP', '{\"roomTypeName\":\"商务单人大床房\",\"orderNum\":1,\"updateTime\":1679663720309,\"params\":{},\"roomTypeId\":1,\"cover\":\"/profile/upload/2023/03/24/room1_20230324211517A011.jpeg\",\"createBy\":\"\",\"roomTypeIntroduce\":\"这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍\",\"createTime\":1679388972000,\"updateBy\":\"\",\"price\":2991,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:15:20');
INSERT INTO `sys_oper_log` VALUES (113, '酒店房间类型', 2, 'com.hotel.hotel.controller.HotelRoomTypeController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/type', '127.0.0.1', '内网IP', '{\"roomTypeName\":\"商务双人标准间\",\"orderNum\":2,\"updateTime\":1679663732518,\"params\":{},\"roomTypeId\":2,\"cover\":\"/profile/upload/2023/03/24/room8_20230324211530A012.jpeg\",\"createBy\":\"\",\"roomTypeIntroduce\":\"这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介\",\"createTime\":1679388972000,\"updateBy\":\"\",\"price\":199,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:15:32');
INSERT INTO `sys_oper_log` VALUES (114, '酒店房间类型', 2, 'com.hotel.hotel.controller.HotelRoomTypeController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/type', '127.0.0.1', '内网IP', '{\"roomTypeName\":\"情侣套间\",\"orderNum\":3,\"updateTime\":1679663738601,\"params\":{},\"roomTypeId\":3,\"cover\":\"/profile/upload/2023/03/24/room3_20230324211537A013.jpeg\",\"createBy\":\"\",\"roomTypeIntroduce\":\"1111111\",\"createTime\":1679388972000,\"updateBy\":\"\",\"price\":388,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:15:38');
INSERT INTO `sys_oper_log` VALUES (115, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":299,\"roomCover\":\"/profile/upload/2023/03/24/room1_20230324211749A014.jpeg\",\"orderNum\":2,\"updateTime\":1679663871606,\"params\":{},\"roomId\":2,\"roomTypeId\":1,\"createBy\":\"\",\"roomNum\":102,\"createTime\":1679388972000,\"roomDetail\":\"<p>11</p>\",\"updateBy\":\"\",\"roomIntroduce\":\"11\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:17:51');
INSERT INTO `sys_oper_log` VALUES (116, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":299,\"roomCover\":\"/profile/upload/2023/03/24/room1_20230324211758A015.jpeg\",\"orderNum\":3,\"updateTime\":1679663879527,\"params\":{},\"roomId\":3,\"roomTypeId\":1,\"createBy\":\"\",\"roomNum\":103,\"createTime\":1679388972000,\"roomDetail\":\"<p><br></p>\",\"updateBy\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:17:59');
INSERT INTO `sys_oper_log` VALUES (117, '酒店房间类型', 2, 'com.hotel.hotel.controller.HotelRoomTypeController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/type', '127.0.0.1', '内网IP', '{\"roomTypeName\":\"家庭套间\",\"orderNum\":4,\"updateTime\":1679663890290,\"params\":{},\"roomTypeId\":4,\"cover\":\"/profile/upload/2023/03/24/room4_20230324211809A016.jpg\",\"createBy\":\"\",\"roomTypeIntroduce\":\"22222222222\",\"createTime\":1679388972000,\"updateBy\":\"\",\"price\":399,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:18:10');
INSERT INTO `sys_oper_log` VALUES (118, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":199,\"roomCover\":\"/profile/upload/2023/03/24/room2_20230324211829A017.jpeg\",\"orderNum\":1,\"updateTime\":1679663911545,\"params\":{},\"roomId\":4,\"roomTypeId\":2,\"createBy\":\"\",\"roomNum\":201,\"createTime\":1679388972000,\"updateBy\":\"\",\"roomIntroduce\":\"1\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:18:31');
INSERT INTO `sys_oper_log` VALUES (119, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":199,\"roomCover\":\"/profile/upload/2023/03/24/room2_20230324211842A018.jpeg\",\"orderNum\":2,\"updateTime\":1679663923935,\"params\":{},\"roomId\":5,\"roomTypeId\":2,\"createBy\":\"\",\"roomNum\":202,\"createTime\":1679388972000,\"updateBy\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:18:43');
INSERT INTO `sys_oper_log` VALUES (120, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":199,\"roomCover\":\"/profile/upload/2023/03/24/room2_20230324211850A019.jpeg\",\"orderNum\":3,\"updateTime\":1679663931772,\"params\":{},\"roomId\":6,\"roomTypeId\":2,\"createBy\":\"\",\"roomNum\":203,\"createTime\":1679388972000,\"updateBy\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:18:51');
INSERT INTO `sys_oper_log` VALUES (121, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":388,\"roomCover\":\"/profile/upload/2023/03/24/room3_20230324211940A020.jpeg\",\"orderNum\":2,\"updateTime\":1679663981379,\"params\":{},\"roomId\":8,\"roomTypeId\":3,\"createBy\":\"\",\"roomNum\":302,\"createTime\":1679388972000,\"updateBy\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:19:41');
INSERT INTO `sys_oper_log` VALUES (122, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":388,\"roomCover\":\"/profile/upload/2023/03/24/room3_20230324211952A021.jpeg\",\"orderNum\":1,\"updateTime\":1679663993994,\"params\":{},\"roomId\":7,\"roomTypeId\":3,\"createBy\":\"\",\"roomNum\":301,\"createTime\":1679388972000,\"updateBy\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:19:54');
INSERT INTO `sys_oper_log` VALUES (123, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":388,\"roomCover\":\"/profile/upload/2023/03/24/room3_20230324211959A022.jpeg\",\"orderNum\":3,\"updateTime\":1679664004312,\"params\":{},\"roomId\":9,\"roomTypeId\":3,\"createBy\":\"\",\"roomNum\":303,\"createTime\":1679388972000,\"roomDetail\":\"<p>的巴士价绍</p><p><img src=\\\"/dev-api/profile/upload/2023/02/14/image-3_20230214195154A017.jpg\\\"></p>\",\"updateBy\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:20:04');
INSERT INTO `sys_oper_log` VALUES (124, '酒店房间', 2, 'com.hotel.hotel.controller.HotelRoomController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/room', '127.0.0.1', '内网IP', '{\"roomPrice\":399,\"roomCover\":\"/profile/upload/2023/03/24/room4_20230324212010A023.jpg\",\"orderNum\":1,\"updateTime\":1679664011671,\"params\":{},\"roomId\":10,\"roomTypeId\":4,\"createBy\":\"\",\"roomNum\":501,\"createTime\":1679388972000,\"updateBy\":\"\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:20:11');
INSERT INTO `sys_oper_log` VALUES (125, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/food_20230324212603A024.jpeg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>大撒和低俗啊大厦的牛撒此u暂时想不出</p><p><br></p><p><br></p><p><br></p><p>dsadghasdksandkjasn</p><p><br></p>\",\"name\":\"餐厅\",\"updateTime\":1679664365518,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:26:05');
INSERT INTO `sys_oper_log` VALUES (126, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/food_20230324213055A025.jpeg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>大撒和低俗啊大厦的牛撒此u暂时想不出</p><p><br></p><p><br></p><p><br></p><p>dsadghasdksandkjasn</p>\",\"name\":\"餐厅\",\"updateTime\":1679664657153,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:30:57');
INSERT INTO `sys_oper_log` VALUES (127, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/bar_20230324213102A026.jpeg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>表达式独霸世界的那看得开</p><p><br></p><p><br></p><p>的撒不好的话bask记得那是肯定就拿卡</p>\",\"name\":\"酒吧\",\"updateTime\":1679664663863,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:31:03');
INSERT INTO `sys_oper_log` VALUES (128, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/jam_20230324213131A028.jpg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>但是大部分都是部分考生都能</p><p><br></p><p>的撒旦bask的</p>\",\"name\":\"健身\",\"updateTime\":1679664692970,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:31:33');
INSERT INTO `sys_oper_log` VALUES (129, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/food_20230324213224A029.jpeg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>大撒和低俗啊大厦的牛撒此u暂时想不出</p><p><br></p><p><br></p><p><br></p><p>dsadghasdksandkjasn</p>\",\"name\":\"餐厅\",\"updateTime\":1679664745711,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:32:25');
INSERT INTO `sys_oper_log` VALUES (130, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/bar_20230324213254A030.jpg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>表达式独霸世界的那看得开</p><p><br></p><p><br></p><p>的撒不好的话bask记得那是肯定就拿卡</p>\",\"name\":\"酒吧\",\"updateTime\":1679664775982,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:32:56');
INSERT INTO `sys_oper_log` VALUES (131, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/car_20230324213337A031.jpeg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>dsahudhasiud</p>\",\"name\":\"接送1\",\"updateTime\":1679664819205,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:33:39');
INSERT INTO `sys_oper_log` VALUES (132, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/gym_20230324213440A032.jpeg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>但是大部分都是部分考生都能</p><p><br></p><p>的撒旦bask的</p>\",\"name\":\"健身\",\"updateTime\":1679664881659,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:34:41');
INSERT INTO `sys_oper_log` VALUES (133, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/pool_20230324213526A033.jpeg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>大撒大撒大撒大撒</p>\",\"name\":\"泳池\",\"updateTime\":1679664928437,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:35:28');
INSERT INTO `sys_oper_log` VALUES (134, '酒店特色', 2, 'com.hotel.hotel.controller.HotelSpecialController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/special', '127.0.0.1', '内网IP', '{\"cover\":\"/profile/upload/2023/03/24/spa_20230324213557A034.jpg\",\"createBy\":\"\",\"createTime\":1679388972000,\"updateBy\":\"\",\"introduce\":\"<p>dsadsnahdhasiudans</p>\",\"name\":\"SPA\",\"updateTime\":1679664959891,\"params\":{},\"serviceTime\":\"7：30~20：00\",\"specialId\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:35:59');
INSERT INTO `sys_oper_log` VALUES (135, '酒店新闻中心', 2, 'com.hotel.hotel.controller.HotelNewsController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/news', '127.0.0.1', '内网IP', '{\"orderNum\":1,\"updateTime\":1679665089780,\"params\":{},\"title\":\"听说一种深海珍宝游到了彩蝶谷\",\"isShow\":\"1\",\"cover\":\"/profile/upload/2023/03/24/room5_20230324213808A035.jpeg\",\"createBy\":\"\",\"newsId\":1,\"createTime\":1679388972000,\"updateBy\":\"\",\"detail\":\"<p>都说龙趸全身是宝，不同部位适合烹制不同菜式，彩蝶谷美食廊素来以出品风味混搭、菜式做法多样而闻名，这次的龙趸系列当然也不会让老饕们失望，大厨以“焖炖焗蒸”等多种烹饪方式，为您带来十多款龙趸菜式，深海珍宝好多美味？小编近水楼台先尝味，您就暂时要“望梅止渴”，看着小编上图啦！</p><p>粤语常说“饮头啖汤”，注重食补健康的岭南人，尤其重视正式上菜前的暖场汤水，这道“天麻炖龙趸头”，用的是最为营养滋补的龙趸头，斩件加上天麻和其它配料入瓮慢火炖煮，将鱼头丰富的胶原和鲜味释放，加上淡淡的药材汤料的清香，味道清甜不油腻，最适合这种炎热的天气。</p><p>对美味的追求不只是大人的权利，这道“芙蓉蛋白蒸龙趸肉”特别适合小孩子，师傅以精湛刀法加工龙趸鱼，片片均匀，没有一丝骨头；蛋白加入龙趸骨熬制的鱼汤打匀，放入鱼片同蒸。火候控制要恰到好处，鱼片刚熟，芙蓉蛋白嫩滑，每一口都是鲜美鱼肉和蛋白，绝对是小孩子下饭的好选择。</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:38:09');
INSERT INTO `sys_oper_log` VALUES (136, '酒店新闻中心', 2, 'com.hotel.hotel.controller.HotelNewsController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/news', '127.0.0.1', '内网IP', '{\"orderNum\":2,\"updateTime\":1679665099130,\"params\":{},\"title\":\"婚宴——定格幸福瞬间\",\"isShow\":\"1\",\"cover\":\"/profile/upload/2023/03/24/room2_20230324213817A036.jpeg\",\"createBy\":\"\",\"newsId\":2,\"createTime\":1679388972000,\"updateBy\":\"\",\"detail\":\"<p>dsafdsfds都说龙趸全身是宝，不同部位适合烹制不同菜式，彩蝶谷美食廊素来以出品风味混搭、菜式做法多样而闻名，这次的龙趸系列当然也不会让老饕们失望，大厨以“焖炖焗蒸”等多种烹饪方式，为您带来十多款龙趸菜式，深海珍宝好多美味？小编近水楼台先尝味，您就暂时要“望梅止渴”，看着小编上图啦！</p><p>粤语常说“饮头啖汤”，注重食补健康的岭南人，尤其重视正式上菜前的暖场汤水，这道“天麻炖龙趸头”，用的是最为营养滋补的龙趸头，斩件加上天麻和其它配料入瓮慢火炖煮，将鱼头丰富的胶原和鲜味释放，加上淡淡的药材汤料的清香，味道清甜不油腻，最适合这种炎热的天气。</p><p>对美味的追求不只是大人的权利，这道“芙蓉蛋白蒸龙趸肉”特别适合小孩子，师傅以精湛刀法加工龙趸鱼，片片均匀，没有一丝骨头；蛋白加入龙趸骨熬制的鱼汤打匀，放入鱼片同蒸。火候控制要恰到好处，鱼片刚熟，芙蓉蛋白嫩滑，每一口都是鲜美鱼肉和蛋白，绝对是小孩子下饭的好选择。</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:38:19');
INSERT INTO `sys_oper_log` VALUES (137, '酒店新闻中心', 2, 'com.hotel.hotel.controller.HotelNewsController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/news', '127.0.0.1', '内网IP', '{\"orderNum\":3,\"updateTime\":1679665116980,\"params\":{},\"title\":\"任凭刮风下雨，也不能阻碍我的热情\",\"isShow\":\"1\",\"cover\":\"/profile/upload/2023/03/24/room8_20230324213835A037.jpeg\",\"createBy\":\"\",\"newsId\":3,\"createTime\":1679388972000,\"updateBy\":\"\",\"detail\":\"<p>说龙趸全身是宝，不同部位适合烹制不同菜式，彩蝶谷美食廊素来以出品风味混搭、菜式做法多样而闻名，这次的龙趸系列当然也不会让老饕们失望，大厨以“焖炖焗蒸”等多种烹饪方式，为您带来十多款龙趸菜式，深海珍宝好多美味？小编近水楼台先尝味，您就暂时要“望梅止渴”，看着小编上图啦！</p><p>粤语常说“饮头啖汤”，注重食补健康的岭南人，尤其重视正式上菜前的暖场汤水，这道“天麻炖龙趸头”，用的是最为营养滋补的龙趸头，斩件加上天麻和其它配料入瓮慢火炖煮，将鱼头丰富的胶原和鲜味释放，加上淡淡的药材汤料的清香，味道清甜不油腻，最适合这种炎热的天气。</p><p>对美味的追求不只是大人的权利，这道“芙蓉蛋白蒸龙趸肉”特别适合小孩子，师傅以精湛刀法加工龙趸鱼，片片均匀，没有一丝骨头；蛋白加入龙趸骨熬制的鱼汤打匀，放入鱼片同蒸。火候控制要恰到好处，鱼片刚熟，芙蓉蛋白嫩滑，每一口都是鲜美鱼肉和蛋白，绝对是小孩子下饭的好选择。</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:38:37');
INSERT INTO `sys_oper_log` VALUES (138, '酒店新闻中心', 2, 'com.hotel.hotel.controller.HotelNewsController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/news', '127.0.0.1', '内网IP', '{\"orderNum\":4,\"updateTime\":1679665132146,\"params\":{},\"title\":\"七夕蟹逅，浓情蜜意\",\"isShow\":\"1\",\"cover\":\"/profile/upload/2023/03/24/487addff2a16447c02c8a8261c1e822f_20230324213850A038.jpeg\",\"createBy\":\"\",\"newsId\":4,\"createTime\":1679388972000,\"updateBy\":\"\",\"detail\":\"<p>的撒大巴萨的巴萨计划</p><p>女粉丝打击开发商的开发你</p><p><br></p><p><br></p><p>负担翻山蹈海福克纳</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:38:52');
INSERT INTO `sys_oper_log` VALUES (139, '酒店新闻中心', 2, 'com.hotel.hotel.controller.HotelNewsController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/news', '127.0.0.1', '内网IP', '{\"orderNum\":5,\"updateTime\":1679665166562,\"params\":{},\"title\":\"婚宴——定格幸福瞬间\",\"isShow\":\"1\",\"cover\":\"/profile/upload/2023/03/24/c0e26df1e3d5839bb79388fbdb5e2406_20230324213924A039.jpg\",\"createBy\":\"\",\"newsId\":5,\"createTime\":1679388972000,\"updateBy\":\"\",\"detail\":\"<p>的活塞i的哈商大那是的那艘的就是大幅低开的士大夫十分你的伤口</p><p><br></p><p><br></p><p>负担翻山蹈海弄</p>\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:39:26');
INSERT INTO `sys_oper_log` VALUES (140, '酒店菜单', 2, 'com.hotel.hotel.controller.HotelMenuController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/menu', '127.0.0.1', '内网IP', '{\"image\":\"/profile/upload/2023/03/24/menu2_20230324214036A040.jpeg\",\"introduce\":\"我们的服务\",\"orderNum\":3,\"updateTime\":1679665237304,\"params\":{},\"parentId\":0,\"url\":\"services.html\",\"createBy\":\"\",\"children\":[],\"createTime\":1679388972000,\"updateBy\":\"\",\"name\":\"服务介绍\",\"menuId\":3,\"detail\":\"最好的服务带给最爱的你们\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 21:40:37');
INSERT INTO `sys_oper_log` VALUES (141, '酒店房间类型', 2, 'com.hotel.hotel.controller.HotelRoomTypeController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/type', '127.0.0.1', '内网IP', '{\"images\":\"/profile/upload/2023/03/24/room1_20230324220125A001.jpeg,/profile/upload/2023/03/24/room6_20230324220128A002.jpeg\",\"roomTypeName\":\"商务单人大床房\",\"orderNum\":1,\"updateTime\":1679666494196,\"params\":{},\"roomTypeId\":1,\"cover\":\"/profile/upload/2023/03/24/room1_20230324211517A011.jpeg\",\"createBy\":\"\",\"roomTypeIntroduce\":\"这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介绍\",\"createTime\":1679388972000,\"updateBy\":\"\",\"price\":2991,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 22:01:34');
INSERT INTO `sys_oper_log` VALUES (142, '酒店房间类型', 2, 'com.hotel.hotel.controller.HotelRoomTypeController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/type', '127.0.0.1', '内网IP', '{\"images\":\"/profile/upload/2023/03/24/room8_20230324220145A003.jpeg,/profile/upload/2023/03/24/room9_20230324220147A004.jpeg\",\"roomTypeName\":\"商务双人标准间\",\"orderNum\":2,\"updateTime\":1679666509393,\"params\":{},\"roomTypeId\":2,\"cover\":\"/profile/upload/2023/03/24/room8_20230324211530A012.jpeg\",\"createBy\":\"\",\"roomTypeIntroduce\":\"这里是关于房间的简单介绍这里是关于房间的简单介绍这里是关于房间的简单介\",\"createTime\":1679388972000,\"updateBy\":\"\",\"price\":199,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 22:01:49');
INSERT INTO `sys_oper_log` VALUES (143, '酒店房间类型', 2, 'com.hotel.hotel.controller.HotelRoomTypeController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/type', '127.0.0.1', '内网IP', '{\"images\":\"/profile/upload/2023/03/24/room3_20230324220154A005.jpeg,/profile/upload/2023/03/24/room4_20230324220201A006.jpg\",\"roomTypeName\":\"情侣套间\",\"orderNum\":3,\"updateTime\":1679666522938,\"params\":{},\"roomTypeId\":3,\"cover\":\"/profile/upload/2023/03/24/room3_20230324211537A013.jpeg\",\"createBy\":\"\",\"roomTypeIntroduce\":\"1111111\",\"createTime\":1679388972000,\"updateBy\":\"\",\"price\":388,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 22:02:02');
INSERT INTO `sys_oper_log` VALUES (144, '酒店房间类型', 2, 'com.hotel.hotel.controller.HotelRoomTypeController.edit()', 'PUT', 1, 'admin', NULL, '/hotel/type', '127.0.0.1', '内网IP', '{\"images\":\"/profile/upload/2023/03/24/room6_20230324220207A007.jpeg,/profile/upload/2023/03/24/room4_20230324220209A008.jpg\",\"roomTypeName\":\"家庭套间\",\"orderNum\":4,\"updateTime\":1679666531451,\"params\":{},\"roomTypeId\":4,\"cover\":\"/profile/upload/2023/03/24/room4_20230324211809A016.jpg\",\"createBy\":\"\",\"roomTypeIntroduce\":\"22222222222\",\"createTime\":1679388972000,\"updateBy\":\"\",\"price\":399,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 22:02:11');
INSERT INTO `sys_oper_log` VALUES (145, '酒店预约', 3, 'com.hotel.hotel.controller.HotelBookController.remove()', 'DELETE', 1, 'admin', NULL, '/hotel/book/17', '127.0.0.1', '内网IP', '{bookIds=17}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-24 22:23:03');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-03-23 20:07:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-03-23 20:07:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-03-23 20:07:59', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-03-23 20:07:59', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-23 20:07:59', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

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
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-24 20:54:21', 'admin', '2023-03-23 20:07:59', '', '2023-03-24 20:54:20', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-23 20:07:59', 'admin', '2023-03-23 20:07:59', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
