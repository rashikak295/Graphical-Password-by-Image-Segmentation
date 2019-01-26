/*
MySQL Data Transfer
Source Host: localhost
Source Database: gpsi
Target Host: localhost
Target Database: gpsi
Date: 3/15/2017 6:59:03 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sal` float(20,0) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for emp_copy
-- ----------------------------
DROP TABLE IF EXISTS `emp_copy`;
CREATE TABLE `emp_copy` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sal` float(20,0) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for file_data
-- ----------------------------
DROP TABLE IF EXISTS `file_data`;
CREATE TABLE `file_data` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hod_registration
-- ----------------------------
DROP TABLE IF EXISTS `hod_registration`;
CREATE TABLE `hod_registration` (
  `hod_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `researchInterest` varchar(255) DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  `shuffle_image` varchar(255) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`hod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hod_requested_files
-- ----------------------------
DROP TABLE IF EXISTS `hod_requested_files`;
CREATE TABLE `hod_requested_files` (
  `h_req_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `requester_id` bigint(20) DEFAULT NULL,
  `upload_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `hod_username` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`h_req_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hod_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `hod_upload_file`;
CREATE TABLE `hod_upload_file` (
  `h_upload_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hod_id` bigint(20) DEFAULT NULL,
  `upload_file` varchar(255) DEFAULT NULL,
  `upload_file_path` varchar(255) DEFAULT NULL,
  `hod_username` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`h_upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for image_login_temp_hod_password
-- ----------------------------
DROP TABLE IF EXISTS `image_login_temp_hod_password`;
CREATE TABLE `image_login_temp_hod_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) DEFAULT '0',
  `image` text,
  `index_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for image_login_temp_student_password
-- ----------------------------
DROP TABLE IF EXISTS `image_login_temp_student_password`;
CREATE TABLE `image_login_temp_student_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) DEFAULT '0',
  `image` text,
  `index_id` bigint(20) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for image_login_temp_teacher_password
-- ----------------------------
DROP TABLE IF EXISTS `image_login_temp_teacher_password`;
CREATE TABLE `image_login_temp_teacher_password` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) DEFAULT '0',
  `image` varchar(255) DEFAULT NULL,
  `index_id` bigint(20) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for image_password_hod_registration_index
-- ----------------------------
DROP TABLE IF EXISTS `image_password_hod_registration_index`;
CREATE TABLE `image_password_hod_registration_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) DEFAULT NULL,
  `image` text,
  `index_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for image_password_registration
-- ----------------------------
DROP TABLE IF EXISTS `image_password_registration`;
CREATE TABLE `image_password_registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `salary` float(20,0) DEFAULT '0',
  `image` text,
  `address` text,
  `usertype` varchar(255) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for image_password_student_registration_index
-- ----------------------------
DROP TABLE IF EXISTS `image_password_student_registration_index`;
CREATE TABLE `image_password_student_registration_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) DEFAULT '0',
  `image` text,
  `index_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for image_password_teacher_registration_index
-- ----------------------------
DROP TABLE IF EXISTS `image_password_teacher_registration_index`;
CREATE TABLE `image_password_teacher_registration_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) DEFAULT '0',
  `image` text,
  `index_id` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student_registration
-- ----------------------------
DROP TABLE IF EXISTS `student_registration`;
CREATE TABLE `student_registration` (
  `student_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `rollNo` bigint(20) DEFAULT NULL,
  `semesterWise` varchar(255) DEFAULT NULL,
  `yearOfJoining` varchar(255) DEFAULT NULL,
  `yearOfCompletion` varchar(255) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  `shuffle_image` varchar(255) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student_requested_files
-- ----------------------------
DROP TABLE IF EXISTS `student_requested_files`;
CREATE TABLE `student_requested_files` (
  `s_req_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `requester_id` bigint(20) DEFAULT NULL,
  `upload_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `student_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s_req_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for student_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `student_upload_file`;
CREATE TABLE `student_upload_file` (
  `upload_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` bigint(20) DEFAULT NULL,
  `upload_file` varchar(255) DEFAULT NULL,
  `upload_file_path` varchar(255) DEFAULT NULL,
  `student_username` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for teacher_registration
-- ----------------------------
DROP TABLE IF EXISTS `teacher_registration`;
CREATE TABLE `teacher_registration` (
  `teacher_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phoneNo` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `emailId` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  `shuffle_image` varchar(255) DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for teacher_requested_files
-- ----------------------------
DROP TABLE IF EXISTS `teacher_requested_files`;
CREATE TABLE `teacher_requested_files` (
  `t_req_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `requester_id` bigint(20) DEFAULT NULL,
  `upload_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `teacher_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_req_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for teacher_upload_file
-- ----------------------------
DROP TABLE IF EXISTS `teacher_upload_file`;
CREATE TABLE `teacher_upload_file` (
  `t_upload_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) DEFAULT NULL,
  `upload_file` varchar(255) DEFAULT NULL,
  `upload_file_path` varchar(255) DEFAULT NULL,
  `teacher_username` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for upload_public_data
-- ----------------------------
DROP TABLE IF EXISTS `upload_public_data`;
CREATE TABLE `upload_public_data` (
  `public_data_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `view_user_type` varchar(255) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `upload_file` varchar(255) DEFAULT NULL,
  `semesterWise` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `uploaded_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`public_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `emp` VALUES ('1', 'sameer', '500000');
INSERT INTO `emp` VALUES ('2', 'Ramesh', '454545');
INSERT INTO `emp` VALUES ('3', 'Seema', '6768688');
INSERT INTO `emp_copy` VALUES ('1', 'sameer', '500000');
INSERT INTO `emp_copy` VALUES ('2', 'Ramesh', '454545');
INSERT INTO `emp_copy` VALUES ('3', 'Seema', '6768688');
INSERT INTO `file_data` VALUES ('1', 'photo\\other_happy.jpg');
INSERT INTO `file_data` VALUES ('2', 'photo\\abstract7.jpg');
INSERT INTO `file_data` VALUES ('3', 'photo\\food_dishes.jpg');
INSERT INTO `hod_registration` VALUES ('1', 'Chaitanya', 'thane', '3492817012', 'mba', 'no', 'chaitu@gmail.com', 'COMPS', '1', '1', 'yes', '1488694352820_nature5.jpg');
INSERT INTO `hod_registration` VALUES ('2', 'Sujith', 'ghg', '6777777777', 'bbbb', 'hh', 'sujith@yahoo.com', 'IT', '2', '2', 'yes', '1488698197454_animal.jpg');
INSERT INTO `hod_requested_files` VALUES ('1', '2', '1', 'nature.jpg', '1', 'Approve', 'Sujith', 'IT');
INSERT INTO `hod_upload_file` VALUES ('1', '1', 'nature.jpg', 'D:\\Downloads\\nature.jpg', 'Chaitanya', 'COMPS', 'HOD');
INSERT INTO `hod_upload_file` VALUES ('2', '1', 'nature2.jpg', 'D:\\Downloads\\nature2.jpg', 'Chaitanya', 'COMPS', 'HOD');
INSERT INTO `hod_upload_file` VALUES ('3', '2', 'animal3.jpg', 'E:\\MVOCAandGPSI\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\GPSI\\animal3.jpg', 'sujith', 'IT', 'HOD');
INSERT INTO `image_login_temp_hod_password` VALUES ('1', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('2', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('3', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('4', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('5', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('6', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('7', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('8', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('9', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('10', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('11', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('12', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('13', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('14', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('15', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('16', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('17', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('18', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('19', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('20', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('21', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('22', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('23', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('24', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('25', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('26', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('27', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('28', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('29', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('30', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('31', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('32', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('33', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('34', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('35', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('36', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('37', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('38', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('39', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('40', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('41', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('42', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('43', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('44', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('45', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('46', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('47', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('48', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('49', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('50', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('51', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('52', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('53', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('54', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('55', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('56', '0', 'img1488698200755.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('57', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('58', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('59', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('60', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('61', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('62', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('63', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('64', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('65', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('66', '0', 'img1488698200743.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('67', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('68', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('69', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('70', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('71', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('72', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('73', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('74', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('75', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('76', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('77', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('78', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('79', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('80', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('81', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('82', '0', 'img1488698200584.jpg', '1', 'sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('83', '0', 'img1488698200732.jpg', '2', 'sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('84', '0', 'img1488698200755.jpg', '10', 'sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('85', '0', 'img1488698200743.jpg', '9', 'sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('86', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('87', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('88', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('89', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('90', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('91', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('92', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('93', '0', 'img1488698200584.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('94', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('95', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('96', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('97', '0', 'img1488698200732.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('98', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('99', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('100', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('101', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('102', '0', 'img1488698200584.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('103', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('104', '0', 'img1488698200755.jpg', '10', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('105', '0', 'img1488698200743.jpg', '9', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('106', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('107', '0', 'img1488698200584.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('108', '0', 'img1488698200743.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('109', '0', 'img1488698200755.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('110', '0', 'img1488698200732.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('111', '0', 'img1488698200743.jpg', '1', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('112', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('113', '0', 'img1488698200743.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('114', '0', 'img1488698200732.jpg', '2', 'Sujith');
INSERT INTO `image_login_temp_hod_password` VALUES ('115', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_hod_password` VALUES ('116', '0', 'img1488694355241.jpg', '1', 'Chaitanya');
INSERT INTO `image_login_temp_student_password` VALUES ('1', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('2', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('3', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('4', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('5', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('6', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('7', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('8', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('9', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('10', '0', 'img1488694448021.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('11', '0', 'img1488694448015.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('12', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('13', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('14', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('15', '0', 'img1488694448031.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('16', '0', 'img1488694448021.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('17', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('18', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('19', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('20', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('21', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('22', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('23', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('24', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('25', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('26', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('27', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('28', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('29', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('30', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('31', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('32', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('33', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('34', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('35', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('36', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('37', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('38', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('39', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('40', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('41', '0', 'img1488888718024.jpg', '2', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('42', '0', 'img1488888717885.jpg', '1', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('43', '0', 'img1488888718024.jpg', '2', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('44', '0', 'img1488888717885.jpg', '1', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('45', '0', 'img1488888717885.jpg', '1', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('46', '0', 'img1488888718024.jpg', '2', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('47', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('48', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('49', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('50', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('51', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('52', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('53', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('54', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('55', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('56', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('57', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('58', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('59', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('60', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('61', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('62', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('63', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('64', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('65', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('66', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('67', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('68', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('69', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('70', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('71', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('72', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('73', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('74', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('75', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('76', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('77', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('78', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('79', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('80', '0', 'img1488888718024.jpg', '2', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('81', '0', 'img1488888717885.jpg', '1', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('82', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('83', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('84', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('85', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('86', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('87', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('88', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('89', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('90', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('91', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('92', '0', 'img1488888718024.jpg', '2', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('93', '0', 'img1488888717885.jpg', '1', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('94', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('95', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('96', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('97', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('98', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('99', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('100', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('101', '0', 'img1488694448031.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('102', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('103', '0', 'img1488694448021.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('104', '0', 'img1488694448015.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('105', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('106', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('107', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('108', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('109', '0', 'img1488694448021.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('110', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('111', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('112', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('113', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('114', '0', 'img1488694448015.jpg', '1', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('115', '0', 'img1488694448026.jpg', '9', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('116', '0', 'img1488694448021.jpg', '2', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('117', '0', 'img1488694448031.jpg', '10', 'varsha');
INSERT INTO `image_login_temp_student_password` VALUES ('118', '0', 'img1488888717885.jpg', '1', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('119', '0', 'img1488888718024.jpg', '2', 'Chetna');
INSERT INTO `image_login_temp_student_password` VALUES ('120', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('121', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('122', '0', 'img1489210074736.jpg', '1', 'vv');
INSERT INTO `image_login_temp_student_password` VALUES ('123', '0', 'img1489578221571.jpg', '1', 'a');
INSERT INTO `image_login_temp_student_password` VALUES ('124', '0', 'img1489578221717.jpg', '9', 'a');
INSERT INTO `image_login_temp_student_password` VALUES ('125', '0', 'img1489578221571.jpg', '1', 'a');
INSERT INTO `image_login_temp_student_password` VALUES ('126', '0', 'img1489578221717.jpg', '9', 'a');
INSERT INTO `image_login_temp_student_password` VALUES ('127', '0', 'img1489578221571.jpg', '1', 'a');
INSERT INTO `image_login_temp_student_password` VALUES ('128', '0', 'img1489578221717.jpg', '9', 'a');
INSERT INTO `image_login_temp_student_password` VALUES ('129', '0', 'img1489578221571.jpg', '1', 'a');
INSERT INTO `image_login_temp_student_password` VALUES ('130', '0', 'img1489578221717.jpg', '9', 'a');
INSERT INTO `image_login_temp_student_password` VALUES ('131', '0', 'img1489580244284.jpg', '1', 'RASHIKA');
INSERT INTO `image_login_temp_student_password` VALUES ('132', '0', 'img1489580244457.jpg', '3', 'RASHIKA');
INSERT INTO `image_login_temp_student_password` VALUES ('133', '0', 'img1489580244476.jpg', '17', 'RASHIKA');
INSERT INTO `image_login_temp_student_password` VALUES ('134', '0', 'img1489580244482.jpg', '19', 'RASHIKA');
INSERT INTO `image_login_temp_teacher_password` VALUES ('1', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('2', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('3', '0', 'img1488694550158.jpg', '2', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('4', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('5', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('6', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('7', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('8', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('9', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('10', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('11', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('12', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('13', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('14', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('15', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('16', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('17', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('18', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('19', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('20', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('21', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('22', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('23', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('24', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('25', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('26', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('27', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('28', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('29', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('30', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('31', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('32', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_login_temp_teacher_password` VALUES ('33', '0', 'img1488694550158.jpg', '1', 'monica');
INSERT INTO `image_password_hod_registration_index` VALUES ('1', '1', 'img1488694355241.jpg', '1');
INSERT INTO `image_password_hod_registration_index` VALUES ('2', '2', 'img1488698200584.jpg', '1');
INSERT INTO `image_password_hod_registration_index` VALUES ('3', '2', 'img1488698200732.jpg', '2');
INSERT INTO `image_password_hod_registration_index` VALUES ('4', '2', 'img1488698200743.jpg', '9');
INSERT INTO `image_password_hod_registration_index` VALUES ('5', '2', 'img1488698200755.jpg', '10');
INSERT INTO `image_password_registration` VALUES ('1', 'dsfdff', '4334534', '1483676754779_190492_3191.jpg', 'dfdfdf', null, null, null);
INSERT INTO `image_password_registration` VALUES ('2', 'dsfdff', '4334534', '1483676937583_265961_3059.jpg', 'dfdfdf', null, null, null);
INSERT INTO `image_password_registration` VALUES ('3', 'dsfdff', '4334534', '1483679438269_city.jpg', 'dfdfdf', null, null, null);
INSERT INTO `image_password_registration` VALUES ('4', 'dsfdff', '45435', '1483679931878_desert.jpg', 'dfdfdf', null, null, null);
INSERT INTO `image_password_registration` VALUES ('5', 'dsfdff', '4334534', '1483681470406_butterfly.jpg', 'dfdfdf', null, null, null);
INSERT INTO `image_password_registration` VALUES ('6', 'aditi', '30000', '1483682883350_222.jpg', 'thane', null, null, null);
INSERT INTO `image_password_registration` VALUES ('7', 'sfsg', '9090', '1483684217184_222.jpg', 'sgvfg', null, null, null);
INSERT INTO `image_password_registration` VALUES ('8', 'asas', '3334444', '1483686905768_Koala.jpg', 'asas', null, null, null);
INSERT INTO `image_password_registration` VALUES ('9', 'ghg', '9898998', '1483691610765_Tulips.jpg', 'jjh', null, null, null);
INSERT INTO `image_password_registration` VALUES ('10', 'jjhjhj', '9898998', '1483696335569_fvav.jpg', 'njj', null, null, null);
INSERT INTO `image_password_registration` VALUES ('11', 'bb', '9989', '1483698140183_Tulips.jpg', 'bb', null, null, null);
INSERT INTO `image_password_registration` VALUES ('12', 'gag', '6666', '1483698619242_2.jpg', 'afdg', null, null, null);
INSERT INTO `image_password_registration` VALUES ('13', 'Tanya', '77777', '1483708208891_Hydrangeas.jpg', 'Vashi', null, null, null);
INSERT INTO `image_password_registration` VALUES ('14', 'vvv', '0', '1483709065925_ewr.jpg', 'thane', null, null, null);
INSERT INTO `image_password_registration` VALUES ('15', 'jhjh', '0', '1483709814302_Koala.jpg', 'saf', null, null, null);
INSERT INTO `image_password_registration` VALUES ('16', 'aaa', '0', '0.0', 'aaaa', '1483772026951_Tulips.jpg', null, null);
INSERT INTO `image_password_registration` VALUES ('17', 'aaa', '0', '1483772435147_ewr.jpg', 'aaa', null, null, null);
INSERT INTO `image_password_registration` VALUES ('18', 'ghgh', '0', '1483772773959_ewr.jpg', 'ad', '2', null, null);
INSERT INTO `image_password_registration` VALUES ('19', 'hh', '0', '1483774116128_Hydrangeas.jpg', 'hh', '1', '6', '6');
INSERT INTO `image_password_registration` VALUES ('20', 'Chaitanya', '0', '1483788407447_55.jpg', 'Bhandup', null, '2', '2');
INSERT INTO `image_password_student_registration_index` VALUES ('1', '1', 'img1488694448015.jpg', '1');
INSERT INTO `image_password_student_registration_index` VALUES ('2', '1', 'img1488694448021.jpg', '2');
INSERT INTO `image_password_student_registration_index` VALUES ('3', '1', 'img1488694448026.jpg', '9');
INSERT INTO `image_password_student_registration_index` VALUES ('4', '1', 'img1488694448031.jpg', '10');
INSERT INTO `image_password_student_registration_index` VALUES ('13', '10', 'img1488888717885.jpg', '1');
INSERT INTO `image_password_student_registration_index` VALUES ('14', '10', 'img1488888718024.jpg', '2');
INSERT INTO `image_password_student_registration_index` VALUES ('15', '11', 'img1489210074736.jpg', '1');
INSERT INTO `image_password_student_registration_index` VALUES ('16', '12', 'img1489578221571.jpg', '1');
INSERT INTO `image_password_student_registration_index` VALUES ('17', '12', 'img1489578221717.jpg', '9');
INSERT INTO `image_password_student_registration_index` VALUES ('18', '13', 'img1489580244284.jpg', '1');
INSERT INTO `image_password_student_registration_index` VALUES ('19', '13', 'img1489580244457.jpg', '3');
INSERT INTO `image_password_student_registration_index` VALUES ('20', '13', 'img1489580244476.jpg', '17');
INSERT INTO `image_password_student_registration_index` VALUES ('21', '13', 'img1489580244482.jpg', '19');
INSERT INTO `image_password_student_registration_index` VALUES ('22', '14', 'img1489581927723.jpg', '0');
INSERT INTO `image_password_student_registration_index` VALUES ('23', '15', 'img1489582069691.jpg', '0');
INSERT INTO `image_password_student_registration_index` VALUES ('24', '16', 'img1489582335707.jpg', '0');
INSERT INTO `image_password_student_registration_index` VALUES ('25', '17', 'img1489583220616.jpg', '0');
INSERT INTO `image_password_student_registration_index` VALUES ('26', '18', 'img1489583370838.jpg', '0');
INSERT INTO `image_password_student_registration_index` VALUES ('27', '19', 'img1489583633337.jpg', '0');
INSERT INTO `image_password_teacher_registration_index` VALUES ('1', '1', 'img1488694550158.jpg', '1');
INSERT INTO `role` VALUES ('1', 'HOD', 'HOD');
INSERT INTO `role` VALUES ('2', 'TEACHER', 'TEACHER');
INSERT INTO `role` VALUES ('3', 'STUDENT', 'STUDENT');
INSERT INTO `student_registration` VALUES ('1', 'varsha', 'thane', '9789097687', 'COMPS', 'varsha@gmail.com', '1', '2nd', '2017-03-08', '2017-03-24', '2', '2', 'yes', '1488694447974_nature9.jpg');
INSERT INTO `student_registration` VALUES ('10', 'Chetna', 'Airoli', '7777777777', 'COMPS', 'chetna@gmail.com', '111111', '1st', '2017-03-01', '2017-03-15', '1', '2', 'yes', '1488888713124_animal6.jpg');
INSERT INTO `student_registration` VALUES ('11', 'vv', 'vv', '1111111111', 'IT', 'v@gmail.com', '111111', '3rd', '03/01/2017', '03/31/2017', '1', '1', 'no', '1489210072555_animal2.jpg');
INSERT INTO `student_registration` VALUES ('12', 'a', 'a', '1111111111', 'IT', 'a@gmail.com', '111111', '8th', '03/02/2017', '05/17/2019', '2', '1', 'yes', '1489578220449_animal1.jpg');
INSERT INTO `student_registration` VALUES ('13', 'Rashika', '1302', '1111111111', 'IT', 'rashikak295@gmail.com', '111111', '8th', '05/22/2013', '03/22/2017', '2', '2', 'yes', '1489580242551_animal1.jpg');
INSERT INTO `student_requested_files` VALUES ('1', '1', '1', 'nature1.jpg', '1', 'Approve', 'varsha');
INSERT INTO `student_requested_files` VALUES ('2', '1', '1', 'nature1.jpg', '1', 'Approve', 'varsha');
INSERT INTO `student_requested_files` VALUES ('3', '1', '1', 'nature1.jpg', '1', 'Requested', 'varsha');
INSERT INTO `student_requested_files` VALUES ('4', '1', '2', 'animal2.jpg', '1', 'Approve', 'varsha');
INSERT INTO `student_upload_file` VALUES ('1', '1', 'nature3.jpg', 'D:\\tmp\\varsha\\nature3.jpg', 'varsha', 'COMPS', 'Student');
INSERT INTO `student_upload_file` VALUES ('2', '10', 'animal.jpg', 'D:\\tmp\\Chetna\\animal.jpg', 'Chetna', 'COMPS', 'Student');
INSERT INTO `student_upload_file` VALUES ('3', '12', 'animal2.jpg', 'D:\\tmp\\a\\animal2.jpg', 'a', 'IT', 'Student');
INSERT INTO `student_upload_file` VALUES ('4', '12', 'animal2.jpg', 'D:\\tmp\\a\\animal2.jpg', 'a', 'IT', 'Student');
INSERT INTO `student_upload_file` VALUES ('5', '12', 'animal.jpg', 'D:\\tmp\\a\\animal.jpg', 'a', 'IT', 'Student');
INSERT INTO `teacher_registration` VALUES ('1', 'monica', 'airoli', '8699999999', 'be', 'monica@gmail.com', 'COMPS', '1', '1', 'yes', '1488694550119_nature.jpg');
INSERT INTO `teacher_requested_files` VALUES ('1', '1', '1', 'nature.jpg', '1', 'Approve', 'monica');
INSERT INTO `teacher_requested_files` VALUES ('2', '1', '1', 'nature.jpg', '1', 'Requested', 'monica');
INSERT INTO `teacher_requested_files` VALUES ('3', '1', '1', 'nature.jpg', '1', 'Requested', 'monica');
INSERT INTO `teacher_upload_file` VALUES ('1', '1', 'nature1.jpg', 'D:\\tmp\\monica\\nature1.jpg', 'monica', 'COMPS', 'Faculty');
INSERT INTO `teacher_upload_file` VALUES ('2', '1', 'animal2.jpg', 'D:\\tmp\\monica\\animal2.jpg', 'monica', 'COMPS', 'Faculty');
INSERT INTO `upload_public_data` VALUES ('2', 'Faculty', 'COMPS', 'E:\\MVOCAandGPSI\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\GPSI\\photo\\animal7.jpg', '1st', 'Chaitanya', 'HOD');
INSERT INTO `upload_public_data` VALUES ('3', 'Student', 'IT', 'E:\\MVOCAandGPSI\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\GPSI\\photo\\animal8.jpg', '3rd', 'Chaitanya', 'HOD');
INSERT INTO `upload_public_data` VALUES ('4', 'HOD', 'IT', 'E:\\MVOCAandGPSI\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\GPSI\\photo\\animal9.jpg', '1st', 'vv', 'Student');
INSERT INTO `upload_public_data` VALUES ('5', 'Faculty', 'IT', 'E:\\MVOCAandGPSI\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\GPSI\\photo\\animal3.jpg', 'NA', 'a', 'Student');
INSERT INTO `upload_public_data` VALUES ('6', 'Faculty', 'IT', 'E:\\MVOCAandGPSI\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\GPSI\\photo\\animal3.jpg', 'NA', 'a', 'Student');
INSERT INTO `upload_public_data` VALUES ('7', 'HOD', 'COMPS', 'E:\\MVOCAandGPSI\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\GPSI\\photo\\animal8.jpg', 'NA', 'a', 'Student');
INSERT INTO `upload_public_data` VALUES ('8', 'Faculty', 'EXTC', 'E:\\MVOCAandGPSI\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\GPSI\\photo\\animal1.jpg', 'NA', 'a', 'Student');
