-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: get_a_pet
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO,ANSI' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: "get_a_pet"
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "get_a_pet" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "get_a_pet";

--
-- Table structure for table "animal"
--

DROP TABLE IF EXISTS "animal";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "animal" (
  "aid" int(11) NOT NULL AUTO_INCREMENT,
  "name" char(20) DEFAULT NULL,
  "species" char(10) DEFAULT NULL,
  "breed" char(20) DEFAULT NULL,
  "sex" char(1) DEFAULT NULL,
  "age" decimal(2,0) DEFAULT NULL,
  "neutered" char(1) DEFAULT NULL,
  "fosterable" char(1) DEFAULT NULL,
  "adoptable" char(1) DEFAULT NULL,
  PRIMARY KEY ("aid")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "animal"
--

LOCK TABLES "animal" WRITE;
/*!40000 ALTER TABLE "animal" DISABLE KEYS */;
INSERT INTO "animal" VALUES (1,'Gumgum','cat','shorthair','M',12,'Y','Y','N'),(2,'Bea','dog','pug','F',3,'N','N','Y'),(3,'Trixie','dog','shih tzu','F',1,'Y','Y','Y'),(4,'Gordon','dog','poodle','M',8,'Y','N','Y'),(5,'Garfield','cat','shorthair','M',3,'N','N','N'),(6,'Bobo','dog','pomeranian','M',4,'Y','Y','Y'),(7,'Nougat','cat','shorthair','F',9,'N','Y','N'),(8,'Clover','dog','poodle','F',14,'Y','N','Y'),(9,'Bruno','cat','shorthair','M',9,'N','N','N'),(10,'Bella','cat','shorthair','F',1,'Y','Y','Y');
/*!40000 ALTER TABLE "animal" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "auth_group"
--

DROP TABLE IF EXISTS "auth_group";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "auth_group" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(150) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "name" ("name")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "auth_group"
--

LOCK TABLES "auth_group" WRITE;
/*!40000 ALTER TABLE "auth_group" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_group" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "auth_group_permissions"
--

DROP TABLE IF EXISTS "auth_group_permissions";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "auth_group_permissions" (
  "id" bigint(20) NOT NULL AUTO_INCREMENT,
  "group_id" int(11) NOT NULL,
  "permission_id" int(11) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ("group_id","permission_id"),
  KEY "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" ("permission_id"),
  CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id"),
  CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "auth_group_permissions"
--

LOCK TABLES "auth_group_permissions" WRITE;
/*!40000 ALTER TABLE "auth_group_permissions" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_group_permissions" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "auth_permission"
--

DROP TABLE IF EXISTS "auth_permission";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "auth_permission" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "name" varchar(255) NOT NULL,
  "content_type_id" int(11) NOT NULL,
  "codename" varchar(100) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "auth_permission_content_type_id_codename_01ab375a_uniq" ("content_type_id","codename"),
  CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "auth_permission"
--

LOCK TABLES "auth_permission" WRITE;
/*!40000 ALTER TABLE "auth_permission" DISABLE KEYS */;
INSERT INTO "auth_permission" VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE "auth_permission" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "auth_user"
--

DROP TABLE IF EXISTS "auth_user";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "auth_user" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "password" varchar(128) NOT NULL,
  "last_login" datetime(6) DEFAULT NULL,
  "is_superuser" tinyint(1) NOT NULL,
  "username" varchar(150) NOT NULL,
  "first_name" varchar(150) NOT NULL,
  "last_name" varchar(150) NOT NULL,
  "email" varchar(254) NOT NULL,
  "is_staff" tinyint(1) NOT NULL,
  "is_active" tinyint(1) NOT NULL,
  "date_joined" datetime(6) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "username" ("username")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "auth_user"
--

LOCK TABLES "auth_user" WRITE;
/*!40000 ALTER TABLE "auth_user" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_user" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "auth_user_groups"
--

DROP TABLE IF EXISTS "auth_user_groups";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "auth_user_groups" (
  "id" bigint(20) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) NOT NULL,
  "group_id" int(11) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "auth_user_groups_user_id_group_id_94350c0c_uniq" ("user_id","group_id"),
  KEY "auth_user_groups_group_id_97559544_fk_auth_group_id" ("group_id"),
  CONSTRAINT "auth_user_groups_group_id_97559544_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id"),
  CONSTRAINT "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "auth_user_groups"
--

LOCK TABLES "auth_user_groups" WRITE;
/*!40000 ALTER TABLE "auth_user_groups" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_user_groups" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "auth_user_user_permissions"
--

DROP TABLE IF EXISTS "auth_user_user_permissions";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "auth_user_user_permissions" (
  "id" bigint(20) NOT NULL AUTO_INCREMENT,
  "user_id" int(11) NOT NULL,
  "permission_id" int(11) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ("user_id","permission_id"),
  KEY "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" ("permission_id"),
  CONSTRAINT "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id"),
  CONSTRAINT "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "auth_user_user_permissions"
--

LOCK TABLES "auth_user_user_permissions" WRITE;
/*!40000 ALTER TABLE "auth_user_user_permissions" DISABLE KEYS */;
/*!40000 ALTER TABLE "auth_user_user_permissions" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "day_time_slot"
--

DROP TABLE IF EXISTS "day_time_slot";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "day_time_slot" (
  "timeSlotID" int(11) NOT NULL,
  "startTime" decimal(4,0) DEFAULT NULL,
  "endTime" decimal(4,0) DEFAULT NULL,
  "weekdaysOffered" set('M','T','W','Th','F','S','Su') DEFAULT NULL,
  PRIMARY KEY ("timeSlotID")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "day_time_slot"
--

LOCK TABLES "day_time_slot" WRITE;
/*!40000 ALTER TABLE "day_time_slot" DISABLE KEYS */;
/*!40000 ALTER TABLE "day_time_slot" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "django_admin_log"
--

DROP TABLE IF EXISTS "django_admin_log";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "django_admin_log" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "action_time" datetime(6) NOT NULL,
  "object_id" longtext DEFAULT NULL,
  "object_repr" varchar(200) NOT NULL,
  "action_flag" smallint(5) unsigned NOT NULL,
  "change_message" longtext NOT NULL,
  "content_type_id" int(11) DEFAULT NULL,
  "user_id" int(11) NOT NULL,
  PRIMARY KEY ("id"),
  KEY "django_admin_log_content_type_id_c4bce8eb_fk_django_co" ("content_type_id"),
  KEY "django_admin_log_user_id_c564eba6_fk_auth_user_id" ("user_id"),
  CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id"),
  CONSTRAINT "django_admin_log_user_id_c564eba6_fk_auth_user_id" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id"),
  CONSTRAINT "django_admin_log_chk_1" CHECK ("action_flag" >= 0)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "django_admin_log"
--

LOCK TABLES "django_admin_log" WRITE;
/*!40000 ALTER TABLE "django_admin_log" DISABLE KEYS */;
/*!40000 ALTER TABLE "django_admin_log" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "django_content_type"
--

DROP TABLE IF EXISTS "django_content_type";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "django_content_type" (
  "id" int(11) NOT NULL AUTO_INCREMENT,
  "app_label" varchar(100) NOT NULL,
  "model" varchar(100) NOT NULL,
  PRIMARY KEY ("id"),
  UNIQUE KEY "django_content_type_app_label_model_76bd3d3b_uniq" ("app_label","model")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "django_content_type"
--

LOCK TABLES "django_content_type" WRITE;
/*!40000 ALTER TABLE "django_content_type" DISABLE KEYS */;
INSERT INTO "django_content_type" VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE "django_content_type" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "django_migrations"
--

DROP TABLE IF EXISTS "django_migrations";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "django_migrations" (
  "id" bigint(20) NOT NULL AUTO_INCREMENT,
  "app" varchar(255) NOT NULL,
  "name" varchar(255) NOT NULL,
  "applied" datetime(6) NOT NULL,
  PRIMARY KEY ("id")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "django_migrations"
--

LOCK TABLES "django_migrations" WRITE;
/*!40000 ALTER TABLE "django_migrations" DISABLE KEYS */;
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2021-05-03 20:46:27.698792'),(2,'auth','0001_initial','2021-05-03 20:46:29.497758'),(3,'admin','0001_initial','2021-05-03 20:46:29.884819'),(4,'admin','0002_logentry_remove_auto_add','2021-05-03 20:46:29.910743'),(5,'admin','0003_logentry_add_action_flag_choices','2021-05-03 20:46:29.939668'),(6,'contenttypes','0002_remove_content_type_name','2021-05-03 20:46:30.228069'),(7,'auth','0002_alter_permission_name_max_length','2021-05-03 20:46:30.547992'),(8,'auth','0003_alter_user_email_max_length','2021-05-03 20:46:30.619186'),(9,'auth','0004_alter_user_username_opts','2021-05-03 20:46:30.647237'),(10,'auth','0005_alter_user_last_login_null','2021-05-03 20:46:30.784375'),(11,'auth','0006_require_contenttypes_0002','2021-05-03 20:46:30.795756'),(12,'auth','0007_alter_validators_add_error_messages','2021-05-03 20:46:30.819956'),(13,'auth','0008_alter_user_username_max_length','2021-05-03 20:46:30.999866'),(14,'auth','0009_alter_user_last_name_max_length','2021-05-03 20:46:31.185396'),(15,'auth','0010_alter_group_name_max_length','2021-05-03 20:46:31.246254'),(16,'auth','0011_update_proxy_permissions','2021-05-03 20:46:31.279626'),(17,'auth','0012_alter_user_first_name_max_length','2021-05-03 20:46:31.579213'),(18,'sessions','0001_initial','2021-05-03 20:46:31.652112');
/*!40000 ALTER TABLE "django_migrations" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "django_session"
--

DROP TABLE IF EXISTS "django_session";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "django_session" (
  "session_key" varchar(40) NOT NULL,
  "session_data" longtext NOT NULL,
  "expire_date" datetime(6) NOT NULL,
  PRIMARY KEY ("session_key"),
  KEY "django_session_expire_date_a5c62663" ("expire_date")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "django_session"
--

LOCK TABLES "django_session" WRITE;
/*!40000 ALTER TABLE "django_session" DISABLE KEYS */;
/*!40000 ALTER TABLE "django_session" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "donate"
--

DROP TABLE IF EXISTS "donate";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "donate" (
  "sid" decimal(6,0) NOT NULL,
  "fid" int(11) NOT NULL,
  "donation" decimal(5,0) DEFAULT NULL,
  PRIMARY KEY ("sid","fid"),
  KEY "fid" ("fid"),
  CONSTRAINT "donate_ibfk_1" FOREIGN KEY ("fid") REFERENCES "foster" ("fid"),
  CONSTRAINT "donate_ibfk_2" FOREIGN KEY ("sid") REFERENCES "shelter" ("sid")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "donate"
--

LOCK TABLES "donate" WRITE;
/*!40000 ALTER TABLE "donate" DISABLE KEYS */;
/*!40000 ALTER TABLE "donate" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "employee"
--

DROP TABLE IF EXISTS "employee";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "employee" (
  "eid" int(11) NOT NULL AUTO_INCREMENT,
  "firstName" char(20) DEFAULT NULL,
  "lastName" char(20) DEFAULT NULL,
  "username" char(30) DEFAULT NULL,
  "password" char(30) DEFAULT NULL,
  "phoneNumber" char(10) DEFAULT NULL,
  PRIMARY KEY ("eid")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "employee"
--

LOCK TABLES "employee" WRITE;
/*!40000 ALTER TABLE "employee" DISABLE KEYS */;
INSERT INTO "employee" VALUES (1,'Isaac','Morrison','imorrison@ccas.com','liklik123','2168897030'),(2,'Lily','Rutherford','lrutherford@ccas.com','Pe@nut99','2166536654'),(3,'Fiona','Reid','freid@ccas.com','8054','2167788054'),(4,'Frank','Allan','fallan@ccas.com','qwerty','3174582256'),(5,'Katherine','Rees','klr@parma.com','DontWorryBeHappy','2168835968'),(6,'Tim','Hemmings','trh@parma.com','gg660','2162375506'),(7,'Isaac','Vance','gfv@parma.com','hottie','6603451750'),(8,'Gordon','Bell','gordbell@capl.com','passw0rd','2163682340'),(9,'Sally','Vance','sallvanc@capl.com','wgrj253-o4gw','2162305968'),(10,'Diana','Baker','dianbake@capl.com','crunch13srunch13','2162386038');
/*!40000 ALTER TABLE "employee" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "feeding_timeslot"
--

DROP TABLE IF EXISTS "feeding_timeslot";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "feeding_timeslot" (
  "aid" int(11) NOT NULL,
  "timeSlotID" int(11) NOT NULL,
  PRIMARY KEY ("aid","timeSlotID"),
  KEY "timeSlotID" ("timeSlotID"),
  CONSTRAINT "feeding_timeslot_ibfk_1" FOREIGN KEY ("aid") REFERENCES "animal" ("aid"),
  CONSTRAINT "feeding_timeslot_ibfk_2" FOREIGN KEY ("timeSlotID") REFERENCES "day_time_slot" ("timeSlotID")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "feeding_timeslot"
--

LOCK TABLES "feeding_timeslot" WRITE;
/*!40000 ALTER TABLE "feeding_timeslot" DISABLE KEYS */;
/*!40000 ALTER TABLE "feeding_timeslot" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "foster"
--

DROP TABLE IF EXISTS "foster";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "foster" (
  "fid" int(11) NOT NULL AUTO_INCREMENT,
  "firstName" char(20) DEFAULT NULL,
  "lastName" char(20) DEFAULT NULL,
  "username" char(12) DEFAULT NULL,
  "password" char(12) DEFAULT NULL,
  "phoneNumber" decimal(10,0) DEFAULT NULL,
  "fund" decimal(5,0) DEFAULT NULL,
  PRIMARY KEY ("fid")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "foster"
--

LOCK TABLES "foster" WRITE;
/*!40000 ALTER TABLE "foster" DISABLE KEYS */;
/*!40000 ALTER TABLE "foster" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "fostering"
--

DROP TABLE IF EXISTS "fostering";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "fostering" (
  "aid" int(11) NOT NULL,
  "fid" int(11) NOT NULL,
  PRIMARY KEY ("aid","fid"),
  KEY "fid" ("fid"),
  CONSTRAINT "fostering_ibfk_1" FOREIGN KEY ("aid") REFERENCES "animal" ("aid"),
  CONSTRAINT "fostering_ibfk_2" FOREIGN KEY ("fid") REFERENCES "foster" ("fid")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "fostering"
--

LOCK TABLES "fostering" WRITE;
/*!40000 ALTER TABLE "fostering" DISABLE KEYS */;
/*!40000 ALTER TABLE "fostering" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "grooming_timeslot"
--

DROP TABLE IF EXISTS "grooming_timeslot";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "grooming_timeslot" (
  "aid" int(11) NOT NULL,
  "timeSlotID" int(11) NOT NULL,
  PRIMARY KEY ("aid","timeSlotID"),
  KEY "timeSlotID" ("timeSlotID"),
  CONSTRAINT "grooming_timeslot_ibfk_1" FOREIGN KEY ("aid") REFERENCES "animal" ("aid"),
  CONSTRAINT "grooming_timeslot_ibfk_2" FOREIGN KEY ("timeSlotID") REFERENCES "day_time_slot" ("timeSlotID")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "grooming_timeslot"
--

LOCK TABLES "grooming_timeslot" WRITE;
/*!40000 ALTER TABLE "grooming_timeslot" DISABLE KEYS */;
/*!40000 ALTER TABLE "grooming_timeslot" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "medication_timeslot"
--

DROP TABLE IF EXISTS "medication_timeslot";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "medication_timeslot" (
  "aid" int(11) NOT NULL,
  "timeSlotID" int(11) NOT NULL,
  PRIMARY KEY ("aid","timeSlotID"),
  KEY "timeSlotID" ("timeSlotID"),
  CONSTRAINT "medication_timeslot_ibfk_1" FOREIGN KEY ("aid") REFERENCES "animal" ("aid"),
  CONSTRAINT "medication_timeslot_ibfk_2" FOREIGN KEY ("timeSlotID") REFERENCES "day_time_slot" ("timeSlotID")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "medication_timeslot"
--

LOCK TABLES "medication_timeslot" WRITE;
/*!40000 ALTER TABLE "medication_timeslot" DISABLE KEYS */;
/*!40000 ALTER TABLE "medication_timeslot" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "shelter"
--

DROP TABLE IF EXISTS "shelter";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "shelter" (
  "sid" decimal(6,0) NOT NULL,
  "name" char(20) DEFAULT NULL,
  "street" char(20) DEFAULT NULL,
  "city" char(20) DEFAULT NULL,
  "state" enum('AL','AK','AS','AZ','AR','CA','CO','CT','DE','DC','FL','GA','GU','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','MP','OH','OK','OR','PA','PR','RI','SC','SD','TN','TX','UT','VT','VA','VI','WA','WV','WI','WY') DEFAULT NULL,
  "zipCode" decimal(5,0) DEFAULT NULL,
  "phoneNumber" decimal(10,0) DEFAULT NULL,
  PRIMARY KEY ("sid")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "shelter"
--

LOCK TABLES "shelter" WRITE;
/*!40000 ALTER TABLE "shelter" DISABLE KEYS */;
/*!40000 ALTER TABLE "shelter" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "sheltering"
--

DROP TABLE IF EXISTS "sheltering";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "sheltering" (
  "aid" int(11) NOT NULL,
  "sid" decimal(6,0) NOT NULL,
  PRIMARY KEY ("aid","sid"),
  KEY "sid" ("sid"),
  CONSTRAINT "sheltering_ibfk_1" FOREIGN KEY ("aid") REFERENCES "animal" ("aid"),
  CONSTRAINT "sheltering_ibfk_2" FOREIGN KEY ("sid") REFERENCES "shelter" ("sid")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "sheltering"
--

LOCK TABLES "sheltering" WRITE;
/*!40000 ALTER TABLE "sheltering" DISABLE KEYS */;
/*!40000 ALTER TABLE "sheltering" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "surgery_timeslot"
--

DROP TABLE IF EXISTS "surgery_timeslot";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "surgery_timeslot" (
  "aid" int(11) NOT NULL,
  "timeSlotID" int(11) NOT NULL,
  PRIMARY KEY ("aid","timeSlotID"),
  KEY "timeSlotID" ("timeSlotID"),
  CONSTRAINT "surgery_timeslot_ibfk_1" FOREIGN KEY ("aid") REFERENCES "animal" ("aid"),
  CONSTRAINT "surgery_timeslot_ibfk_2" FOREIGN KEY ("timeSlotID") REFERENCES "day_time_slot" ("timeSlotID")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "surgery_timeslot"
--

LOCK TABLES "surgery_timeslot" WRITE;
/*!40000 ALTER TABLE "surgery_timeslot" DISABLE KEYS */;
/*!40000 ALTER TABLE "surgery_timeslot" ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table "works"
--

DROP TABLE IF EXISTS "works";
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE "works" (
  "eid" int(11) NOT NULL,
  "sid" decimal(6,0) NOT NULL,
  PRIMARY KEY ("eid","sid"),
  KEY "sid" ("sid"),
  CONSTRAINT "works_ibfk_1" FOREIGN KEY ("eid") REFERENCES "employee" ("eid"),
  CONSTRAINT "works_ibfk_2" FOREIGN KEY ("sid") REFERENCES "shelter" ("sid")
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table "works"
--

LOCK TABLES "works" WRITE;
/*!40000 ALTER TABLE "works" DISABLE KEYS */;
/*!40000 ALTER TABLE "works" ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-07 18:36:40
