# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: mylog
# Generation Time: 2018-05-30 16:45:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can add permission',2,'add_permission'),
	(5,'Can change permission',2,'change_permission'),
	(6,'Can delete permission',2,'delete_permission'),
	(7,'Can add group',3,'add_group'),
	(8,'Can change group',3,'change_group'),
	(9,'Can delete group',3,'delete_group'),
	(10,'Can add user',4,'add_user'),
	(11,'Can change user',4,'change_user'),
	(12,'Can delete user',4,'delete_user'),
	(13,'Can add content type',5,'add_contenttype'),
	(14,'Can change content type',5,'change_contenttype'),
	(15,'Can delete content type',5,'delete_contenttype'),
	(16,'Can add session',6,'add_session'),
	(17,'Can change session',6,'change_session'),
	(18,'Can delete session',6,'delete_session'),
	(19,'Can add topic',7,'add_topic'),
	(20,'Can change topic',7,'change_topic'),
	(21,'Can delete topic',7,'delete_topic'),
	(22,'Can add entry',8,'add_entry'),
	(23,'Can change entry',8,'change_entry'),
	(24,'Can delete entry',8,'delete_entry');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$100000$oX28j1doEAMh$4dtr7ZJPiIB+SKhfiSyIsvojbEA1FfqvK0TYIJHVWEw=','2018-05-30 14:14:39.656655',1,'aulia','','','',1,1,'2018-05-30 14:03:04.067644');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2018-05-30 14:15:43.167295','1','111',1,'[{\"added\": {}}]',7,1),
	(2,'2018-05-30 15:15:00.050061','2','nice guys!...',1,'[{\"added\": {}}]',8,1),
	(3,'2018-05-30 15:16:01.946936','2','my nice log',1,'[{\"added\": {}}]',7,1),
	(4,'2018-05-30 15:16:14.869248','1','my first log',2,'[{\"changed\": {\"fields\": [\"text\"]}}]',7,1),
	(5,'2018-05-30 15:16:24.079931','2','nice guys!...',2,'[]',8,1),
	(6,'2018-05-30 15:16:38.422301','3','insite my first log...',1,'[{\"added\": {}}]',8,1),
	(7,'2018-05-30 15:16:50.234220','4','this is my nice log...',1,'[{\"added\": {}}]',8,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(8,'mylogapp','entry'),
	(7,'mylogapp','topic'),
	(6,'sessions','session');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2018-05-30 14:02:52.059728'),
	(2,'auth','0001_initial','2018-05-30 14:02:52.746644'),
	(3,'admin','0001_initial','2018-05-30 14:02:52.914610'),
	(4,'admin','0002_logentry_remove_auto_add','2018-05-30 14:02:52.956551'),
	(5,'contenttypes','0002_remove_content_type_name','2018-05-30 14:02:53.058027'),
	(6,'auth','0002_alter_permission_name_max_length','2018-05-30 14:02:53.104968'),
	(7,'auth','0003_alter_user_email_max_length','2018-05-30 14:02:53.152715'),
	(8,'auth','0004_alter_user_username_opts','2018-05-30 14:02:53.173146'),
	(9,'auth','0005_alter_user_last_login_null','2018-05-30 14:02:53.217185'),
	(10,'auth','0006_require_contenttypes_0002','2018-05-30 14:02:53.221791'),
	(11,'auth','0007_alter_validators_add_error_messages','2018-05-30 14:02:53.240455'),
	(12,'auth','0008_alter_user_username_max_length','2018-05-30 14:02:53.293978'),
	(13,'auth','0009_alter_user_last_name_max_length','2018-05-30 14:02:53.348238'),
	(14,'sessions','0001_initial','2018-05-30 14:02:53.428635'),
	(15,'mylogapp','0001_initial','2018-05-30 14:12:59.675341'),
	(16,'mylogapp','0002_entry','2018-05-30 15:13:46.850580');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('lndk717yjn4ol9ks6xzzrtahv3wmik3j','YzE1ZDJkZjg4MjNlYjI4ZTQzYjdjYTk3OGIyOTMxZWRmNjAzZTY4NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1ZDg3N2VjNjUxYzI1MjAzN2UyMjhlZjc4YWExZTFlMGNiMWZhZGM1In0=','2018-06-13 14:14:39.660249');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mylogapp_entry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mylogapp_entry`;

CREATE TABLE `mylogapp_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mylogapp_entry_topic_id_33c3400b_fk_mylogapp_topic_id` (`topic_id`),
  CONSTRAINT `mylogapp_entry_topic_id_33c3400b_fk_mylogapp_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `mylogapp_topic` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mylogapp_entry` WRITE;
/*!40000 ALTER TABLE `mylogapp_entry` DISABLE KEYS */;

INSERT INTO `mylogapp_entry` (`id`, `text`, `date_added`, `topic_id`)
VALUES
	(2,'nice guys!','2018-05-30 15:15:00.048998',1),
	(3,'insite my first log','2018-05-30 15:16:38.421109',1),
	(4,'this is my nice log','2018-05-30 15:16:50.233094',2);

/*!40000 ALTER TABLE `mylogapp_entry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table mylogapp_topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mylogapp_topic`;

CREATE TABLE `mylogapp_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(200) NOT NULL,
  `date_added` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `mylogapp_topic` WRITE;
/*!40000 ALTER TABLE `mylogapp_topic` DISABLE KEYS */;

INSERT INTO `mylogapp_topic` (`id`, `text`, `date_added`)
VALUES
	(1,'my first log','2018-05-30 14:15:43.166329'),
	(2,'my nice log','2018-05-30 15:16:01.944089');

/*!40000 ALTER TABLE `mylogapp_topic` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
