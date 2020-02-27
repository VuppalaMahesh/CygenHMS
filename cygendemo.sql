-- MySQL dump 10.13  Distrib 5.7.25, for Win64 (x86_64)
--
-- Host: localhost    Database: cygendemo
-- ------------------------------------------------------
-- Server version	5.7.25-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments_appointment`
--

DROP TABLE IF EXISTS `appointments_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments_appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appointmentType` smallint(5) unsigned NOT NULL,
  `flag` smallint(5) unsigned NOT NULL,
  `bookingdate` date DEFAULT NULL,
  `bookingtime` time(6) DEFAULT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `appointments_appoint_doctor_id_fb58c3a1_fk_usermanag` (`doctor_id`),
  KEY `appointments_appoint_patient_id_631d13da_fk_usermanag` (`patient_id`),
  CONSTRAINT `appointments_appoint_doctor_id_fb58c3a1_fk_usermanag` FOREIGN KEY (`doctor_id`) REFERENCES `usermanagement_doctors` (`doc_id`),
  CONSTRAINT `appointments_appoint_patient_id_631d13da_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments_appointment`
--

LOCK TABLES `appointments_appointment` WRITE;
/*!40000 ALTER TABLE `appointments_appointment` DISABLE KEYS */;
INSERT INTO `appointments_appointment` VALUES (1,2,2,'2019-11-03','11:00:00.000000',3,'LHMR-00-00000001'),(4,2,2,'2019-11-04','11:00:00.000000',3,'LHMR-00-00000001');
/*!40000 ALTER TABLE `appointments_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments_blockslots`
--

DROP TABLE IF EXISTS `appointments_blockslots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments_blockslots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blockdate` date DEFAULT NULL,
  `blockslot` time(6) DEFAULT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appointments_blocksl_doctor_id_5d8478d9_fk_usermanag` (`doctor_id`),
  CONSTRAINT `appointments_blocksl_doctor_id_5d8478d9_fk_usermanag` FOREIGN KEY (`doctor_id`) REFERENCES `usermanagement_doctors` (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments_blockslots`
--

LOCK TABLES `appointments_blockslots` WRITE;
/*!40000 ALTER TABLE `appointments_blockslots` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointments_blockslots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments_doctorslots`
--

DROP TABLE IF EXISTS `appointments_doctorslots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointments_doctorslots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starttime` time(6) DEFAULT NULL,
  `endtime` time(6) DEFAULT NULL,
  `consultationfee` int(11) DEFAULT NULL,
  `breakslots` longtext,
  `appointmnetduration` varchar(100) DEFAULT NULL,
  `doctor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `appointments_doctors_doctor_id_8a3e483f_fk_usermanag` (`doctor_id`),
  CONSTRAINT `appointments_doctors_doctor_id_8a3e483f_fk_usermanag` FOREIGN KEY (`doctor_id`) REFERENCES `usermanagement_doctors` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments_doctorslots`
--

LOCK TABLES `appointments_doctorslots` WRITE;
/*!40000 ALTER TABLE `appointments_doctorslots` DISABLE KEYS */;
INSERT INTO `appointments_doctorslots` VALUES (1,'10:00:00.000000','18:00:00.000000',1000,'11:30:00','30',3);
/*!40000 ALTER TABLE `appointments_doctorslots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add advancederivatives',6,'add_advancederivatives'),(22,'Can change advancederivatives',6,'change_advancederivatives'),(23,'Can delete advancederivatives',6,'delete_advancederivatives'),(24,'Can view advancederivatives',6,'view_advancederivatives'),(25,'Can add alert',7,'add_alert'),(26,'Can change alert',7,'change_alert'),(27,'Can delete alert',7,'delete_alert'),(28,'Can view alert',7,'view_alert'),(29,'Can add allerirs',8,'add_allerirs'),(30,'Can change allerirs',8,'change_allerirs'),(31,'Can delete allerirs',8,'delete_allerirs'),(32,'Can view allerirs',8,'view_allerirs'),(33,'Can add amendments',9,'add_amendments'),(34,'Can change amendments',9,'change_amendments'),(35,'Can delete amendments',9,'delete_amendments'),(36,'Can view amendments',9,'view_amendments'),(37,'Can add cptcodes',10,'add_cptcodes'),(38,'Can change cptcodes',10,'change_cptcodes'),(39,'Can delete cptcodes',10,'delete_cptcodes'),(40,'Can view cptcodes',10,'view_cptcodes'),(41,'Can add cvxcodes',11,'add_cvxcodes'),(42,'Can change cvxcodes',11,'change_cvxcodes'),(43,'Can delete cvxcodes',11,'delete_cvxcodes'),(44,'Can view cvxcodes',11,'view_cvxcodes'),(45,'Can add doctornote',12,'add_doctornote'),(46,'Can change doctornote',12,'change_doctornote'),(47,'Can delete doctornote',12,'delete_doctornote'),(48,'Can view doctornote',12,'view_doctornote'),(49,'Can add familyhistory',13,'add_familyhistory'),(50,'Can change familyhistory',13,'change_familyhistory'),(51,'Can delete familyhistory',13,'delete_familyhistory'),(52,'Can view familyhistory',13,'view_familyhistory'),(53,'Can add goals',14,'add_goals'),(54,'Can change goals',14,'change_goals'),(55,'Can delete goals',14,'delete_goals'),(56,'Can view goals',14,'view_goals'),(57,'Can add healthhistory',15,'add_healthhistory'),(58,'Can change healthhistory',15,'change_healthhistory'),(59,'Can delete healthhistory',15,'delete_healthhistory'),(60,'Can view healthhistory',15,'view_healthhistory'),(61,'Can add hspccodes',16,'add_hspccodes'),(62,'Can change hspccodes',16,'change_hspccodes'),(63,'Can delete hspccodes',16,'delete_hspccodes'),(64,'Can view hspccodes',16,'view_hspccodes'),(65,'Can add icd10pcscodes',17,'add_icd10pcscodes'),(66,'Can change icd10pcscodes',17,'change_icd10pcscodes'),(67,'Can delete icd10pcscodes',17,'delete_icd10pcscodes'),(68,'Can view icd10pcscodes',17,'view_icd10pcscodes'),(69,'Can add icd10problemcodes',18,'add_icd10problemcodes'),(70,'Can change icd10problemcodes',18,'change_icd10problemcodes'),(71,'Can delete icd10problemcodes',18,'delete_icd10problemcodes'),(72,'Can view icd10problemcodes',18,'view_icd10problemcodes'),(73,'Can add icdsymtomscodes',19,'add_icdsymtomscodes'),(74,'Can change icdsymtomscodes',19,'change_icdsymtomscodes'),(75,'Can delete icdsymtomscodes',19,'delete_icdsymtomscodes'),(76,'Can view icdsymtomscodes',19,'view_icdsymtomscodes'),(77,'Can add illnesssymtoms',20,'add_illnesssymtoms'),(78,'Can change illnesssymtoms',20,'change_illnesssymtoms'),(79,'Can delete illnesssymtoms',20,'delete_illnesssymtoms'),(80,'Can view illnesssymtoms',20,'view_illnesssymtoms'),(81,'Can add inpatientdetails',21,'add_inpatientdetails'),(82,'Can change inpatientdetails',21,'change_inpatientdetails'),(83,'Can delete inpatientdetails',21,'delete_inpatientdetails'),(84,'Can view inpatientdetails',21,'view_inpatientdetails'),(85,'Can add lab assigntest2',22,'add_labassigntest2'),(86,'Can change lab assigntest2',22,'change_labassigntest2'),(87,'Can delete lab assigntest2',22,'delete_labassigntest2'),(88,'Can view lab assigntest2',22,'view_labassigntest2'),(89,'Can add lioniccode',23,'add_lioniccode'),(90,'Can change lioniccode',23,'change_lioniccode'),(91,'Can delete lioniccode',23,'delete_lioniccode'),(92,'Can view lioniccode',23,'view_lioniccode'),(93,'Can add medicalcodesfordrug',24,'add_medicalcodesfordrug'),(94,'Can change medicalcodesfordrug',24,'change_medicalcodesfordrug'),(95,'Can delete medicalcodesfordrug',24,'delete_medicalcodesfordrug'),(96,'Can view medicalcodesfordrug',24,'view_medicalcodesfordrug'),(97,'Can add medications',25,'add_medications'),(98,'Can change medications',25,'change_medications'),(99,'Can delete medications',25,'delete_medications'),(100,'Can view medications',25,'view_medications'),(101,'Can add patient allert',26,'add_patientallert'),(102,'Can change patient allert',26,'change_patientallert'),(103,'Can delete patient allert',26,'delete_patientallert'),(104,'Can view patient allert',26,'view_patientallert'),(105,'Can add patientproblems',27,'add_patientproblems'),(106,'Can change patientproblems',27,'change_patientproblems'),(107,'Can delete patientproblems',27,'delete_patientproblems'),(108,'Can view patientproblems',27,'view_patientproblems'),(109,'Can add patient status',28,'add_patientstatus'),(110,'Can change patient status',28,'change_patientstatus'),(111,'Can delete patient status',28,'delete_patientstatus'),(112,'Can view patient status',28,'view_patientstatus'),(113,'Can add procedure',29,'add_procedure'),(114,'Can change procedure',29,'change_procedure'),(115,'Can delete procedure',29,'delete_procedure'),(116,'Can view procedure',29,'view_procedure'),(117,'Can add referalls',30,'add_referalls'),(118,'Can change referalls',30,'change_referalls'),(119,'Can delete referalls',30,'delete_referalls'),(120,'Can view referalls',30,'view_referalls'),(121,'Can add reportfiles',31,'add_reportfiles'),(122,'Can change reportfiles',31,'change_reportfiles'),(123,'Can delete reportfiles',31,'delete_reportfiles'),(124,'Can view reportfiles',31,'view_reportfiles'),(125,'Can add socialhistory',32,'add_socialhistory'),(126,'Can change socialhistory',32,'change_socialhistory'),(127,'Can delete socialhistory',32,'delete_socialhistory'),(128,'Can view socialhistory',32,'view_socialhistory'),(129,'Can add symtomes',33,'add_symtomes'),(130,'Can change symtomes',33,'change_symtomes'),(131,'Can delete symtomes',33,'delete_symtomes'),(132,'Can view symtomes',33,'view_symtomes'),(133,'Can add testsresults',34,'add_testsresults'),(134,'Can change testsresults',34,'change_testsresults'),(135,'Can delete testsresults',34,'delete_testsresults'),(136,'Can view testsresults',34,'view_testsresults'),(137,'Can add vaccines',35,'add_vaccines'),(138,'Can change vaccines',35,'change_vaccines'),(139,'Can delete vaccines',35,'delete_vaccines'),(140,'Can view vaccines',35,'view_vaccines'),(141,'Can add visitreson',36,'add_visitreson'),(142,'Can change visitreson',36,'change_visitreson'),(143,'Can delete visitreson',36,'delete_visitreson'),(144,'Can view visitreson',36,'view_visitreson'),(145,'Can add vitals',37,'add_vitals'),(146,'Can change vitals',37,'change_vitals'),(147,'Can delete vitals',37,'delete_vitals'),(148,'Can view vitals',37,'view_vitals'),(149,'Can add user',38,'add_user'),(150,'Can change user',38,'change_user'),(151,'Can delete user',38,'delete_user'),(152,'Can view user',38,'view_user'),(153,'Can add usertypes',39,'add_usertypes'),(154,'Can change usertypes',39,'change_usertypes'),(155,'Can delete usertypes',39,'delete_usertypes'),(156,'Can view usertypes',39,'view_usertypes'),(157,'Can add doctors',40,'add_doctors'),(158,'Can change doctors',40,'change_doctors'),(159,'Can delete doctors',40,'delete_doctors'),(160,'Can view doctors',40,'view_doctors'),(161,'Can add profile',41,'add_profile'),(162,'Can change profile',41,'change_profile'),(163,'Can delete profile',41,'delete_profile'),(164,'Can view profile',41,'view_profile'),(165,'Can add patient',42,'add_patient'),(166,'Can change patient',42,'change_patient'),(167,'Can delete patient',42,'delete_patient'),(168,'Can view patient',42,'view_patient'),(169,'Can add cbc',43,'add_cbc'),(170,'Can change cbc',43,'change_cbc'),(171,'Can delete cbc',43,'delete_cbc'),(172,'Can view cbc',43,'view_cbc'),(173,'Can add pharmacist',44,'add_pharmacist'),(174,'Can change pharmacist',44,'change_pharmacist'),(175,'Can delete pharmacist',44,'delete_pharmacist'),(176,'Can view pharmacist',44,'view_pharmacist'),(177,'Can add nurse',45,'add_nurse'),(178,'Can change nurse',45,'change_nurse'),(179,'Can delete nurse',45,'delete_nurse'),(180,'Can view nurse',45,'view_nurse'),(181,'Can add laboratorist',46,'add_laboratorist'),(182,'Can change laboratorist',46,'change_laboratorist'),(183,'Can delete laboratorist',46,'delete_laboratorist'),(184,'Can view laboratorist',46,'view_laboratorist'),(185,'Can add appointment',47,'add_appointment'),(186,'Can change appointment',47,'change_appointment'),(187,'Can delete appointment',47,'delete_appointment'),(188,'Can view appointment',47,'view_appointment'),(189,'Can add block slots',48,'add_blockslots'),(190,'Can change block slots',48,'change_blockslots'),(191,'Can delete block slots',48,'delete_blockslots'),(192,'Can view block slots',48,'view_blockslots'),(193,'Can add doctor slots',49,'add_doctorslots'),(194,'Can change doctor slots',49,'change_doctorslots'),(195,'Can delete doctor slots',49,'delete_doctorslots'),(196,'Can view doctor slots',49,'view_doctorslots'),(197,'Can add bill',50,'add_bill'),(198,'Can change bill',50,'change_bill'),(199,'Can delete bill',50,'delete_bill'),(200,'Can view bill',50,'view_bill'),(201,'Can add bill group',51,'add_billgroup'),(202,'Can change bill group',51,'change_billgroup'),(203,'Can delete bill group',51,'delete_billgroup'),(204,'Can view bill group',51,'view_billgroup'),(205,'Can add consultfee',52,'add_consultfee'),(206,'Can change consultfee',52,'change_consultfee'),(207,'Can delete consultfee',52,'delete_consultfee'),(208,'Can view consultfee',52,'view_consultfee'),(209,'Can add consultion',53,'add_consultion'),(210,'Can change consultion',53,'change_consultion'),(211,'Can delete consultion',53,'delete_consultion'),(212,'Can view consultion',53,'view_consultion'),(213,'Can add customer type',54,'add_customertype'),(214,'Can change customer type',54,'change_customertype'),(215,'Can delete customer type',54,'delete_customertype'),(216,'Can view customer type',54,'view_customertype'),(217,'Can add medication name',55,'add_medicationname'),(218,'Can change medication name',55,'change_medicationname'),(219,'Can delete medication name',55,'delete_medicationname'),(220,'Can view medication name',55,'view_medicationname'),(221,'Can add medicine',56,'add_medicine'),(222,'Can change medicine',56,'change_medicine'),(223,'Can delete medicine',56,'delete_medicine'),(224,'Can view medicine',56,'view_medicine'),(225,'Can add medicine category',57,'add_medicinecategory'),(226,'Can change medicine category',57,'change_medicinecategory'),(227,'Can delete medicine category',57,'delete_medicinecategory'),(228,'Can view medicine category',57,'view_medicinecategory'),(229,'Can add medicine sale',58,'add_medicinesale'),(230,'Can change medicine sale',58,'change_medicinesale'),(231,'Can delete medicine sale',58,'delete_medicinesale'),(232,'Can view medicine sale',58,'view_medicinesale'),(233,'Can add medicine store location',59,'add_medicinestorelocation'),(234,'Can change medicine store location',59,'change_medicinestorelocation'),(235,'Can delete medicine store location',59,'delete_medicinestorelocation'),(236,'Can view medicine store location',59,'view_medicinestorelocation'),(237,'Can add payment option',60,'add_paymentoption'),(238,'Can change payment option',60,'change_paymentoption'),(239,'Can delete payment option',60,'delete_paymentoption'),(240,'Can view payment option',60,'view_paymentoption'),(241,'Can add purchase tax option',61,'add_purchasetaxoption'),(242,'Can change purchase tax option',61,'change_purchasetaxoption'),(243,'Can delete purchase tax option',61,'delete_purchasetaxoption'),(244,'Can view purchase tax option',61,'view_purchasetaxoption'),(245,'Can add supplier',62,'add_supplier'),(246,'Can change supplier',62,'change_supplier'),(247,'Can delete supplier',62,'delete_supplier'),(248,'Can view supplier',62,'view_supplier'),(249,'Can add purchase order',63,'add_purchaseorder'),(250,'Can change purchase order',63,'change_purchaseorder'),(251,'Can delete purchase order',63,'delete_purchaseorder'),(252,'Can view purchase order',63,'view_purchaseorder'),(253,'Can add medicine sales list',64,'add_medicinesaleslist'),(254,'Can change medicine sales list',64,'change_medicinesaleslist'),(255,'Can delete medicine sales list',64,'delete_medicinesaleslist'),(256,'Can view medicine sales list',64,'view_medicinesaleslist'),(257,'Can add medication strength',65,'add_medicationstrength'),(258,'Can change medication strength',65,'change_medicationstrength'),(259,'Can delete medication strength',65,'delete_medicationstrength'),(260,'Can view medication strength',65,'view_medicationstrength'),(261,'Can add medication ndc',66,'add_medicationndc'),(262,'Can change medication ndc',66,'change_medicationndc'),(263,'Can delete medication ndc',66,'delete_medicationndc'),(264,'Can view medication ndc',66,'view_medicationndc'),(265,'Can add add medicine from db',67,'add_addmedicinefromdb'),(266,'Can change add medicine from db',67,'change_addmedicinefromdb'),(267,'Can delete add medicine from db',67,'delete_addmedicinefromdb'),(268,'Can view add medicine from db',67,'view_addmedicinefromdb'),(269,'Can add department',68,'add_department'),(270,'Can change department',68,'change_department'),(271,'Can delete department',68,'delete_department'),(272,'Can view department',68,'view_department'),(273,'Can add product',69,'add_product'),(274,'Can change product',69,'change_product'),(275,'Can delete product',69,'delete_product'),(276,'Can view product',69,'view_product'),(277,'Can add product category',70,'add_productcategory'),(278,'Can change product category',70,'change_productcategory'),(279,'Can delete product category',70,'delete_productcategory'),(280,'Can view product category',70,'view_productcategory'),(281,'Can add vendor',71,'add_vendor'),(282,'Can change vendor',71,'change_vendor'),(283,'Can delete vendor',71,'delete_vendor'),(284,'Can view vendor',71,'view_vendor'),(285,'Can add purchase order',72,'add_purchaseorder'),(286,'Can change purchase order',72,'change_purchaseorder'),(287,'Can delete purchase order',72,'delete_purchaseorder'),(288,'Can view purchase order',72,'view_purchaseorder'),(289,'Can add productlist',73,'add_productlist'),(290,'Can change productlist',73,'change_productlist'),(291,'Can delete productlist',73,'delete_productlist'),(292,'Can view productlist',73,'view_productlist'),(293,'Can add floor',74,'add_floor'),(294,'Can change floor',74,'change_floor'),(295,'Can delete floor',74,'delete_floor'),(296,'Can view floor',74,'view_floor'),(297,'Can add room type',75,'add_roomtype'),(298,'Can change room type',75,'change_roomtype'),(299,'Can delete room type',75,'delete_roomtype'),(300,'Can view room type',75,'view_roomtype'),(301,'Can add wards',76,'add_wards'),(302,'Can change wards',76,'change_wards'),(303,'Can delete wards',76,'delete_wards'),(304,'Can view wards',76,'view_wards'),(305,'Can add room table',77,'add_roomtable'),(306,'Can change room table',77,'change_roomtable'),(307,'Can delete room table',77,'delete_roomtable'),(308,'Can view room table',77,'view_roomtable'),(309,'Can add floor ward table',78,'add_floorwardtable'),(310,'Can change floor ward table',78,'change_floorwardtable'),(311,'Can delete floor ward table',78,'delete_floorwardtable'),(312,'Can view floor ward table',78,'view_floorwardtable'),(313,'Can add bed table',79,'add_bedtable'),(314,'Can change bed table',79,'change_bedtable'),(315,'Can delete bed table',79,'delete_bedtable'),(316,'Can view bed table',79,'view_bedtable'),(317,'Can add prescription',80,'add_prescription'),(318,'Can change prescription',80,'change_prescription'),(319,'Can delete prescription',80,'delete_prescription'),(320,'Can view prescription',80,'view_prescription');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_bill`
--

DROP TABLE IF EXISTS `billing_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_bill` (
  `billid` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`billid`),
  KEY `billing_bill_appointment_id_fefba673_fk_appointme` (`appointment_id`),
  KEY `billing_bill_group_id_15aef316_fk_billing_billgroup_id` (`group_id`),
  CONSTRAINT `billing_bill_appointment_id_fefba673_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `billing_bill_group_id_15aef316_fk_billing_billgroup_id` FOREIGN KEY (`group_id`) REFERENCES `billing_billgroup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_bill`
--

LOCK TABLES `billing_bill` WRITE;
/*!40000 ALTER TABLE `billing_bill` DISABLE KEYS */;
INSERT INTO `billing_bill` VALUES ('LHMR-None-000001',NULL,NULL,NULL),('LHMR-None-000002',NULL,NULL,NULL),('LHMR-None-000003',NULL,NULL,NULL),('LHMR-None-000004',NULL,NULL,NULL),('LHMR-None-000005',NULL,NULL,NULL),('LHMR-None-000006',NULL,NULL,NULL),('LHMR-None-000007',NULL,NULL,NULL);
/*!40000 ALTER TABLE `billing_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_billgroup`
--

DROP TABLE IF EXISTS `billing_billgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_billgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_billgroup`
--

LOCK TABLES `billing_billgroup` WRITE;
/*!40000 ALTER TABLE `billing_billgroup` DISABLE KEYS */;
INSERT INTO `billing_billgroup` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `billing_billgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_consultfee`
--

DROP TABLE IF EXISTS `billing_consultfee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_consultfee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `generate_date` varchar(300) DEFAULT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_consultfee_doctor_id_67711db3_fk_usermanagement_user_id` (`doctor_id`),
  KEY `billing_consultfee_patient_id_0ced83e4_fk_usermanag` (`patient_id`),
  CONSTRAINT `billing_consultfee_doctor_id_67711db3_fk_usermanagement_user_id` FOREIGN KEY (`doctor_id`) REFERENCES `usermanagement_user` (`id`),
  CONSTRAINT `billing_consultfee_patient_id_0ced83e4_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_consultfee`
--

LOCK TABLES `billing_consultfee` WRITE;
/*!40000 ALTER TABLE `billing_consultfee` DISABLE KEYS */;
INSERT INTO `billing_consultfee` VALUES (1,2000,1,'',3,'LHMR-00-00000001');
/*!40000 ALTER TABLE `billing_consultfee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_consultion`
--

DROP TABLE IF EXISTS `billing_consultion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_consultion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_consultion_appointment_id_e79ec64e_fk_appointme` (`appointment_id`),
  CONSTRAINT `billing_consultion_appointment_id_e79ec64e_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_consultion`
--

LOCK TABLES `billing_consultion` WRITE;
/*!40000 ALTER TABLE `billing_consultion` DISABLE KEYS */;
INSERT INTO `billing_consultion` VALUES (1,666,0,'2019-11-03 10:04:36.395862',1),(2,666,0,'2019-11-03 10:07:31.314003',1),(3,666,0,'2019-11-03 10:07:47.100711',1),(4,1000,0,'2019-11-03 10:07:56.725357',1),(5,1000,0,'2019-11-04 03:49:13.606329',4);
/*!40000 ALTER TABLE `billing_consultion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_bedtable`
--

DROP TABLE IF EXISTS `bms_bedtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bms_bedtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bedNum` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `roomid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bms_bedtable_roomid_id_f97781a6_fk_bms_roomtable_id` (`roomid_id`),
  CONSTRAINT `bms_bedtable_roomid_id_f97781a6_fk_bms_roomtable_id` FOREIGN KEY (`roomid_id`) REFERENCES `bms_roomtable` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_bedtable`
--

LOCK TABLES `bms_bedtable` WRITE;
/*!40000 ALTER TABLE `bms_bedtable` DISABLE KEYS */;
INSERT INTO `bms_bedtable` VALUES (1,'101a',1,1),(2,'101b',1,1);
/*!40000 ALTER TABLE `bms_bedtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_floor`
--

DROP TABLE IF EXISTS `bms_floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bms_floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FloorNum` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_floor`
--

LOCK TABLES `bms_floor` WRITE;
/*!40000 ALTER TABLE `bms_floor` DISABLE KEYS */;
INSERT INTO `bms_floor` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `bms_floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_floorwardtable`
--

DROP TABLE IF EXISTS `bms_floorwardtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bms_floorwardtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `floorid_id` int(11) DEFAULT NULL,
  `wardid_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bms_floorwardtable_floorid_id_b32a95ea_fk_bms_floor_id` (`floorid_id`),
  KEY `bms_floorwardtable_wardid_id_a1236176_fk_bms_wards_id` (`wardid_id`),
  CONSTRAINT `bms_floorwardtable_floorid_id_b32a95ea_fk_bms_floor_id` FOREIGN KEY (`floorid_id`) REFERENCES `bms_floor` (`id`),
  CONSTRAINT `bms_floorwardtable_wardid_id_a1236176_fk_bms_wards_id` FOREIGN KEY (`wardid_id`) REFERENCES `bms_wards` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_floorwardtable`
--

LOCK TABLES `bms_floorwardtable` WRITE;
/*!40000 ALTER TABLE `bms_floorwardtable` DISABLE KEYS */;
/*!40000 ALTER TABLE `bms_floorwardtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_roomtable`
--

DROP TABLE IF EXISTS `bms_roomtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bms_roomtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomNo` int(11) NOT NULL,
  `Price` double DEFAULT NULL,
  `floorId_id` int(11) DEFAULT NULL,
  `roomtypeId_id` int(11) DEFAULT NULL,
  `wardId_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roomNo` (`roomNo`),
  KEY `bms_roomtable_floorId_id_b4e7a408_fk_bms_floor_id` (`floorId_id`),
  KEY `bms_roomtable_roomtypeId_id_fb820a58_fk_bms_roomtype_id` (`roomtypeId_id`),
  KEY `bms_roomtable_wardId_id_7dd34efb_fk_bms_wards_id` (`wardId_id`),
  CONSTRAINT `bms_roomtable_floorId_id_b4e7a408_fk_bms_floor_id` FOREIGN KEY (`floorId_id`) REFERENCES `bms_floor` (`id`),
  CONSTRAINT `bms_roomtable_roomtypeId_id_fb820a58_fk_bms_roomtype_id` FOREIGN KEY (`roomtypeId_id`) REFERENCES `bms_roomtype` (`id`),
  CONSTRAINT `bms_roomtable_wardId_id_7dd34efb_fk_bms_wards_id` FOREIGN KEY (`wardId_id`) REFERENCES `bms_wards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_roomtable`
--

LOCK TABLES `bms_roomtable` WRITE;
/*!40000 ALTER TABLE `bms_roomtable` DISABLE KEYS */;
INSERT INTO `bms_roomtable` VALUES (1,101,250,1,1,1);
/*!40000 ALTER TABLE `bms_roomtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_roomtype`
--

DROP TABLE IF EXISTS `bms_roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bms_roomtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomtype` smallint(5) unsigned NOT NULL,
  `occutype` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_roomtype`
--

LOCK TABLES `bms_roomtype` WRITE;
/*!40000 ALTER TABLE `bms_roomtype` DISABLE KEYS */;
INSERT INTO `bms_roomtype` VALUES (1,2,'1');
/*!40000 ALTER TABLE `bms_roomtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bms_wards`
--

DROP TABLE IF EXISTS `bms_wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bms_wards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WardType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bms_wards`
--

LOCK TABLES `bms_wards` WRITE;
/*!40000 ALTER TABLE `bms_wards` DISABLE KEYS */;
INSERT INTO `bms_wards` VALUES (1,'general'),(2,'icu'),(3,'nicu');
/*!40000 ALTER TABLE `bms_wards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_usermanagement_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_usermanagement_user_id` FOREIGN KEY (`user_id`) REFERENCES `usermanagement_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(47,'appointments','appointment'),(48,'appointments','blockslots'),(49,'appointments','doctorslots'),(3,'auth','group'),(2,'auth','permission'),(50,'billing','bill'),(51,'billing','billgroup'),(52,'billing','consultfee'),(53,'billing','consultion'),(79,'bms','bedtable'),(74,'bms','floor'),(78,'bms','floorwardtable'),(77,'bms','roomtable'),(75,'bms','roomtype'),(76,'bms','wards'),(4,'contenttypes','contenttype'),(68,'inventory','department'),(69,'inventory','product'),(70,'inventory','productcategory'),(73,'inventory','productlist'),(72,'inventory','purchaseorder'),(71,'inventory','vendor'),(6,'patientmanagement','advancederivatives'),(7,'patientmanagement','alert'),(8,'patientmanagement','allerirs'),(9,'patientmanagement','amendments'),(10,'patientmanagement','cptcodes'),(11,'patientmanagement','cvxcodes'),(12,'patientmanagement','doctornote'),(13,'patientmanagement','familyhistory'),(14,'patientmanagement','goals'),(15,'patientmanagement','healthhistory'),(16,'patientmanagement','hspccodes'),(17,'patientmanagement','icd10pcscodes'),(18,'patientmanagement','icd10problemcodes'),(19,'patientmanagement','icdsymtomscodes'),(20,'patientmanagement','illnesssymtoms'),(21,'patientmanagement','inpatientdetails'),(22,'patientmanagement','labassigntest2'),(23,'patientmanagement','lioniccode'),(24,'patientmanagement','medicalcodesfordrug'),(25,'patientmanagement','medications'),(26,'patientmanagement','patientallert'),(27,'patientmanagement','patientproblems'),(28,'patientmanagement','patientstatus'),(80,'patientmanagement','prescription'),(29,'patientmanagement','procedure'),(30,'patientmanagement','referalls'),(31,'patientmanagement','reportfiles'),(32,'patientmanagement','socialhistory'),(33,'patientmanagement','symtomes'),(34,'patientmanagement','testsresults'),(35,'patientmanagement','vaccines'),(36,'patientmanagement','visitreson'),(37,'patientmanagement','vitals'),(67,'pharmacy','addmedicinefromdb'),(54,'pharmacy','customertype'),(55,'pharmacy','medicationname'),(66,'pharmacy','medicationndc'),(65,'pharmacy','medicationstrength'),(56,'pharmacy','medicine'),(57,'pharmacy','medicinecategory'),(58,'pharmacy','medicinesale'),(64,'pharmacy','medicinesaleslist'),(59,'pharmacy','medicinestorelocation'),(60,'pharmacy','paymentoption'),(63,'pharmacy','purchaseorder'),(61,'pharmacy','purchasetaxoption'),(62,'pharmacy','supplier'),(5,'sessions','session'),(43,'usermanagement','cbc'),(40,'usermanagement','doctors'),(46,'usermanagement','laboratorist'),(45,'usermanagement','nurse'),(42,'usermanagement','patient'),(44,'usermanagement','pharmacist'),(41,'usermanagement','profile'),(38,'usermanagement','user'),(39,'usermanagement','usertypes');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-03 05:34:50.024927'),(2,'contenttypes','0002_remove_content_type_name','2019-11-03 05:34:50.955980'),(3,'auth','0001_initial','2019-11-03 05:34:57.568358'),(4,'auth','0002_alter_permission_name_max_length','2019-11-03 05:35:00.525528'),(5,'auth','0003_alter_user_email_max_length','2019-11-03 05:35:00.599532'),(6,'auth','0004_alter_user_username_opts','2019-11-03 05:35:00.654535'),(7,'auth','0005_alter_user_last_login_null','2019-11-03 05:35:00.734540'),(8,'auth','0006_require_contenttypes_0002','2019-11-03 05:35:00.763541'),(9,'auth','0007_alter_validators_add_error_messages','2019-11-03 05:35:00.812544'),(10,'auth','0008_alter_user_username_max_length','2019-11-03 05:35:00.877548'),(11,'auth','0009_alter_user_last_name_max_length','2019-11-03 05:35:00.924550'),(12,'auth','0010_alter_group_name_max_length','2019-11-03 05:35:01.074559'),(13,'auth','0011_update_proxy_permissions','2019-11-03 05:35:01.119562'),(14,'usermanagement','0001_initial','2019-11-03 05:35:19.802630'),(15,'admin','0001_initial','2019-11-03 05:35:39.385750'),(16,'admin','0002_logentry_remove_auto_add','2019-11-03 05:35:41.205854'),(17,'admin','0003_logentry_add_action_flag_choices','2019-11-03 05:35:41.356863'),(18,'appointments','0001_initial','2019-11-03 05:35:42.655937'),(19,'appointments','0002_auto_20191103_1104','2019-11-03 05:35:46.358149'),(20,'billing','0001_initial','2019-11-03 05:35:53.193540'),(21,'billing','0002_auto_20191103_1104','2019-11-03 05:35:56.742743'),(22,'bms','0001_initial','2019-11-03 05:36:02.805090'),(23,'inventory','0001_initial','2019-11-03 05:36:13.488701'),(24,'patientmanagement','0001_initial','2019-11-03 05:37:04.137598'),(25,'patientmanagement','0002_auto_20191103_1104','2019-11-03 05:37:37.290494'),(26,'pharmacy','0001_initial','2019-11-03 05:38:37.660947'),(27,'sessions','0001_initial','2019-11-03 05:39:06.724609'),(28,'patientmanagement','0003_auto_20191103_1115','2019-11-03 05:45:53.421871'),(29,'appointments','0002_auto_20191103_1529','2019-11-03 09:59:58.730293'),(30,'billing','0002_auto_20191103_1529','2019-11-03 09:59:58.860293'),(31,'patientmanagement','0002_auto_20191103_1529','2019-11-03 09:59:58.970294');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('14cz4l1ndqd0rlgixx2q567dukwwnjvf','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-18 03:49:24.457001'),('1ddsug936rf2uijyuhlkmi5sq9s6uc8x','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 08:34:59.304237'),('4pfuiphmqh9qtdlrgzepb863okhtfrg2','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 07:55:55.697695'),('4xiuirkyrfwbt06fq8nh341j7b7cgafd','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 07:23:36.929127'),('e8vzg93k5dqc26gao8b97f9uv1vqt451','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 07:18:14.016912'),('fq4k25hquz1wenu5azhaqfb48ew9lu30','OGFjN2ZlOTExNDhjNjQyMjg0M2RiM2UwZWZmNjNkNmY4Y2ZmYWU5Njp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NTg3MzY4MTZiNDllODgwNTFmNDYyZTA3MjE4NmU1ZDRmOGVhMTgyIn0=','2019-11-17 06:03:03.840473'),('fxeyp2wb13bp4l6vgwobpgdzaghsjs88','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 09:05:27.906722'),('gctr8c7coqf33ybq58uia319ooh92rgp','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 08:24:47.505244'),('is66kspz3zyd9az31qra2ddddilpz5ru','MDJmODEzOTNmYmMyZTE1OTZiMzkxZTkzYWQ1YWViN2Q1M2I4NzQ3OTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2Njk0YmZmN2VmZGRiZDNmZDVkMDQ1MzM1NmY3ZGEwOWZlNTc2NjY4In0=','2019-11-17 10:17:57.241582'),('itpoxhuh6eiasgn11ey9cqwnyqwvnvz6','NjIwZmU4YWYwOTliZGEwODZjNTk3ZWIzYmI4NDljMzdlODcyYjI5NTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMjJmMWRmMDM5MmJiMmNiNTY0MGU2NzY0MjkwNWZmZDIyOTY5MDdkIn0=','2019-11-18 04:23:35.695119'),('l89l31v07cog98j93eqxlaxzkgbb9pgl','NjIwZmU4YWYwOTliZGEwODZjNTk3ZWIzYmI4NDljMzdlODcyYjI5NTp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlMjJmMWRmMDM5MmJiMmNiNTY0MGU2NzY0MjkwNWZmZDIyOTY5MDdkIn0=','2019-11-18 04:35:37.794420'),('qdrb8095jzrh2griodncxg5frzkmu7df','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 07:52:13.899147'),('wqgc93vi773q97nmron8ay7da68pv5rz','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 06:28:54.716375'),('zppr26rctlbrxc6noihv8j372axp2xf0','YWVjZGQ4NDBhZjA3YWRmNzA1ZTA4OGFkZGU4ZDJiYjM5ZGMwNjU1OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwNzZlZWU2OWExODJmODhhZjdlZTQwNmUxNTNmYjcxZjBiYjU5NzEwIn0=','2019-11-17 08:16:44.893205');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_department`
--

DROP TABLE IF EXISTS `inventory_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(255) NOT NULL,
  `contactName` varchar(255) NOT NULL,
  `phoneNumber` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `departmentName` (`departmentName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_department`
--

LOCK TABLES `inventory_department` WRITE;
/*!40000 ALTER TABLE `inventory_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_product`
--

DROP TABLE IF EXISTS `inventory_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `description` longtext,
  `price` decimal(10,2) NOT NULL,
  `productStatus` varchar(10) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_product_name_category_id_d22d54eb_uniq` (`name`,`category_id`),
  KEY `inventory_product_category_id_c907876e_fk_inventory` (`category_id`),
  CONSTRAINT `inventory_product_category_id_c907876e_fk_inventory` FOREIGN KEY (`category_id`) REFERENCES `inventory_productcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_product`
--

LOCK TABLES `inventory_product` WRITE;
/*!40000 ALTER TABLE `inventory_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_productcategory`
--

DROP TABLE IF EXISTS `inventory_productcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_productcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productCategory` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_productcategory`
--

LOCK TABLES `inventory_productcategory` WRITE;
/*!40000 ALTER TABLE `inventory_productcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_productcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_productlist`
--

DROP TABLE IF EXISTS `inventory_productlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_productlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned DEFAULT NULL,
  `productID_id` int(11) DEFAULT NULL,
  `purchaseorderid_id` int(11) DEFAULT NULL,
  `vendorID_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_productlis_productID_id_f706b4e9_fk_inventory` (`productID_id`),
  KEY `inventory_productlis_purchaseorderid_id_b8f6ccb8_fk_inventory` (`purchaseorderid_id`),
  KEY `inventory_productlis_vendorID_id_14110cb3_fk_inventory` (`vendorID_id`),
  CONSTRAINT `inventory_productlis_productID_id_f706b4e9_fk_inventory` FOREIGN KEY (`productID_id`) REFERENCES `inventory_product` (`id`),
  CONSTRAINT `inventory_productlis_purchaseorderid_id_b8f6ccb8_fk_inventory` FOREIGN KEY (`purchaseorderid_id`) REFERENCES `inventory_purchaseorder` (`id`),
  CONSTRAINT `inventory_productlis_vendorID_id_14110cb3_fk_inventory` FOREIGN KEY (`vendorID_id`) REFERENCES `inventory_vendor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_productlist`
--

LOCK TABLES `inventory_productlist` WRITE;
/*!40000 ALTER TABLE `inventory_productlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_productlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_purchaseorder`
--

DROP TABLE IF EXISTS `inventory_purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` datetime(6) DEFAULT NULL,
  `requestedDate` datetime(6) DEFAULT NULL,
  `remarks` longtext,
  `purchaseStatus` varchar(10) DEFAULT NULL,
  `requestedDepartment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inventory_purchaseor_requestedDepartment__0eaeec25_fk_inventory` (`requestedDepartment_id`),
  CONSTRAINT `inventory_purchaseor_requestedDepartment__0eaeec25_fk_inventory` FOREIGN KEY (`requestedDepartment_id`) REFERENCES `inventory_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_purchaseorder`
--

LOCK TABLES `inventory_purchaseorder` WRITE;
/*!40000 ALTER TABLE `inventory_purchaseorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_vendor`
--

DROP TABLE IF EXISTS `inventory_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phoneNumber` bigint(20) NOT NULL,
  `contactName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `remarks` longtext,
  `vendorStatus` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_vendor`
--

LOCK TABLES `inventory_vendor` WRITE;
/*!40000 ALTER TABLE `inventory_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_advancederivatives`
--

DROP TABLE IF EXISTS `patientmanagement_advancederivatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_advancederivatives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `derivatives` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_ad_patient_id_4ccce354_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_ad_patient_id_4ccce354_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_advancederivatives`
--

LOCK TABLES `patientmanagement_advancederivatives` WRITE;
/*!40000 ALTER TABLE `patientmanagement_advancederivatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_advancederivatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_alert`
--

DROP TABLE IF EXISTS `patientmanagement_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_alert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientalert` longtext NOT NULL,
  `visiabilitytype` varchar(20) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_al_patient_id_8d1026bb_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_al_patient_id_8d1026bb_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_alert`
--

LOCK TABLES `patientmanagement_alert` WRITE;
/*!40000 ALTER TABLE `patientmanagement_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_allerirs`
--

DROP TABLE IF EXISTS `patientmanagement_allerirs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_allerirs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alergytype` varchar(20) DEFAULT NULL,
  `allergien` varchar(80) DEFAULT NULL,
  `reaction` longtext,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_al_appointment_id_5ef272bd_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_al_patient_id_eb904db0_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_al_appointment_id_5ef272bd_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_al_patient_id_eb904db0_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_allerirs`
--

LOCK TABLES `patientmanagement_allerirs` WRITE;
/*!40000 ALTER TABLE `patientmanagement_allerirs` DISABLE KEYS */;
INSERT INTO `patientmanagement_allerirs` VALUES (1,'Drug Allergy','asd','ads','03-11-2019 01:22 PM',1,'LHMR-00-00000001'),(2,'Drug Allergy','dfs','sfdfsd','03-11-2019 01:51 PM',1,'LHMR-00-00000001'),(3,'Drug Allergy','jh','jbjh','03-11-2019 01:57 PM',1,'LHMR-00-00000001'),(4,'Drug Allergy','asa','ssa','03-11-2019 02:02 PM',1,'LHMR-00-00000001'),(5,'Drug Allergy','sad','dsa','03-11-2019 02:11 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_allerirs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_amendments`
--

DROP TABLE IF EXISTS `patientmanagement_amendments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_amendments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amendmentssource` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `statusdescription` varchar(150) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_am_patient_id_75b988e1_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_am_patient_id_75b988e1_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_amendments`
--

LOCK TABLES `patientmanagement_amendments` WRITE;
/*!40000 ALTER TABLE `patientmanagement_amendments` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_amendments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_cptcodes`
--

DROP TABLE IF EXISTS `patientmanagement_cptcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_cptcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coodes` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_cptcodes`
--

LOCK TABLES `patientmanagement_cptcodes` WRITE;
/*!40000 ALTER TABLE `patientmanagement_cptcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_cptcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_cvxcodes`
--

DROP TABLE IF EXISTS `patientmanagement_cvxcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_cvxcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_cvxcodes`
--

LOCK TABLES `patientmanagement_cvxcodes` WRITE;
/*!40000 ALTER TABLE `patientmanagement_cvxcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_cvxcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_doctornote`
--

DROP TABLE IF EXISTS `patientmanagement_doctornote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_doctornote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` varchar(150) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_do_appointment_id_69bdc934_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_do_patient_id_9a0f9557_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_do_appointment_id_69bdc934_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_do_patient_id_9a0f9557_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_doctornote`
--

LOCK TABLES `patientmanagement_doctornote` WRITE;
/*!40000 ALTER TABLE `patientmanagement_doctornote` DISABLE KEYS */;
INSERT INTO `patientmanagement_doctornote` VALUES (1,'dt','03-11-2019 03:05 PM',1,'LHMR-00-00000001'),(2,'fnfg','03-11-2019 03:05 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_doctornote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_familyhistory`
--

DROP TABLE IF EXISTS `patientmanagement_familyhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_familyhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relationtype` varchar(20) DEFAULT NULL,
  `description` longtext NOT NULL,
  `notes` longtext NOT NULL,
  `updtedon` datetime(6) NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_fa_appointment_id_33b4bf7a_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_fa_patient_id_becc11e9_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_fa_appointment_id_33b4bf7a_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_fa_patient_id_becc11e9_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_familyhistory`
--

LOCK TABLES `patientmanagement_familyhistory` WRITE;
/*!40000 ALTER TABLE `patientmanagement_familyhistory` DISABLE KEYS */;
INSERT INTO `patientmanagement_familyhistory` VALUES (1,'Mother','hgfghf','fhgfgh','2019-11-03 09:40:29.742436','03-11-2019 03:10 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_familyhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_goals`
--

DROP TABLE IF EXISTS `patientmanagement_goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_goals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(150) DEFAULT NULL,
  `fromdated` date NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_go_patient_id_743c494e_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_go_patient_id_743c494e_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_goals`
--

LOCK TABLES `patientmanagement_goals` WRITE;
/*!40000 ALTER TABLE `patientmanagement_goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_healthhistory`
--

DROP TABLE IF EXISTS `patientmanagement_healthhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_healthhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `notes` longtext NOT NULL,
  `updtedon` datetime(6) NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_he_patient_id_3d1b92d7_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_he_patient_id_3d1b92d7_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_healthhistory`
--

LOCK TABLES `patientmanagement_healthhistory` WRITE;
/*!40000 ALTER TABLE `patientmanagement_healthhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_healthhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_hspccodes`
--

DROP TABLE IF EXISTS `patientmanagement_hspccodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_hspccodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_hspccodes`
--

LOCK TABLES `patientmanagement_hspccodes` WRITE;
/*!40000 ALTER TABLE `patientmanagement_hspccodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_hspccodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_icd10pcscodes`
--

DROP TABLE IF EXISTS `patientmanagement_icd10pcscodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_icd10pcscodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_icd10pcscodes`
--

LOCK TABLES `patientmanagement_icd10pcscodes` WRITE;
/*!40000 ALTER TABLE `patientmanagement_icd10pcscodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_icd10pcscodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_icd10problemcodes`
--

DROP TABLE IF EXISTS `patientmanagement_icd10problemcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_icd10problemcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_icd10problemcodes`
--

LOCK TABLES `patientmanagement_icd10problemcodes` WRITE;
/*!40000 ALTER TABLE `patientmanagement_icd10problemcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_icd10problemcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_icdsymtomscodes`
--

DROP TABLE IF EXISTS `patientmanagement_icdsymtomscodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_icdsymtomscodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_icdsymtomscodes`
--

LOCK TABLES `patientmanagement_icdsymtomscodes` WRITE;
/*!40000 ALTER TABLE `patientmanagement_icdsymtomscodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_icdsymtomscodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_illnesssymtoms`
--

DROP TABLE IF EXISTS `patientmanagement_illnesssymtoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_illnesssymtoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symptoncode` varchar(50) DEFAULT NULL,
  `sysmtomdescription` longtext NOT NULL,
  `fromwhen` date NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_il_patient_id_7decebab_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_il_patient_id_7decebab_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_illnesssymtoms`
--

LOCK TABLES `patientmanagement_illnesssymtoms` WRITE;
/*!40000 ALTER TABLE `patientmanagement_illnesssymtoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_illnesssymtoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_inpatientdetails`
--

DROP TABLE IF EXISTS `patientmanagement_inpatientdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_inpatientdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admintdate` date NOT NULL,
  `dischargedate` date NOT NULL,
  `admissiontype` varchar(50) DEFAULT NULL,
  `dischargesummary` longtext NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_in_patient_id_294de23c_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_in_patient_id_294de23c_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_inpatientdetails`
--

LOCK TABLES `patientmanagement_inpatientdetails` WRITE;
/*!40000 ALTER TABLE `patientmanagement_inpatientdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_inpatientdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_labassigntest2`
--

DROP TABLE IF EXISTS `patientmanagement_labassigntest2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_labassigntest2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_group` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `codes` varchar(200) DEFAULT NULL,
  `cpt_code` varchar(200) DEFAULT NULL,
  `preferred_requiremen` varchar(200) DEFAULT NULL,
  `alternate_requirement` varchar(200) DEFAULT NULL,
  `transport_temperature` varchar(200) DEFAULT NULL,
  `methodology` varchar(200) DEFAULT NULL,
  `ref_range` varchar(200) DEFAULT NULL,
  `cost` varchar(200) DEFAULT NULL,
  `units` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_labassigntest2`
--

LOCK TABLES `patientmanagement_labassigntest2` WRITE;
/*!40000 ALTER TABLE `patientmanagement_labassigntest2` DISABLE KEYS */;
INSERT INTO `patientmanagement_labassigntest2` VALUES (1,'test','Acte Hepatitis Profile','2000','80074','10mL (5mL) 2013 Serm Separator Tbe  ','None','A=14days, R=30days, F=2months','Chemilmenescence','ref','333','mg/dl'),(2,'test','ABO Grop & RH Type','2037','86900, 86901','5mL (3mL) 2013 Pink Top Tbe','Lavendar (EDTA) Top Tbe','A=7days, R=7days','Hemaggltination','ref','333','mg/dl'),(3,'test','Acacia, IgE','T19   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','1mL','R=7days, F=30days','ImmnoCap','ref','333','ml'),(4,'test','Acte Hepatitis Profile','2000','80074','10mL (5mL) 2013 Serm Separator Tbe  ','None','A=14days, R=30days, F=2months','Chemilmenescence','ref','333','ml'),(5,'test','Adrenocorticotropic Hormone (ACTH)','1185','82024','1mL (0.5mL) 2013 Plasma EDTA (Frozen)','None','A=2hors, R=3hors, F=10weeks','Chemilminescence','ref','333',''),(6,'test','Affirm Vaginitis Profile','2019','87480, 87510, 87660','BD Affirm VPIII Transport Tbe','None','A=3days','DNA Probe','ref','333',''),(7,'test','Albmin','102','82040','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=2.5months, R=5months, F=4months','Spectrophotometry','ref','333',''),(8,'test','Alcohol (Ethanol), rine','107','80101','2mL (1mL) 2013 Random rine','None','A=72hors, R=7days, F=2months','Enzymatic','ref','333',''),(9,'test','Aldolase','CP2610   ','None','None','None','None','None','ref','333',''),(10,'test','Aldosterone/Renin Activity Ratio','AR0070073   ','None','None','None','None','None','ref','333',''),(11,'test','Alkaline Phosphatase','104','84075','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=2months','Kinetic Spectrophotometry','ref','333',''),(12,'test','Alkaline Phosphatase Ioenzymes','SRE154   ','84080, 84075','mL2013 Serm Separator Tbe  ','None','A = 7 days , R = 7 days , F = 14 days','None','ref','333',''),(13,'test','Allergen Profile 2013 Childhood, IgE','2424','86003xd715','5mL (3mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(14,'test','Allergen Profile 2013 Food, IgE','2423','86003xd712','5mL (3mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(15,'test','Allergen Profile 2013 Sothern Coastal CA Region, IgE','2422','86003xd724','5mL (3mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(16,'test','Allergen Profile 10- Sothwestern Grassland Region, IgE','2441','86003xd717','5mL (3mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(17,'test','Allergen Profile 17- Cascade Pacific Northwest, IgE','2439','86003xd717','5mL (3mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(18,'test','Allergen Resp. Pnl 12, Arid Sothwest Region','2428','86003 x18','Serm','None','Refrigerated','ImmnoCap','ref','333',''),(19,'test','Allergen Resp. Pnl 14, Central CA Valley Region','2426','86003 x21','Serm','None','Refrigerated','ImmnoCap','ref','333',''),(20,'test','Allergen Resp. Pnl 15, Intermontain West Region','2427','86003 x17','Serm','None','Refrigerated','ImmnoCap','ref','333',''),(21,'test','Allergen Resp. Pnl 16, Inland Northwest Region','2425','86003 x17','Serm','None','Refrigerated','ImmnoCap','ref','333',''),(22,'test','Allergen Resp. Profile 7 2013 Northern Midwest Region, IgE','2440','86003xd716','5mL (3mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(23,'test','Almond, IgE','F20   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(24,'test','Alpha Fetoprotein (AFP), Non Maternal','101','82105','3mL (1mL) 2013 Serm Separator Tbe  ','None','A= 5 Days, R=14 days, F=3 Months','Chemilmenescence','ref','333',''),(25,'test','Alpha-1- Antitrysin','CP4816   ','None','None','None','None','None','ref','333',''),(26,'test','ALT (SGPT)','199','84460','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=5days, R=7days, F=>7days','Kinetic Spectrophotometry','ref','333',''),(27,'test','Alternaria alternata, IgE','M6   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(28,'test','Amenorrhea Panel','2374','83001, 83002, 84146','Serm','None','Refrigerated','Chemilmenescence','ref','333',''),(29,'test','Ammonia','684','82140','2mL (2mL) 2013 Plasma EDTA (Frozen)','None','F=3weeks','Kinetic Spectrophotometry','ref','333',''),(30,'test','Amphetamines, rine, Qantitative','AR2010075   ','None','None','None','None','None','ref','333',''),(31,'test','Amylase','106','82150','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7days, R=1month','Kinetic Spectrophotometry','ref','333',''),(32,'test','Amylase, 24Hr rine','572','82150','24 Hr rine Container','None','A=2days, R=10days','Kinetic Spectrophotometry','ref','333',''),(33,'test','Amylase, Random rine','514','82150','3mL (1mL) 2013 Random rine','None','A=2days, R=10days','Kinetic Spectrophotometry','ref','333',''),(34,'test','ANA by IFA Screen w/o reflex','1339','86038','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=48hors, R=7days, F=2months','Mltiplex Flow Immnoassay','ref','333',''),(35,'test','ANA Panel Screen','3209','86038, 86225, 86235xd78','5mL (3mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','R=7days, F=30days','Mltiplex Flow Immnoassay','ref','333',''),(36,'test','ANA w/ Reflex to Lps Profile','3208','86038','Serm','None','Refrigerated','Mltiplex Flow Immnoassay','ref','333',''),(37,'test','ANCA-Associated Vasclitis Profile (ANCA/MPO/PR-3)With Reflex to ANCA Titer','AR2006480   ','None','None','None','None','None','ref','333',''),(38,'test','Anti-Mllerian Hormone','CP5786   ','82397','mL (0.5 mL) 2013Serm Separator Tbe  ','None','A = 3 days , R =5 days , F = 1 month','None','ref','333',''),(39,'test','Anti-Streptolysin O (ASO), Qantitative','229','86060','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=2days, R=8days, F=6months','Latex-Enhanced Immnotrbidmetric','ref','333',''),(40,'test','Antibody Screen (Indirect Coombs)','110','86850','3 x 5mL (3mL) 2013 Pink Top Tbe','3 x 5mL (3mL) 2013 Lavender (EDTA) Top Tbe','A=7days, R=7days','Solid Phase','ref','333',''),(41,'test','Antinclear Antibody (ANA) Screen by IFA','1261','86038','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=48hors, R=7days, F=2months','Mltiplex Flow Immnoassay','ref','333',''),(42,'test','Antinclear Antibody (ANA), Screen','109','86038','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=48hors, R=7days, F=2months','Mltiplex Flow Immnoassay','ref','333',''),(43,'test','Antithrombin III Activity','CP1490   ','None','None','None','None','None','ref','333',''),(44,'test','Apolipoprotein A1','337','82172','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=1day, R=8days, F=2months','Spectrophotometry','ref','333',''),(45,'test','Apolipoprotein A1/B/Ratio','3039','82172xd72','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=72hors, R=7days, F=2months','Spectrophotometry','ref','333',''),(46,'test','Apolipoprotein A1/B/Lipoprotein (a)','2420','82172xd72, 83695','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=72hors, R=7days, F=2months','Latex Enhanced Immnotrbidimetric, Spectrophotometry','ref','333',''),(47,'test','Apolipoprotein B','338','82172','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=1day, R=8days, F=2months','Spectrophotometry','ref','333',''),(48,'test','Apolipoprotein E Genotyping','SRX825   ','81401','4mL 2013 EDTA Whole Blood','None','R= 1 month','None','ref','333',''),(49,'test','Apple, IgE','F49   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(50,'test','Aspergills fmigats, IgE','M3   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(51,'test','Aspergills niger, IgE','M207   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(52,'test','AST & ALT','2306','84450, 84460','See Individal Components.','None','Refrigerated','Kinetic Spectrophotometry','ref','333',''),(53,'test','AST (SGOT)','198','84450','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=5days, R=7days, F=3months','Kinetic Spectrophotometry','ref','333',''),(54,'test','Areobasidim plllans, IgE','M12   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(55,'test','Avocado, IgE','F96   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(56,'test','Bacterial Vaginosis Speciation','478','87799xd73, 87512','ESwab','None','A=2 Weeks, R=2 Weeks, F=2 Weeks','RT-PCR','ref','333',''),(57,'test','Banana, IgE','F92   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(58,'test','Barley, IgE','F6   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(59,'test','Basic Metabolic Profile','2004','80048','7mL (3mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=2months','Spectrophotometry','ref','333',''),(60,'test','Basic Thyroid Profile','3237','84479, 84436','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','R=4days, F=2months','Chemilminescence','ref','333',''),(61,'test','BCR/ABL Qantitative by PCR','CB9110   ','None','None','None','None','None','ref','333',''),(62,'test','Beef, IgE','F27   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(63,'test','Bermda Grass, IgE','G2   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(64,'test','Beta 2-Glycoprotein I (GPI) Antibody, IgA','1256','86146','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','A=24hors, R=7days, F=30days','Mltiplex Flow Immnoassay','ref','333',''),(65,'test','Beta 2-Glycoprotein I (GPI) Antibody, IgG','1257','86146','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','A=72hors, R=7days, F=30days','Mltiplex Flow Immnoassay','ref','333',''),(66,'test','Beta 2-Glycoprotein I (GPI) Antibody, IgM','1258','86146','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','A=24hors, R=7days, F=30days','Mltiplex Flow Immnoassay','ref','333',''),(67,'test','Beta, HCG, Tmor Marker','206','84702','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=7days, R=7days, F=2months','Chemilminescence','ref','333',''),(68,'test','Beta-2-Glycoprotein I Antibodies, IgG, IgM & IgA','2496','86146 x3','Serm','None','Refrigerated','Mltiplex Flow Immnoassay','ref','333',''),(69,'test','Beta-2-Microgloblin','354','82232','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','R=3days, F=6months','Chemilminescence','ref','333',''),(70,'test','Bilirbin, Direct','136','82248','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=5days, R=7days, F=6months','Spectrophotometry','ref','333',''),(71,'test','Bilirbin, Total','114','82247','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=5days, R=7days, F=6months','Spectrophotometry','ref','333',''),(72,'test','Bilirbin, Total and Direct','2338','82247, 82248','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=5days, R=7days, F=3months','Spectrophotometry','ref','333',''),(73,'test','Biopsy (Gross & Microscopic Exam)','504','Call Laboratory for CPT Codes','Tisse in 10% formalin','None','Ambient','Biopsy','ref','333',''),(74,'test','Ble Mssel, IgE','F37   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(75,'test','BMP (Basic Metabolic Profile)','2004','80048','7mL (3mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=2months','Spectrophotometry','ref','333',''),(76,'test','Boron Qantitative, Serm or Plasma','AR0091330   ','None','None','None','None','None','ref','333',''),(77,'test','Box elder, IgE','T1   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(78,'test','Brazil Nt, IgE','F18   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(79,'test','BRCA1 AND BRCA2, COMP','SRW260   ','81162','5mL (3.0mL) 2013 EDTA Whole Blood','None','R= 28 days','None','ref','333',''),(80,'test','Brome Grass, IgE','G11   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(81,'test','Bckwheat, IgE','F11   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(82,'test','Bn & Creatinine','2383','84520, 82565','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=2months','Spectrophotometry','ref','333',''),(83,'test','BN (Blood rea Nitrogen)','115','84520','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=12months','Kinetic Spectrophotometry','ref','333',''),(84,'test','BN (Blood rea Nitrogen), 24Hr rine','573','84540','10 (1mL) mL aliqot of 24 Hr rine Container','None','A=2 Days, R= 1 Week, F= 1 Month','Kinetic Spectrophotometry','ref','333',''),(85,'test','BN (Blood rea Nitrogen), Random rine','513','84540','3mL (1mL) 2013 Random rine','None','A=2 Days, R= 1 Week, F= 1 Month','Kinetic Spectrophotometry','ref','333',''),(86,'test','NT- proBNP','912','83880','1mL (0.5mL) 2013Serm Separator Tbe  ','None','A= 3 Days, R= 6 Days, F=24months','Chemilminescence','ref','333',''),(87,'test','C-Peptide','336','84681','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=4hors, R=1day, F=1month','Immnoassay','ref','333',''),(88,'test','C-Reactive Protein (CRP), Inflammation','133','86140','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=11days, R=2months, F=3years','Latex-enhanced immnotrbidimetric','ref','333',''),(89,'test','C3 Complement','152','86160','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=4days, R= 8days','Chemilminescence','ref','333',''),(90,'test','C4 Complement','189','86160','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=2days, R=8days, F=3months','Chemilminescence','ref','333',''),(91,'test','CA 125','116','86304','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=8days, R=5 days, F= 24 Months','Chemilminescence','ref','333',''),(92,'test','CA 15-3','112','86300','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=2days, R=5 Days, F=3 Months','Chemilmenescence','ref','333',''),(93,'test','CA 19-9','118','86301','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=5 Days, R=14 Days, F=3 Months','Chemilmenescence','ref','333',''),(94,'test','CA 27.29','170','86300','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=8hors, R=48hors, F=30days','Chemilmenescence','ref','333',''),(95,'test','Cacao/Chocolate, IgE','F93   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(96,'test','Calcim, 24Hr rine','571','82340','10 (1mL) mL aliqot of 24 Hr rine Container','None','A=2days, R=4days, F=3weeks','Spectrophotometry','ref','333',''),(97,'test','Calcim, Ionized','CP2236   ','None','None','None','None','None','ref','333',''),(98,'test','Calcim, Random rine','512','82340','3mL (1mL) 2013 Random rine','None','A=2days, R=4days, F=3weeks','Spectrophotometry','ref','333',''),(99,'test','Calcim, Total','119','82310','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7days, R=21days, F=8months','Spectrophotometry','ref','333',''),(100,'test','Calcli (Stone) Analysis with Photo','AR2005231   ','None','None','None','None','None','ref','333',''),(101,'test','Calprotectin','SRF530   ','83993','5g (1g) 2013 Stool','None','R 10 days, F 1 Month','None','ref','333',''),(102,'test','Candida albicans Antibodies IgA, IgG, IgM','AR0095200   ','None','None','None','None','None','ref','333',''),(103,'test','Candida albicans, IgE','M5   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(104,'test','Candida Species, DNA','117','87480','BD Affirm VPIII Transport Tbe, ESwab','None','A=72hors','DNA Probe','ref','333',''),(105,'test','Candida Vaginitis Speciation','468','87481, 87481-59xd73','ESwab','None','A=2 Weeks, R=2 Weeks, F=2 Weeks','RT-PCR','ref','333',''),(106,'test','Carbamazepine (Tegretol)','355','80156','3mL (1mL) 2013 Plain Red Top Tbe','None','A=2days, R=7days, F=1month','Latex Enhanced Immnotrbidimetric','ref','333',''),(107,'test','Carcinoembryonic Antigen (CEA)','122','82378','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7 Days, R=14 Days, F=6 Months','Chemilmenescence','ref','333',''),(108,'test','Cardiolipin Antibodies, IgG & IgM','2494','86147 x2','Serm','None','Refrigerated','Mltiplex Flow Immnoassay','ref','333',''),(109,'test','Cardiolipin Antibodies, IgG, IgA, IgM','2495','86147 x3','Serm Separator Tbe  ','None','Refrigerated','Mltiplex Flow Immnoassay','ref','333',''),(110,'test','Cardiolipin Antibody, IgA','9514','86147','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=72hors, F=30days','EIA','ref','333',''),(111,'test','Cardiolipin Antibody, IgG','9512','86147','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=72hors, F=30days','EIA','ref','333',''),(112,'test','Cardiolipin Antibody, IgM','9513','86147','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=72hors, F=30days','EIA','ref','333',''),(113,'test','Carnitine, Free & Total (incldes Carnitine, Esterfied)','AR0080068   ','None','None','None','None','None','ref','333',''),(114,'test','Carrot, IgE','F31   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(115,'test','Cashew, IgE','F202   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(116,'test','Cat Dander, IgE','E1   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(117,'test','Catecholamines Fractionated (Epinephrine, Norepinephrine), Plasma','AR0080957   ','None','None','None','None','None','ref','333',''),(118,'test','Celery, IgE','F85   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(119,'test','Celiac Disease Profile','9509','83516xd73, 86255xd72','3mL (2mL) 2013 Serm Separator Tbe  ','None','A=24hors, R=7days, F=30days','EIA, IFA, Immnotrbidimetric','ref','333',''),(120,'test','Celiac Disease Profile w/ IgA','9511','83516xd73, 86255xd72, 82784','3mL (2mL) 2013 Serm Separator Tbe  ','None','A=24hors, R=7days, F=30days','EIA, IFA, Immnotrbidimetric','ref','333',''),(121,'test','Centromere B Atoantibodies, IgG','431','86235','5mL (3mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=48hors, R=7days, F=2months','Mltiplex Flow Immnoassay','ref','333',''),(122,'test','Cerloplasmin','CP4213   ','None','None','None','None','None','ref','333',''),(123,'test','Cheese, IgE','F81   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(124,'test','Cherry, IgE','F242   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(125,'test','Chicken Feathers, IgE','E85   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(126,'test','Chicken, IgE','F83   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(127,'test','Chlamydia & GC Panel #1','2013','87491, 87591','1mL,Random rine, Liqid PAP, BD ProbeTec Swab, ESwab','None','A=2months, R=2months, F=3months','Transcription Mediated Amplification (TMA)','ref','333',''),(128,'test','Chlamydia, RNA Amplified','317','87491','Random rine, Liqid Pap, BD ProbeTec Swab','None','A=60days, R=60days, F=3months','Transcription Mediated Amplification (TMA)','ref','333',''),(129,'test','Chlamydia/Gonorrhea, TMA, Simpleswab','CP5249   ','None','None','None','None','None','ref','333',''),(130,'test','Chloride','123','82435','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=14days, R=14days','Ion Selective Electrode (ISE)','ref','333',''),(131,'test','Chloride, 24 Hr rine','577','82436','10 (1mL) mL aliqot of 24 Hr rine Container','None','A= 1 Week, R= 1 Week, F= 1 Month','Ion Selective Electrode (ISE)','ref','333',''),(132,'test','Chloride, Random rine','518','82436','3mL (1mL) 2013 Random rine','None','A= 1 Week, R= 1 Week, F= 1 Month','Ion Selective Electrode (ISE)','ref','333',''),(133,'test','Cholesterol, Total','124','82465','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=3months','Spectrophotometry','ref','333',''),(134,'test','Chromatin Ab','397','86235','5mL (3mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=48hors, R=7days, F=2months','Mltiplex Flow Immnoassay','ref','333',''),(135,'test','Chromogranin A','AR0080469   ','None','None','None','None','None','ref','333',''),(136,'test','Cladosporim herbarm, IgE','M2   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(137,'test','Clam, IgE','F207   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(138,'test','Clostridim Difficile, DNA','313','87493','1 gram 2013 Fresh Stool','None','A=48hors, R=5days','DNA Amplification','ref','333',''),(139,'test','Clozapine','SRL133   ','80159','mL (0.5mL) 2013 Red Top Tbe','None',' A = 72 hors , R = 8 days , F = 30 month','None','ref','333',''),(140,'test','CMP (Comprehensive Metabolic Profile)','2005','80053','7mL (3mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=2months','Spectrophotemetry','ref','333',''),(141,'test','CO2 (Bicarbonate)','127','82374','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=40hors, R=7days','Kinetic Spectrophotometry','ref','333',''),(142,'test','Coccidioides Serology','2535','86331xd72','1mL 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A= 8 hors, R=7 days, F=1 month','Immnodiffsion','ref','333',''),(143,'test','Cocklebr, IgE','W13   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(144,'test','Cockroach, German IgE','I6   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(145,'test','Cocont, IgE','F36   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(146,'test','Codfish, IgE','F3   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(147,'test','Collagen Cross-Linked N-Telopeptide (NTX), rine','SRE702   ','82523','1mL (0.5mL) 2013 rine','None',' A = 7 days , R = 21 Days , F = 21 days','None','ref','333',''),(148,'test','Common Ragweed, IgE','W1   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(149,'test','Complement C3 & C4','3155','86160 x2','See Individal Components','None','Refrigerated','Kinetic Spectrophotometry','ref','333',''),(150,'test','Complete Blood Cont (CBC) w/ Atomated Diff','177','85025','3mL (1mL) 2013 Lavender (EDTA) Top Tbe','None','R=72hors','Electronic Cell Cont','ref','333',''),(151,'test','Complete Blood Cont (CBC) w/Manal Diff','121','85007, 85027','5mL (3mL) 2013 Lavender (EDTA) Top Tbe','None','A=3days, R=3days','Electronic cell cont','ref','333',''),(152,'test','Comprehensive Metabolic Profile','2005','80053','7mL (3mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=2months','Spectrophotemetry','ref','333',''),(153,'test','Comprehensive Vaginitis Cascade','456','87801, 87481-59, 87481-59,87661','ESwab x2','None','A=2 Weeks, R=2 Weeks, F=2 Weeks','RT-PCR','ref','333',''),(154,'test','Congenital Absence of the Vas Deferens, CFTR 139 Mtations','SRW140   ','81220, 81224','5mL (3mL)- EDTA Whole Blood','None','R =4 weeks','RT-PCR','ref','333',''),(155,'test','Copper, Serm/Plasma','CP4219   ','82525','2mL (0.5mL) 2013 Royal Ble Serm','Royal Ble EDTA','A = 48 hors , R = 14 days,F = 14 days','RT-PCR','ref','333',''),(156,'test','Corn (Maize), IgE','F8   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','Royal Ble EDTA','R=7days, F=30days','ImmnoCap','ref','333',''),(157,'test','Cortisol','234','82533','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=1day, R=4days, F=12months','Chemilminescence','ref','333',''),(158,'test','Cortisol Stimlating Test (4 Specimens)','2210','82533xd74','5mL (3mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','R=7days,F=2months','Chemilminescence','ref','333',''),(159,'test','Cortisol rine Free by LC-MC/MC','AR0097222   ','None','None','None','None','None','ref','333',''),(160,'test','Cortisol, A.M.','226','82533','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A= 1day, R=4days,F=12months','Chemilminescence','ref','333',''),(161,'test','Cortisol, P.M.','224','82533','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A= 1day, R=4days,F=12months','Chemilminescence','ref','333',''),(162,'test','Cottonwood, IgE','T14   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(163,'test','Cow Dander, IgE','E4   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(164,'test','Crab, IgE','F23   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(165,'test','Creatine Kinase (CK-MB)','237','82553','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','A=5hors, R=4days, F=3months','Chemilminescence','ref','333',''),(166,'test','Creatine Kinase (CPK), Total','125','82550','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=5days, R=7days, F=30days','Kinetic Spectrophotometry','ref','333',''),(167,'test','Creatinine','130','82565','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=3months','Spectrophotometry','ref','333',''),(168,'test','Creatinine Clearance','132','82575','3mL (1mL) 2013 Serm Separator Tbe   and 10 (1mL) mL aliqot of 24 Hr rine Container','None','A=7days, R=7days, F=2months','Spectrophotometry, Calclation','ref','333',''),(169,'test','Creatinine, 24 Hr rine','131','82570','10 (1mL) mL aliqot of 24 Hr rine Container','None','A=2days, R=6days, F=6months','Calclation','ref','333',''),(170,'test','rine Creatinine, Random','280','82570','3mL (1mL) 2013 Random rine','None','A=2days, R=6days, F=6months','Spectrophotometry','ref','333',''),(171,'test','Creatinine/Total Protein, 24 Hr rine','2380','82570, 84156','10 (1mL) mL aliqot of 24 Hr rine Container','None','A=7days, R=7days, F=30days','Spectrophotometry, Calclation','ref','333',''),(172,'test','Creatinine/Total Protein, Random rine','2379','82570, 84156','3mL (1mL) 2013 Random rine','None','R=7days, F=7days','Spectrophotometry','ref','333',''),(173,'test','Cryptococcal Antigen','CP3600CPT Code s  ','None','None','None','None','None','ref','333',''),(174,'test','Cryptococcs Antigen Screen with Reflex to Titer','Z9189   ','None','None','None','None','None','ref','333',''),(175,'test','Cryptosporidim AG','CP7051   ','None','None','None','None','None','ref','333',''),(176,'test','Cltivated Oat Pollen, IgE','G14   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(177,'test','Cltivated Rye, IgE','G12   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(178,'test','Cltre, Anaerobic','356','87075','Anaerobic Transport System (Rotine Non-Viral)','None','A=48hrs','Cltre','ref','333',''),(179,'test','Cltre, Beta Strep A Screen','1520','87081','Swab 2013 sorce throat, ESwab','None','Ambient','Cltre','ref','333',''),(180,'test','Cltre, Blood','248','87040','Adlts,Aerobic Bottle,8-10cc, Anaerobic Bottle 8-10cc, Pediatrics Peds Bottle,1-3cc','None','A=24hors','Cltre','ref','333',''),(181,'test','Cltre, Ear','249','87070','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(182,'test','Cltre, Eye','250','87070','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(183,'test','Cltre, Fngs Non-Blood or SKin','CP6077   ','None','None','None','None','None','ref','333',''),(184,'test','Cltre, GC','320','87081','Rotine Cltrette Swab','None','A=24hors','Cltre','ref','333',''),(185,'test','Cltre, Genital','252','87070','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(186,'test','Cltre, Genital w/ GC','2333','87070, 87081','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(187,'test','Cltre, Genital w/GC w/Rfx Sensi','3163','87070, 87081','Starswab/ Clear cltre swab, ESwab','None','Room Temperatre','None','ref','333',''),(188,'test','Cltre, Misc.','238','87070','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(189,'test','Cltre, MRSA','918','87070','Nasal Swab, ESwab','None','Ambient','Cltre','ref','333',''),(190,'test','Cltre, Mycoplasma/reaplasma','322','87109','M4 Transport Media/TM/rine','None','M4 Transport Media/Swab-R=7days, rine-R=48hors','Cltre','ref','333',''),(191,'test','Cltre, Nasal','268','87070','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(192,'test','Cltre, Sptm','255','87070','Sterile Transport Container','None','A=24hors','Cltre','ref','333',''),(193,'test','Cltre, Sterility','370','87070','Kilit Ampoles','Transport Swab','A=72hors','Cltre','ref','333',''),(194,'test','Cltre, Stool','256','87045, 87046xd74','2g of stool 2013 Cary-Blair Media','None','A=48hors, R=48hors','Cltre','ref','333',''),(195,'test','Cltre, Throat','257','87070','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(196,'test','Cltre, rine','258','87086','1mL 2013 Sterile Transport Container','BD Sterile rine Transport','R=24hors','Cltre','ref','333',''),(197,'test','Cltre, Vaginal','167','87070','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(198,'test','Cltre, Wond','260','87070','Rotine Cltrette Swab, ESwab','None','A=24hors','Cltre','ref','333',''),(199,'test','Cyclic Citrllinated Peptide (CCP) Antibodies, IgG','903','86200','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=8hors, R=7days, F=2months','Mltiplex Immnoassay','ref','333',''),(200,'test','Cystatin C','1254','82610','1mL2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=2years','Particle Enhanced Immnotrbidimetric','ref','333',''),(201,'test','Cystic Fibrosis 139','SRW139   ','81220','5mL 2013 EDTA Whole Blood','None','R = 1 month','None','ref','333',''),(202,'test','Cystic Fibrosis 39','SRW101   ','81220','5mL 2013 EDTA Whole Blood','None','R= 1 week','None','ref','333',''),(203,'test','Cytomegalovirs (CMV) Antibody, IgG','353','86644','3mL (1mL) 2013 Serm Separator Tbe  ','Plain Red Top Tbe','R=7days, F=2months','Chemilminescence','ref','333',''),(204,'test','Cytomegalovirs (CMV) Antibody, IgM','1338','86645','3mL (1mL) 2013 Serm Separator Tbe  ','3mL (1mL) 2013Plain Red Top Tbe','R=7days, F=30days','Mltiplex Flow Immnoassay','ref','333',''),(205,'test','Cytomegalovirs (CMV) PCR Qantitative','SR820   ','87497','3.0mL 2013 Lavender Top Tbe(EDTA)','None',' A = 72 hors , R = 8 days , F = 30 month','None','ref','333',''),(206,'test','Cytomegalovirs IgM Antibody','Z2486   ','None','None','None','None','None','ref','333',''),(207,'test','D-Dimer, Qantitative','1108','85379','1mL (0.5mL) Light Ble (sodim citrate) Top Tbe','None','A=4hors, R=4hors, F=30days','Clot Detection','ref','333',''),(208,'test','D. farinae, IgE','D2   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(209,'test','D. pteronyssins, IgE','D1   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(210,'test','Dandelion, IgE','W8   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(211,'test','Dehydroepiandrosterone (DHEA)','SRE487   ','82626','2mL (1mL) 2013 Serm Separator Tbe  ','None','A = 48 hors , R = 7 days , F = 30 days','ImmnoCap','ref','333',''),(212,'test','DHEA Slfate','215','82627','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=5days, R=14days, F=12months','Chemilmenescence','ref','333',''),(213,'test','Digoxin','134','80162','3mL (1mL) 2013 Plain Red Top Tbe','None','R=1day, F=2weeks','Latex-enhanced immnotrbidimetric','ref','333',''),(214,'test','Dihydrotestosterone','SRE569   ','None','mL (0.5mL) 2013 Serm Separator Tbe  ','None','A= 2 Hors , R= 1 Day , F= 1 Month','None','ref','333',''),(215,'test','Dilantin (Phenytoin)','135','80185','3mL (1mL) 2013 Plain Red Top Tbe','None','A=4days, R=4days, F=12months','Latex-enhanced immnotrbidimetric','ref','333',''),(216,'test','Direct LDL','137','83721','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=7days, F=12months','Spectrophotometry','ref','333',''),(217,'test','DNAse B Antibody','AR0050220   ','None','None','None','None','None','ref','333',''),(218,'test','Dog Dander, IgE','E5   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(219,'test','Drg Abse Screen','9180','80307','10mL (7mL) 2013 Random rine','None','R=7days','Lateral Flow Chromatographic Immnoassay and Enzymatic','ref','333',''),(220,'test','Drg Screen Panel w/o Alcohol, rine','2006','80307','10mL (7mL) 2013 Random rine','None','R=7days','Lateral Flow Chromatographic Immnoassay and Enzymatic','ref','333',''),(221,'test','Drg Screen w/Alcohol, rine','2007','80307','10mL (7mL) 2013 Random rine','None','R=7days','Lateral Flow Chromatographic Immnoassay and Enzymatic','ref','333',''),(222,'test','dsDNA Atoantibodies','396','86225','5mL (3mL) 2013 Serm Separator Tbe  ','None','A=48hors, R=7days, F=2months','Mltiplex Flow Immnoassay','ref','333',''),(223,'test','Dck Feathers, IgE','E86   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(224,'test','E. maynei, IgE','D74   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(225,'test','Egg (Whole), IgE','F245   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(226,'test','Egg White, IgE','F1   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(227,'test','Egg Yolk, IgE','F1   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(228,'test','Electrolytes Profile','2008','80051','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=7days, R=7days, F=2months','Ion Selective Electrode (ISE)','ref','333',''),(229,'test','Elm, IgE','T8   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(230,'test','Endomysial Atoantibodies, Screen','9504','86255','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','A=24hors, R=7days, F=30days','IFA','ref','333',''),(231,'test','Entamoeba histolytica Antigen Detection, Stool','CP5686   ','87337','1g 2013 Fresh Stool','None','R=48hrs','Immnoassay/spectrophotometry','ref','333',''),(232,'test','Entamoeba histolytica Antigen Detection, Stool','CP5686   ','None','None','None','None','None','ref','333',''),(233,'test','Eosinophil Cont, Random rine','409','87205','10mL (5mL) 2013 Random rine','None','R=72hors','Light Microscopy','ref','333',''),(234,'test','Eosinophil Cont, Whole Blood','900','85048, 85004','1mL 2013 Lavender (EDTA) Top Tbe','None','A=72hors, R=72hors','Atomated Cell Cont','ref','333',''),(235,'test','Epi proColon','SRX700   ','81327','7mL of Plasma (3.5mL minimm, does not allow for repeat testing)nsitable ,Specimen Ambient specimens,Hemolyzed samples, Serm, stool, or whole blood specimens','None','None','None','ref','333',''),(236,'test','Epicoccm prprascens, IgE','M14   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(237,'test','Epstein Barr Early Antigen IgG Ab (EBV-EA)','478','86663','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=7days, F=2months','Mltiplex Immnoassay','ref','333',''),(238,'test','Epstein Barr Nclear Antigen IgG Ab (EBV-NA)','479','86664','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=7days, F=2months','Mltiplex Immnoassay','ref','333',''),(239,'test','Epstein Barr VCA IgG Ab (EBV-VCA IgG)','480','86665','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=7days, F=2months','Mltiplex Immnoassay','ref','333',''),(240,'test','Epstein Barr VCA IgM Ab (EBV VCA-IgM)','481','86665','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=7days, F=2months','Mltiplex Immnoassay','ref','333',''),(241,'test','Epstein Barr Virs (EBV) Profile','2400','86663, 86664, 86665xd72','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=7days, F=2months','Mltiplex Immnoassay','ref','333',''),(242,'test','Epstein-Barr Virs (EBV), VCA IgG/M Ab','2442','86665 x 2','3mL (1mL) 2013 Serm Separator Tbe  ','None','R=7days, F=2months','Mltiplex Immnoassay','ref','333',''),(243,'test','Erythropoietin','CP4836   ','None','None','None','None','None','ref','333',''),(244,'test','Estradiol (E2)','138','82670','3mL (1mL) 2013 Serm Separator Tbe  ','None','A=1day, R=4days, F=6months','Chemilmenescence','ref','333',''),(245,'test','Estrogen Fractionated','SRE494   ','82671','mL (0.5mL) 2013 Serm Separator Tbe  ','None',' A= 2 Days , R= 7 Days , F 1 Month','None','ref','333',''),(246,'test','Estrone Slfate','SRE489   ','82679','mL (0.5mL) 2013 Serm Separator Tbe  ','None','A= 2 Days , R= 7 Days ,F= 1 Month','None','ref','333',''),(247,'test','Estrone, LC/MS/MS','SRE489   ','82679','mL (0.5mL) 2013 Serm Separator Tbe  ','None',' A= 2 Days , R= 7 Days , F= 1 Month','None','ref','333',''),(248,'test','Ecalypts, IgE','T18   ','86003','1mL (0.5mL) 2013 Serm Separator Tbe  ','None','R=7days, F=30days','ImmnoCap','ref','333',''),(249,'test','Factor II Mtation','SRW150   ','81240','5mL (1mL) 2013 Lavender (EDTA) Top Tbe','None','A=30days','None','ref','333',''),(250,'test','Factor V Leiden','SRI600   ','81241','5mL (1mL) 2013 Lavender (EDTA) Top Tbe','None','R= 7 Days','None','ref','333','');
/*!40000 ALTER TABLE `patientmanagement_labassigntest2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_lioniccode`
--

DROP TABLE IF EXISTS `patientmanagement_lioniccode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_lioniccode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codes` varchar(20) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_lioniccode`
--

LOCK TABLES `patientmanagement_lioniccode` WRITE;
/*!40000 ALTER TABLE `patientmanagement_lioniccode` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_lioniccode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_medicalcodesfordrug`
--

DROP TABLE IF EXISTS `patientmanagement_medicalcodesfordrug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_medicalcodesfordrug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(250) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_medicalcodesfordrug`
--

LOCK TABLES `patientmanagement_medicalcodesfordrug` WRITE;
/*!40000 ALTER TABLE `patientmanagement_medicalcodesfordrug` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_medicalcodesfordrug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_patientallert`
--

DROP TABLE IF EXISTS `patientmanagement_patientallert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_patientallert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientalert` longtext NOT NULL,
  `visiabilitytype` varchar(20) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_pa_patient_id_65df8074_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_pa_patient_id_65df8074_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_patientallert`
--

LOCK TABLES `patientmanagement_patientallert` WRITE;
/*!40000 ALTER TABLE `patientmanagement_patientallert` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_patientallert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_patientproblems`
--

DROP TABLE IF EXISTS `patientmanagement_patientproblems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_patientproblems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problems` varchar(500) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `fromdate` date NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_pa_appointment_id_f12d8a6a_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_pa_patient_id_59315c9a_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_pa_appointment_id_f12d8a6a_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_pa_patient_id_59315c9a_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_patientproblems`
--

LOCK TABLES `patientmanagement_patientproblems` WRITE;
/*!40000 ALTER TABLE `patientmanagement_patientproblems` DISABLE KEYS */;
INSERT INTO `patientmanagement_patientproblems` VALUES (1,'rew','rwe','1999-10-10','03-11-2019 02:56 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_patientproblems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_patientstatus`
--

DROP TABLE IF EXISTS `patientmanagement_patientstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_patientstatus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `healthstatus` varchar(150) DEFAULT NULL,
  `effectivedate` date NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_pa_patient_id_db5fb174_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_pa_patient_id_db5fb174_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_patientstatus`
--

LOCK TABLES `patientmanagement_patientstatus` WRITE;
/*!40000 ALTER TABLE `patientmanagement_patientstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientmanagement_patientstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_prescription`
--

DROP TABLE IF EXISTS `patientmanagement_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_prescription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `compositionName` varchar(50) DEFAULT NULL,
  `doesage` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `withfood` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `usageDirection` longtext NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `medicinname_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_pr_appointment_id_b8bde28c_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_pr_medicinname_id_a8604144_fk_pharmacy_` (`medicinname_id`),
  KEY `patientmanagement_pr_patient_id_3afe0d04_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_pr_appointment_id_b8bde28c_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_pr_medicinname_id_a8604144_fk_pharmacy_` FOREIGN KEY (`medicinname_id`) REFERENCES `pharmacy_medicine` (`id`),
  CONSTRAINT `patientmanagement_pr_patient_id_3afe0d04_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_prescription`
--

LOCK TABLES `patientmanagement_prescription` WRITE;
/*!40000 ALTER TABLE `patientmanagement_prescription` DISABLE KEYS */;
INSERT INTO `patientmanagement_prescription` VALUES (1,'kjhk','25mg','30','0-0-0-1','After food','30','ksnajk',1,1,'LHMR-00-00000001'),(2,'hkh','22','22','0-1-1-0','After food','30','ksdnfkj',1,1,'LHMR-00-00000001'),(3,'sm','25mg','30','1-0-1-1','Before food','30','sdjkj',4,1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_procedure`
--

DROP TABLE IF EXISTS `patientmanagement_procedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_procedure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `procedurecodetype` varchar(50) DEFAULT NULL,
  `procedurecode` varchar(500) DEFAULT NULL,
  `procedure` varchar(150) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_pr_appointment_id_10dfb3aa_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_pr_patient_id_05f2b9c9_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_pr_appointment_id_10dfb3aa_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_pr_patient_id_05f2b9c9_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_procedure`
--

LOCK TABLES `patientmanagement_procedure` WRITE;
/*!40000 ALTER TABLE `patientmanagement_procedure` DISABLE KEYS */;
INSERT INTO `patientmanagement_procedure` VALUES (1,'ICD-10-PCS','fsefsd','fsd',NULL,'03-11-2019 02:56 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_procedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_referalls`
--

DROP TABLE IF EXISTS `patientmanagement_referalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_referalls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorname` varchar(50) DEFAULT NULL,
  `doctorcontact` varchar(50) DEFAULT NULL,
  `doctoremail` varchar(254) DEFAULT NULL,
  `doctornote` varchar(50) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_re_appointment_id_0576591d_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_re_patient_id_6574417b_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_re_appointment_id_0576591d_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_re_patient_id_6574417b_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_referalls`
--

LOCK TABLES `patientmanagement_referalls` WRITE;
/*!40000 ALTER TABLE `patientmanagement_referalls` DISABLE KEYS */;
INSERT INTO `patientmanagement_referalls` VALUES (1,'dkj','hkjdhkj','kjhdkjh@gmail.com','kjkj','03-11-2019 03:09 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_referalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_reportfiles`
--

DROP TABLE IF EXISTS `patientmanagement_reportfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_reportfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filetype` varchar(50) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_re_appointment_id_d8742a26_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_re_patient_id_b572e824_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_re_appointment_id_d8742a26_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_re_patient_id_b572e824_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_reportfiles`
--

LOCK TABLES `patientmanagement_reportfiles` WRITE;
/*!40000 ALTER TABLE `patientmanagement_reportfiles` DISABLE KEYS */;
INSERT INTO `patientmanagement_reportfiles` VALUES (1,'Xray','sd','documents/11.PNG','04-11-2019 10:03 AM',4,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_reportfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_socialhistory`
--

DROP TABLE IF EXISTS `patientmanagement_socialhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_socialhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `social_type` varchar(20) DEFAULT NULL,
  `description` longtext NOT NULL,
  `fromwhen` date NOT NULL,
  `updtedon` datetime(6) NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_so_appointment_id_402ec4f1_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_so_patient_id_295ddf26_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_so_appointment_id_402ec4f1_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_so_patient_id_295ddf26_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_socialhistory`
--

LOCK TABLES `patientmanagement_socialhistory` WRITE;
/*!40000 ALTER TABLE `patientmanagement_socialhistory` DISABLE KEYS */;
INSERT INTO `patientmanagement_socialhistory` VALUES (1,'Smoking Status','hgfhgfgh','1999-10-16','2019-11-03 09:40:22.244826','03-11-2019 03:10 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_socialhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_symtomes`
--

DROP TABLE IF EXISTS `patientmanagement_symtomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_symtomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icdcod` varchar(500) DEFAULT NULL,
  `symtomdescription` varchar(500) DEFAULT NULL,
  `fromdated` date NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_sy_appointment_id_7f5fd4d8_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_sy_patient_id_3f7c03e7_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_sy_appointment_id_7f5fd4d8_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_sy_patient_id_3f7c03e7_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_symtomes`
--

LOCK TABLES `patientmanagement_symtomes` WRITE;
/*!40000 ALTER TABLE `patientmanagement_symtomes` DISABLE KEYS */;
INSERT INTO `patientmanagement_symtomes` VALUES (1,NULL,'fgfg','1993-10-10','03-11-2019 02:55 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_symtomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_testsresults`
--

DROP TABLE IF EXISTS `patientmanagement_testsresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_testsresults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result` varchar(50) DEFAULT NULL,
  `notes` longtext NOT NULL,
  `ispaid` tinyint(1) NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `testcode` varchar(200) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `test_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_te_appointment_id_34f26101_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_te_patient_id_24a52392_fk_usermanag` (`patient_id`),
  KEY `patientmanagement_te_test_id_id_982d756d_fk_patientma` (`test_id_id`),
  CONSTRAINT `patientmanagement_te_appointment_id_34f26101_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_te_patient_id_24a52392_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`),
  CONSTRAINT `patientmanagement_te_test_id_id_982d756d_fk_patientma` FOREIGN KEY (`test_id_id`) REFERENCES `patientmanagement_labassigntest2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_testsresults`
--

LOCK TABLES `patientmanagement_testsresults` WRITE;
/*!40000 ALTER TABLE `patientmanagement_testsresults` DISABLE KEYS */;
INSERT INTO `patientmanagement_testsresults` VALUES (1,NULL,'sdfsd',0,'Date : 03-11-2019  Time : 15:01:51','ABO Grop & RH Type',1,'LHMR-00-00000001',2),(2,NULL,'sds',0,'Date : 03-11-2019  Time : 15:02:15','ABO Grop & RH Type',1,'LHMR-00-00000001',2);
/*!40000 ALTER TABLE `patientmanagement_testsresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_vaccines`
--

DROP TABLE IF EXISTS `patientmanagement_vaccines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_vaccines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `takendate` date NOT NULL,
  `vaccinecode` longtext NOT NULL,
  `notes` longtext NOT NULL,
  `v_status` varchar(20) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_va_appointment_id_e3139231_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_va_patient_id_780a40a9_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_va_appointment_id_e3139231_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_va_patient_id_780a40a9_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_vaccines`
--

LOCK TABLES `patientmanagement_vaccines` WRITE;
/*!40000 ALTER TABLE `patientmanagement_vaccines` DISABLE KEYS */;
INSERT INTO `patientmanagement_vaccines` VALUES (1,'2019-11-10','as','saasa',NULL,'03-11-2019 02:48 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_vaccines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_visitreson`
--

DROP TABLE IF EXISTS `patientmanagement_visitreson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_visitreson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(150) DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_vi_appointment_id_fa7ed653_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_vi_patient_id_50d66570_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_vi_appointment_id_fa7ed653_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_vi_patient_id_50d66570_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_visitreson`
--

LOCK TABLES `patientmanagement_visitreson` WRITE;
/*!40000 ALTER TABLE `patientmanagement_visitreson` DISABLE KEYS */;
INSERT INTO `patientmanagement_visitreson` VALUES (1,'wer','03-11-2019 02:55 PM',1,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_visitreson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientmanagement_vitals`
--

DROP TABLE IF EXISTS `patientmanagement_vitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientmanagement_vitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weight` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `height_inch` double DEFAULT NULL,
  `heartrate` double DEFAULT NULL,
  `temprature` double DEFAULT NULL,
  `oxisaturation` double DEFAULT NULL,
  `diastolicbp` double DEFAULT NULL,
  `systolicbp` double DEFAULT NULL,
  `glucose` double DEFAULT NULL,
  `resporitoryrate` double DEFAULT NULL,
  `bmi` double DEFAULT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `patientmanagement_vi_appointment_id_8757363a_fk_appointme` (`appointment_id`),
  KEY `patientmanagement_vi_patient_id_148cdd1a_fk_usermanag` (`patient_id`),
  CONSTRAINT `patientmanagement_vi_appointment_id_8757363a_fk_appointme` FOREIGN KEY (`appointment_id`) REFERENCES `appointments_appointment` (`id`),
  CONSTRAINT `patientmanagement_vi_patient_id_148cdd1a_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientmanagement_vitals`
--

LOCK TABLES `patientmanagement_vitals` WRITE;
/*!40000 ALTER TABLE `patientmanagement_vitals` DISABLE KEYS */;
INSERT INTO `patientmanagement_vitals` VALUES (1,65,5,7,75,37,100,85,123,66,28,NULL,'04-11-2019 09:54 AM',4,'LHMR-00-00000001'),(2,65,6,2,766,37,100,85,34,6,6,NULL,'04-11-2019 10:01 AM',4,'LHMR-00-00000001'),(3,65,6,1,879,7,898,879,878,87,78,NULL,'04-11-2019 10:06 AM',4,'LHMR-00-00000001');
/*!40000 ALTER TABLE `patientmanagement_vitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_addmedicinefromdb`
--

DROP TABLE IF EXISTS `pharmacy_addmedicinefromdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_addmedicinefromdb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned DEFAULT NULL,
  `expiryDate` datetime(6) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `name_id` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pharmacy_addmedicine_category_id_44babb80_fk_pharmacy_` (`category_id`),
  KEY `pharmacy_addmedicine_location_id_81860686_fk_pharmacy_` (`location_id`),
  KEY `pharmacy_addmedicine_name_id_78ae23f6_fk_pharmacy_` (`name_id`),
  KEY `pharmacy_addmedicine_supplier_id_54030bea_fk_pharmacy_` (`supplier_id`),
  CONSTRAINT `pharmacy_addmedicine_category_id_44babb80_fk_pharmacy_` FOREIGN KEY (`category_id`) REFERENCES `pharmacy_medicinecategory` (`id`),
  CONSTRAINT `pharmacy_addmedicine_location_id_81860686_fk_pharmacy_` FOREIGN KEY (`location_id`) REFERENCES `pharmacy_medicinestorelocation` (`id`),
  CONSTRAINT `pharmacy_addmedicine_name_id_78ae23f6_fk_pharmacy_` FOREIGN KEY (`name_id`) REFERENCES `pharmacy_medicationname` (`name`),
  CONSTRAINT `pharmacy_addmedicine_supplier_id_54030bea_fk_pharmacy_` FOREIGN KEY (`supplier_id`) REFERENCES `pharmacy_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_addmedicinefromdb`
--

LOCK TABLES `pharmacy_addmedicinefromdb` WRITE;
/*!40000 ALTER TABLE `pharmacy_addmedicinefromdb` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_addmedicinefromdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_customertype`
--

DROP TABLE IF EXISTS `pharmacy_customertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_customertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_customertype`
--

LOCK TABLES `pharmacy_customertype` WRITE;
/*!40000 ALTER TABLE `pharmacy_customertype` DISABLE KEYS */;
INSERT INTO `pharmacy_customertype` VALUES (1,'out-patient'),(2,'walk-in patient');
/*!40000 ALTER TABLE `pharmacy_customertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_medicationname`
--

DROP TABLE IF EXISTS `pharmacy_medicationname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_medicationname` (
  `name` varchar(255) NOT NULL,
  `active_substances` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicationname`
--

LOCK TABLES `pharmacy_medicationname` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicationname` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_medicationname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_medicationndc`
--

DROP TABLE IF EXISTS `pharmacy_medicationndc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_medicationndc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ndc` varchar(12) NOT NULL,
  `manufacturer` varchar(255) NOT NULL,
  `medication_strength_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ndc` (`ndc`),
  KEY `pharmacy_medicationn_medication_strength__403eec0d_fk_pharmacy_` (`medication_strength_id`),
  KEY `pharmacy_medicationndc_manufacturer_b655c837` (`manufacturer`),
  CONSTRAINT `pharmacy_medicationn_medication_strength__403eec0d_fk_pharmacy_` FOREIGN KEY (`medication_strength_id`) REFERENCES `pharmacy_medicationstrength` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicationndc`
--

LOCK TABLES `pharmacy_medicationndc` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicationndc` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_medicationndc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_medicationstrength`
--

DROP TABLE IF EXISTS `pharmacy_medicationstrength`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_medicationstrength` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strength` longtext NOT NULL,
  `medication_name_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pharmacy_medications_medication_name_id_b4c10715_fk_pharmacy_` (`medication_name_id`),
  CONSTRAINT `pharmacy_medications_medication_name_id_b4c10715_fk_pharmacy_` FOREIGN KEY (`medication_name_id`) REFERENCES `pharmacy_medicationname` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicationstrength`
--

LOCK TABLES `pharmacy_medicationstrength` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicationstrength` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_medicationstrength` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_medicine`
--

DROP TABLE IF EXISTS `pharmacy_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `batchNumber` varchar(255) DEFAULT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `expiryDate` datetime(6) DEFAULT NULL,
  `genericName` varchar(255) NOT NULL,
  `medicineDetails` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `referenceLink` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pharmacy_medicine_name_category_id_662a069a_uniq` (`name`,`category_id`),
  KEY `pharmacy_medicine_category_id_f73b8119_fk_pharmacy_` (`category_id`),
  KEY `pharmacy_medicine_location_id_d492a245_fk_pharmacy_` (`location_id`),
  KEY `pharmacy_medicine_supplier_id_e158525d_fk_pharmacy_supplier_id` (`supplier_id`),
  CONSTRAINT `pharmacy_medicine_category_id_f73b8119_fk_pharmacy_` FOREIGN KEY (`category_id`) REFERENCES `pharmacy_medicinecategory` (`id`),
  CONSTRAINT `pharmacy_medicine_location_id_d492a245_fk_pharmacy_` FOREIGN KEY (`location_id`) REFERENCES `pharmacy_medicinestorelocation` (`id`),
  CONSTRAINT `pharmacy_medicine_supplier_id_e158525d_fk_pharmacy_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `pharmacy_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicine`
--

LOCK TABLES `pharmacy_medicine` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicine` DISABLE KEYS */;
INSERT INTO `pharmacy_medicine` VALUES (1,'001',1000,'2021-02-01 18:30:00.000000','530','dinejhg','dolo',20.00,'jdjhfkjhd',1,1,1),(2,'002',250,'2021-02-07 18:30:00.000000','3423','sfsdf','paracetemal',15.00,'dfsfds',1,1,1);
/*!40000 ALTER TABLE `pharmacy_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_medicinecategory`
--

DROP TABLE IF EXISTS `pharmacy_medicinecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_medicinecategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicineType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicinecategory`
--

LOCK TABLES `pharmacy_medicinecategory` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicinecategory` DISABLE KEYS */;
INSERT INTO `pharmacy_medicinecategory` VALUES (1,'Tablets'),(2,'syrup'),(3,'Capsule');
/*!40000 ALTER TABLE `pharmacy_medicinecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_medicinesale`
--

DROP TABLE IF EXISTS `pharmacy_medicinesale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_medicinesale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patientName` varchar(255) NOT NULL,
  `referredDoctorName` varchar(255) NOT NULL,
  `stockAvailable` int(10) unsigned DEFAULT NULL,
  `saleStatus` varchar(10) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `paymentOption_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pharmacy_medicinesal_category_id_93a21e9f_fk_pharmacy_` (`category_id`),
  KEY `pharmacy_medicinesal_customer_id_0fee34b7_fk_pharmacy_` (`customer_id`),
  KEY `pharmacy_medicinesal_paymentOption_id_30206bcc_fk_pharmacy_` (`paymentOption_id`),
  CONSTRAINT `pharmacy_medicinesal_category_id_93a21e9f_fk_pharmacy_` FOREIGN KEY (`category_id`) REFERENCES `pharmacy_medicinecategory` (`id`),
  CONSTRAINT `pharmacy_medicinesal_customer_id_0fee34b7_fk_pharmacy_` FOREIGN KEY (`customer_id`) REFERENCES `pharmacy_customertype` (`id`),
  CONSTRAINT `pharmacy_medicinesal_paymentOption_id_30206bcc_fk_pharmacy_` FOREIGN KEY (`paymentOption_id`) REFERENCES `pharmacy_paymentoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicinesale`
--

LOCK TABLES `pharmacy_medicinesale` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicinesale` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_medicinesale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_medicinesaleslist`
--

DROP TABLE IF EXISTS `pharmacy_medicinesaleslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_medicinesaleslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sellingPrice` decimal(10,2) DEFAULT NULL,
  `quantity` int(10) unsigned DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `medicineName_id` int(11) DEFAULT NULL,
  `medicinelist_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pharmacy_medicinesal_category_id_5292557f_fk_pharmacy_` (`category_id`),
  KEY `pharmacy_medicinesal_medicineName_id_c8149f61_fk_pharmacy_` (`medicineName_id`),
  KEY `pharmacy_medicinesal_medicinelist_id_1d893fa1_fk_pharmacy_` (`medicinelist_id`),
  CONSTRAINT `pharmacy_medicinesal_category_id_5292557f_fk_pharmacy_` FOREIGN KEY (`category_id`) REFERENCES `pharmacy_medicinecategory` (`id`),
  CONSTRAINT `pharmacy_medicinesal_medicineName_id_c8149f61_fk_pharmacy_` FOREIGN KEY (`medicineName_id`) REFERENCES `pharmacy_medicine` (`id`),
  CONSTRAINT `pharmacy_medicinesal_medicinelist_id_1d893fa1_fk_pharmacy_` FOREIGN KEY (`medicinelist_id`) REFERENCES `pharmacy_medicinesale` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicinesaleslist`
--

LOCK TABLES `pharmacy_medicinesaleslist` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicinesaleslist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_medicinesaleslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_medicinestorelocation`
--

DROP TABLE IF EXISTS `pharmacy_medicinestorelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_medicinestorelocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicineCategory` varchar(255) NOT NULL,
  `storeLocation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_medicinestorelocation`
--

LOCK TABLES `pharmacy_medicinestorelocation` WRITE;
/*!40000 ALTER TABLE `pharmacy_medicinestorelocation` DISABLE KEYS */;
INSERT INTO `pharmacy_medicinestorelocation` VALUES (1,'Tablets','R1');
/*!40000 ALTER TABLE `pharmacy_medicinestorelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_paymentoption`
--

DROP TABLE IF EXISTS `pharmacy_paymentoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_paymentoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentType` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_paymentoption`
--

LOCK TABLES `pharmacy_paymentoption` WRITE;
/*!40000 ALTER TABLE `pharmacy_paymentoption` DISABLE KEYS */;
INSERT INTO `pharmacy_paymentoption` VALUES (1,'Cash');
/*!40000 ALTER TABLE `pharmacy_paymentoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_purchaseorder`
--

DROP TABLE IF EXISTS `pharmacy_purchaseorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `fulfillmentDate` datetime(6) DEFAULT NULL,
  `batchNumber` varchar(255) DEFAULT NULL,
  `expiryDate` datetime(6) DEFAULT NULL,
  `costPrice` int(10) unsigned DEFAULT NULL,
  `maxRetailPrice` int(10) unsigned DEFAULT NULL,
  `orderStatus` varchar(10) NOT NULL,
  `details` longtext,
  `medicine_id` int(11) DEFAULT NULL,
  `medicineCategory_id` int(11) DEFAULT NULL,
  `paymentType_id` int(11) DEFAULT NULL,
  `purchaseTax_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pharmacy_purchaseord_medicine_id_1d1643f9_fk_pharmacy_` (`medicine_id`),
  KEY `pharmacy_purchaseord_medicineCategory_id_90d1cb9d_fk_pharmacy_` (`medicineCategory_id`),
  KEY `pharmacy_purchaseord_paymentType_id_b546ae61_fk_pharmacy_` (`paymentType_id`),
  KEY `pharmacy_purchaseord_purchaseTax_id_4f62112f_fk_pharmacy_` (`purchaseTax_id`),
  KEY `pharmacy_purchaseord_supplier_id_896f7b76_fk_pharmacy_` (`supplier_id`),
  CONSTRAINT `pharmacy_purchaseord_medicineCategory_id_90d1cb9d_fk_pharmacy_` FOREIGN KEY (`medicineCategory_id`) REFERENCES `pharmacy_medicinecategory` (`id`),
  CONSTRAINT `pharmacy_purchaseord_medicine_id_1d1643f9_fk_pharmacy_` FOREIGN KEY (`medicine_id`) REFERENCES `pharmacy_medicine` (`id`),
  CONSTRAINT `pharmacy_purchaseord_paymentType_id_b546ae61_fk_pharmacy_` FOREIGN KEY (`paymentType_id`) REFERENCES `pharmacy_paymentoption` (`id`),
  CONSTRAINT `pharmacy_purchaseord_purchaseTax_id_4f62112f_fk_pharmacy_` FOREIGN KEY (`purchaseTax_id`) REFERENCES `pharmacy_purchasetaxoption` (`id`),
  CONSTRAINT `pharmacy_purchaseord_supplier_id_896f7b76_fk_pharmacy_` FOREIGN KEY (`supplier_id`) REFERENCES `pharmacy_supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_purchaseorder`
--

LOCK TABLES `pharmacy_purchaseorder` WRITE;
/*!40000 ALTER TABLE `pharmacy_purchaseorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_purchasetaxoption`
--

DROP TABLE IF EXISTS `pharmacy_purchasetaxoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_purchasetaxoption` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseTax` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_purchasetaxoption`
--

LOCK TABLES `pharmacy_purchasetaxoption` WRITE;
/*!40000 ALTER TABLE `pharmacy_purchasetaxoption` DISABLE KEYS */;
INSERT INTO `pharmacy_purchasetaxoption` VALUES (1,4);
/*!40000 ALTER TABLE `pharmacy_purchasetaxoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_supplier`
--

DROP TABLE IF EXISTS `pharmacy_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `altPhoneNumber` varchar(20) NOT NULL,
  `landlineNumber` varchar(20) NOT NULL,
  `contactPerson` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_supplier`
--

LOCK TABLES `pharmacy_supplier` WRITE;
/*!40000 ALTER TABLE `pharmacy_supplier` DISABLE KEYS */;
INSERT INTO `pharmacy_supplier` VALUES (1,'zeotec','8675937498','9873498573','9837495873','anil','1 32\nGALIPALLY\nELLANTHAKUNTA','dinesh@gmail.com');
/*!40000 ALTER TABLE `pharmacy_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_cbc`
--

DROP TABLE IF EXISTS `usermanagement_cbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_cbc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute` longtext NOT NULL,
  `referenceminvalue` double NOT NULL,
  `referencemaxvalue` double NOT NULL,
  `units` longtext NOT NULL,
  `created_date` varchar(100) DEFAULT NULL,
  `patient_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usermanagement_cbc_patient_id_8e3d32ff_fk_usermanag` (`patient_id`),
  CONSTRAINT `usermanagement_cbc_patient_id_8e3d32ff_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_cbc`
--

LOCK TABLES `usermanagement_cbc` WRITE;
/*!40000 ALTER TABLE `usermanagement_cbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermanagement_cbc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_doctors`
--

DROP TABLE IF EXISTS `usermanagement_doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_doctors` (
  `doc_id` int(11) NOT NULL,
  `is_booked` varchar(4) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  `Experience` varchar(100) NOT NULL,
  `Licence_number` varchar(100) NOT NULL,
  `pro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`doc_id`),
  UNIQUE KEY `pro_id` (`pro_id`),
  CONSTRAINT `usermanagement_docto_pro_id_b78f7fd4_fk_usermanag` FOREIGN KEY (`pro_id`) REFERENCES `usermanagement_profile` (`id`),
  CONSTRAINT `usermanagement_doctors_doc_id_d59a3098_fk_usermanagement_user_id` FOREIGN KEY (`doc_id`) REFERENCES `usermanagement_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_doctors`
--

LOCK TABLES `usermanagement_doctors` WRITE;
/*!40000 ALTER TABLE `usermanagement_doctors` DISABLE KEYS */;
INSERT INTO `usermanagement_doctors` VALUES (3,'no','Anesthesiology','1 years 2 months','97498789',2);
/*!40000 ALTER TABLE `usermanagement_doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_laboratorist`
--

DROP TABLE IF EXISTS `usermanagement_laboratorist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_laboratorist` (
  `lab_user_id` int(11) NOT NULL,
  `licence_number` varchar(100) NOT NULL,
  `pro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`lab_user_id`),
  UNIQUE KEY `pro_id` (`pro_id`),
  CONSTRAINT `usermanagement_labor_lab_user_id_376889b4_fk_usermanag` FOREIGN KEY (`lab_user_id`) REFERENCES `usermanagement_user` (`id`),
  CONSTRAINT `usermanagement_labor_pro_id_0c2447aa_fk_usermanag` FOREIGN KEY (`pro_id`) REFERENCES `usermanagement_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_laboratorist`
--

LOCK TABLES `usermanagement_laboratorist` WRITE;
/*!40000 ALTER TABLE `usermanagement_laboratorist` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermanagement_laboratorist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_nurse`
--

DROP TABLE IF EXISTS `usermanagement_nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_nurse` (
  `nurse_user_id` int(11) NOT NULL,
  `speciality` varchar(100) NOT NULL,
  `experience` varchar(100) NOT NULL,
  `licence_number` varchar(100) NOT NULL,
  `pro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nurse_user_id`),
  UNIQUE KEY `pro_id` (`pro_id`),
  CONSTRAINT `usermanagement_nurse_nurse_user_id_3770bf5c_fk_usermanag` FOREIGN KEY (`nurse_user_id`) REFERENCES `usermanagement_user` (`id`),
  CONSTRAINT `usermanagement_nurse_pro_id_b91cd858_fk_usermanag` FOREIGN KEY (`pro_id`) REFERENCES `usermanagement_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_nurse`
--

LOCK TABLES `usermanagement_nurse` WRITE;
/*!40000 ALTER TABLE `usermanagement_nurse` DISABLE KEYS */;
INSERT INTO `usermanagement_nurse` VALUES (6,'Gastroenterology nursing','2 years 0 months','9999',6);
/*!40000 ALTER TABLE `usermanagement_nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_patient`
--

DROP TABLE IF EXISTS `usermanagement_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_patient` (
  `UHID` varchar(50) NOT NULL,
  `is_refered` tinyint(1) NOT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `maritial_status` varchar(50) DEFAULT NULL,
  `ethnicity` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `address` varchar(150) NOT NULL,
  `address2` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `emergencycontactfname` varchar(50) DEFAULT NULL,
  `emergencycontactlname` varchar(50) DEFAULT NULL,
  `emergencycontactno` varchar(50) DEFAULT NULL,
  `emergencyrelationship` varchar(200) DEFAULT NULL,
  `familyDoctorName` varchar(50) DEFAULT NULL,
  `familycontactno` varchar(50) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `pat_id` int(11) NOT NULL,
  PRIMARY KEY (`UHID`),
  UNIQUE KEY `pat_id` (`pat_id`),
  CONSTRAINT `usermanagement_patie_pat_id_3a6a812a_fk_usermanag` FOREIGN KEY (`pat_id`) REFERENCES `usermanagement_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_patient`
--

LOCK TABLES `usermanagement_patient` WRITE;
/*!40000 ALTER TABLE `usermanagement_patient` DISABLE KEYS */;
INSERT INTO `usermanagement_patient` VALUES ('LHMR-00-00000001',0,'student','A-','Single','Asian','1994-10-10','25 years and 24 days','1 32','GALIPALLY','RAJANNA SIRICILLA','Telangana','India','500072','dinesh','bupathi','+91 9237498732','dsihfiu','','+91','hsdkjfhkjsdhk','2019-11-03',5);
/*!40000 ALTER TABLE `usermanagement_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_patient_doc_link`
--

DROP TABLE IF EXISTS `usermanagement_patient_doc_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_patient_doc_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(50) NOT NULL,
  `doctors_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usermanagement_patient_d_patient_id_doctors_id_dcec1f4a_uniq` (`patient_id`,`doctors_id`),
  KEY `usermanagement_patie_doctors_id_07b68cbf_fk_usermanag` (`doctors_id`),
  CONSTRAINT `usermanagement_patie_doctors_id_07b68cbf_fk_usermanag` FOREIGN KEY (`doctors_id`) REFERENCES `usermanagement_doctors` (`doc_id`),
  CONSTRAINT `usermanagement_patie_patient_id_6411384e_fk_usermanag` FOREIGN KEY (`patient_id`) REFERENCES `usermanagement_patient` (`UHID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_patient_doc_link`
--

LOCK TABLES `usermanagement_patient_doc_link` WRITE;
/*!40000 ALTER TABLE `usermanagement_patient_doc_link` DISABLE KEYS */;
INSERT INTO `usermanagement_patient_doc_link` VALUES (1,'LHMR-00-00000001',3);
/*!40000 ALTER TABLE `usermanagement_patient_doc_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_pharmacist`
--

DROP TABLE IF EXISTS `usermanagement_pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_pharmacist` (
  `pharma_user_id` int(11) NOT NULL,
  `licence_number` varchar(100) NOT NULL,
  `pro_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pharma_user_id`),
  UNIQUE KEY `pro_id` (`pro_id`),
  CONSTRAINT `usermanagement_pharm_pharma_user_id_af608647_fk_usermanag` FOREIGN KEY (`pharma_user_id`) REFERENCES `usermanagement_user` (`id`),
  CONSTRAINT `usermanagement_pharm_pro_id_5277c87f_fk_usermanag` FOREIGN KEY (`pro_id`) REFERENCES `usermanagement_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_pharmacist`
--

LOCK TABLES `usermanagement_pharmacist` WRITE;
/*!40000 ALTER TABLE `usermanagement_pharmacist` DISABLE KEYS */;
INSERT INTO `usermanagement_pharmacist` VALUES (4,'9873489',3);
/*!40000 ALTER TABLE `usermanagement_pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_profile`
--

DROP TABLE IF EXISTS `usermanagement_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) DEFAULT NULL,
  `first_name` varchar(300) NOT NULL,
  `last_name` varchar(300) DEFAULT NULL,
  `middle_name` varchar(300) DEFAULT NULL,
  `phone` varchar(30) NOT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `reset_time` datetime(6) NOT NULL,
  `Qualification` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usermanagement_profi_user_id_2a63c878_fk_usermanag` (`user_id`),
  KEY `usermanagement_profi_user_type_id_430b060c_fk_usermanag` (`user_type_id`),
  CONSTRAINT `usermanagement_profi_user_id_2a63c878_fk_usermanag` FOREIGN KEY (`user_id`) REFERENCES `usermanagement_user` (`id`),
  CONSTRAINT `usermanagement_profi_user_type_id_430b060c_fk_usermanag` FOREIGN KEY (`user_type_id`) REFERENCES `usermanagement_usertypes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_profile`
--

LOCK TABLES `usermanagement_profile` WRITE;
/*!40000 ALTER TABLE `usermanagement_profile` DISABLE KEYS */;
INSERT INTO `usermanagement_profile` VALUES (1,'dinesh@gmail.com','dinesh','bupathi','kumar','91 9959557710','dinesh bupathi',0,'2019-11-03 05:48:54.267215','mca',2,3),(2,'dinesh@gmail.com','demo','tor','doc','+91 9878783458','Male',0,'2019-11-03 05:50:17.516976','BAMS',3,6),(3,'dinesh@gmail.com','demo','ist','pharmac','91 9873498753','Male',0,'2019-11-03 05:51:08.394887','BASLP',4,4),(4,'dinesh@gmail.com','demo','ptionist','rec','+91 9873489753','Male',0,'2019-11-03 05:52:27.855431','undergraduate',5,2),(5,'dinesh@gmail.com','demo','rohan','patient','+91 8263648273','Male',0,'2019-11-03 06:00:48.219051',NULL,NULL,7),(6,'dinesh@gmail.com','dskjh','khdkjh','hdkh','+91 9729834798','Male',0,'2019-11-04 04:22:56.268864','GNM',6,5);
/*!40000 ALTER TABLE `usermanagement_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_user`
--

DROP TABLE IF EXISTS `usermanagement_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_reset` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_user`
--

LOCK TABLES `usermanagement_user` WRITE;
/*!40000 ALTER TABLE `usermanagement_user` DISABLE KEYS */;
INSERT INTO `usermanagement_user` VALUES (1,NULL,0,'','','',0,1,'2019-11-03 05:48:33.734040','demoadmin','pbkdf2_sha256$150000$2ythO2AlQxx6$0VO82QHL4AREMQ8/7GjTqvRF0AzkYgKVUC5ggZMv+tQ=',1),(2,'2019-11-04 04:22:25.054078',0,'','','',0,1,'2019-11-03 05:48:51.620063','admin','pbkdf2_sha256$150000$ICw3akxi5jFw$xnuvLlqt0DhS/swdyVrlaZOJJhrCZYaGyqNnuDhxh6o=',0),(3,'2019-11-04 04:33:39.712666',0,'','','',0,1,'2019-11-03 05:50:16.972945','demodoc','pbkdf2_sha256$150000$EQxzbLAkXXl2$8Jeyy53eJh5eMkXA/+D+On/yJyuGQO992LefkyvkeHQ=',0),(4,'2019-11-03 10:22:57.385593',0,'','','',0,1,'2019-11-03 05:51:07.806853','demoph','pbkdf2_sha256$150000$DUuMW8W67WNF$Knt2Q3M8acpcgVu4lrhqJcpvK9MvvU3xKKarxRsUqog=',0),(5,'2019-11-04 03:48:49.471957',0,'','','',0,1,'2019-11-03 05:52:27.192394','demore','pbkdf2_sha256$150000$7NRj5IF1Yu7Q$4wuK77IcQ7kkUQ6LMdXCELPqSD57NYBOnD5VlWtou6s=',0),(6,'2019-11-04 04:35:37.733417',0,'','','',0,1,'2019-11-04 04:22:55.504820','demonurse','pbkdf2_sha256$150000$D0LBbmwfW3tK$EaoRFChxSHn4s19G3ulhl+BWJaRgHmyFBBCw4jJCpQk=',0);
/*!40000 ALTER TABLE `usermanagement_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_user_groups`
--

DROP TABLE IF EXISTS `usermanagement_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usermanagement_user_groups_user_id_group_id_d79ad12f_uniq` (`user_id`,`group_id`),
  KEY `usermanagement_user_groups_group_id_8a5e23fc_fk_auth_group_id` (`group_id`),
  CONSTRAINT `usermanagement_user__user_id_681d81f7_fk_usermanag` FOREIGN KEY (`user_id`) REFERENCES `usermanagement_user` (`id`),
  CONSTRAINT `usermanagement_user_groups_group_id_8a5e23fc_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_user_groups`
--

LOCK TABLES `usermanagement_user_groups` WRITE;
/*!40000 ALTER TABLE `usermanagement_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermanagement_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_user_user_permissions`
--

DROP TABLE IF EXISTS `usermanagement_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usermanagement_user_user_user_id_permission_id_b36c426b_uniq` (`user_id`,`permission_id`),
  KEY `usermanagement_user__permission_id_94e34351_fk_auth_perm` (`permission_id`),
  CONSTRAINT `usermanagement_user__permission_id_94e34351_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `usermanagement_user__user_id_c5c2e762_fk_usermanag` FOREIGN KEY (`user_id`) REFERENCES `usermanagement_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_user_user_permissions`
--

LOCK TABLES `usermanagement_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `usermanagement_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermanagement_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement_usertypes`
--

DROP TABLE IF EXISTS `usermanagement_usertypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermanagement_usertypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Role_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement_usertypes`
--

LOCK TABLES `usermanagement_usertypes` WRITE;
/*!40000 ALTER TABLE `usermanagement_usertypes` DISABLE KEYS */;
INSERT INTO `usermanagement_usertypes` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7);
/*!40000 ALTER TABLE `usermanagement_usertypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-04 10:24:27
