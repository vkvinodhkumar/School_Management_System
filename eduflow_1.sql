-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: eduflow_db1
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academics_admissionapplication`
--

DROP TABLE IF EXISTS `academics_admissionapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_admissionapplication` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_name` varchar(150) NOT NULL,
  `parent_name` varchar(150) NOT NULL,
  `parent_email` varchar(254) NOT NULL,
  `status` varchar(20) NOT NULL,
  `admission_number` varchar(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `class_obj_id` bigint NOT NULL,
  `section_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `academics_admissiona_class_obj_id_a5d26d47_fk_academics` (`class_obj_id`),
  KEY `academics_admissiona_section_id_0e8e8e2c_fk_academics` (`section_id`),
  CONSTRAINT `academics_admissiona_class_obj_id_a5d26d47_fk_academics` FOREIGN KEY (`class_obj_id`) REFERENCES `academics_class` (`id`),
  CONSTRAINT `academics_admissiona_section_id_0e8e8e2c_fk_academics` FOREIGN KEY (`section_id`) REFERENCES `academics_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_admissionapplication`
--

LOCK TABLES `academics_admissionapplication` WRITE;
/*!40000 ALTER TABLE `academics_admissionapplication` DISABLE KEYS */;
INSERT INTO `academics_admissionapplication` VALUES (1,'Roshine','Bala Murugan','balamurugan@gmail.com','APPROVED','20260226399155','2026-02-26 09:04:05.944067',1,1),(2,'vinodh','ponnambala jothi','ponnambalajothi@gmail.com','APPROVED','20260227403277','2026-02-26 19:04:56.484581',1,1),(4,'Achu','das','das@gmail.com','APPROVED','20260227287151','2026-02-27 09:16:40.375048',1,1),(5,'Mariya','das','das@gmail.com','APPROVED','20260227889070','2026-02-27 09:43:52.603975',1,2),(6,'sharmi','gopal','gopal@gmail.com','REJECTED',NULL,'2026-02-28 05:31:44.881358',1,NULL),(7,'jagan','Padmanaban','abc@gmail.com','APPROVED','20260304357771','2026-03-01 09:42:38.439873',3,6),(8,'Divakaran s','sundar','sdivakaran401@gmailcom','APPROVED','20260304235193','2026-03-04 09:13:40.445235',1,2),(9,'sha','venu','asharmi3119@gmail.com','APPROVED','20260311465967','2026-03-04 09:20:42.151494',3,6),(10,'Revathi','Sankar','sankar12@gmail.com','APPROVED','20260311125024','2026-03-04 09:22:15.366195',5,10),(11,'shanmugapriya','arul','shanuarul@gmail.com','APPROVED','20260311864608','2026-03-04 09:23:24.407901',8,16),(12,'saranya','saravanan','saranyasar@gmail.com','APPROVED','20260311337567','2026-03-04 09:24:42.612306',7,14),(13,'rayana','joseph','josephrayana@gmail.com','APPROVED','20260311256676','2026-03-04 09:25:17.183370',4,8),(14,'nithya','bala','nithyabala@gmail.com','APPROVED','20260311280281','2026-03-04 09:25:52.910475',9,18),(15,'nivetha','mariyamma','mariyammaniv@gmail.com','APPROVED','20260311888841','2026-03-04 09:27:02.819065',7,14),(16,'kumar','vinoth','kumarvin@gmail.com','APPROVED','20260311268795','2026-03-04 09:27:50.461896',2,4),(17,'diva','karan','divakaran@gmail.com','APPROVED','20260311332978','2026-03-04 09:28:19.208868',8,17),(18,'rosh','balamurugan','roshmurugan@gmail.com','APPROVED','20260311982373','2026-03-04 09:28:58.999458',6,12),(19,'mariya','das','immanuveldas@gmail.com','APPROVED','20260311291742','2026-03-04 09:29:32.900498',10,21),(20,'vijya','barathi','vijya@gmail.com','APPROVED','20260311976300','2026-03-04 09:30:07.873918',7,14),(21,'sharmila','gopal','sharmigopal@gmail.com','APPROVED','20260311136947','2026-03-04 09:30:53.150516',13,27),(22,'Finan','Christopher Rodges','financhristopher@gmail.com','APPROVED','20260311958927','2026-03-04 09:32:04.166976',1,2),(23,'chitra','sharmi','chitrasharmi@gmail.com','APPROVED','20260311133992','2026-03-04 09:32:31.364701',4,8),(24,'elumalai','logeshwari','logeshwarielu@gmail.com','APPROVED','20260311915424','2026-03-04 09:32:59.590788',5,11),(25,'hariesh','saravanan','saravananhariesh@gmail.com','REJECTED',NULL,'2026-03-04 09:33:31.751273',2,NULL),(26,'shivadu','saravanan','shivasaravanan@gmail.com','APPROVED','20260311243343','2026-03-04 09:34:09.319658',7,15),(27,'shri','hari','shrihari@gmail.com','APPROVED','20260311562100','2026-03-04 09:34:40.851603',8,17),(28,'deepak','thulasi','deepakthulasi@gmail.com','APPROVED','20260306952526','2026-03-04 09:35:12.356889',3,7),(29,'divya','venugopal','venugopal@gmail.com','APPROVED','20260311347237','2026-03-04 09:36:52.517038',1,2),(30,'harshini','murugan','harshini@gmail.com','REJECTED',NULL,'2026-03-04 09:38:08.073031',3,NULL),(31,'Yogesh','Lingam','lmoorthy147@gmail.com','APPROVED','20260311601522','2026-03-11 08:33:48.988616',15,30),(32,'kiran','messi','messi12@gmail.com','APPROVED','20260311585384','2026-03-11 08:36:09.040887',1,2);
/*!40000 ALTER TABLE `academics_admissionapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_attendancerecord`
--

DROP TABLE IF EXISTS `academics_attendancerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_attendancerecord` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `academics_attendancerecord_student_id_date_3a88c353_uniq` (`student_id`,`date`),
  CONSTRAINT `academics_attendance_student_id_c9bbe665_fk_academics` FOREIGN KEY (`student_id`) REFERENCES `academics_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_attendancerecord`
--

LOCK TABLES `academics_attendancerecord` WRITE;
/*!40000 ALTER TABLE `academics_attendancerecord` DISABLE KEYS */;
INSERT INTO `academics_attendancerecord` VALUES (1,'2026-02-26','Absent',1),(2,'2026-02-27','Absent',1),(3,'2026-02-27','Present',2),(4,'2026-02-27','Present',3),(5,'2026-02-27','Present',4),(6,'2026-03-01','Present',1),(7,'2026-03-01','Present',2),(8,'2026-03-01','Present',3),(9,'2026-03-01','Present',4);
/*!40000 ALTER TABLE `academics_attendancerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_attendancesession`
--

DROP TABLE IF EXISTS `academics_attendancesession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_attendancesession` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(100) NOT NULL,
  `teacher_id` bigint NOT NULL,
  `class_obj_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academics_attendance_teacher_id_8a851c85_fk_accounts_` (`teacher_id`),
  KEY `academics_attendance_class_obj_id_1a325d10_fk_academics` (`class_obj_id`),
  KEY `academics_attendance_section_id_8717c5ed_fk_academics` (`section_id`),
  CONSTRAINT `academics_attendance_class_obj_id_1a325d10_fk_academics` FOREIGN KEY (`class_obj_id`) REFERENCES `academics_class` (`id`),
  CONSTRAINT `academics_attendance_section_id_8717c5ed_fk_academics` FOREIGN KEY (`section_id`) REFERENCES `academics_section` (`id`),
  CONSTRAINT `academics_attendance_teacher_id_8a851c85_fk_accounts_` FOREIGN KEY (`teacher_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_attendancesession`
--

LOCK TABLES `academics_attendancesession` WRITE;
/*!40000 ALTER TABLE `academics_attendancesession` DISABLE KEYS */;
/*!40000 ALTER TABLE `academics_attendancesession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_class`
--

DROP TABLE IF EXISTS `academics_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_class` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_class`
--

LOCK TABLES `academics_class` WRITE;
/*!40000 ALTER TABLE `academics_class` DISABLE KEYS */;
INSERT INTO `academics_class` VALUES (1,'Pre-KG'),(2,'LKG'),(3,'UKG'),(4,'1'),(5,'2'),(6,'3'),(7,'4'),(8,'5'),(9,'6'),(10,'7'),(11,'8'),(12,'9'),(13,'10'),(14,'11'),(15,'12');
/*!40000 ALTER TABLE `academics_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_exam`
--

DROP TABLE IF EXISTS `academics_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_exam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `max_marks` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_exam`
--

LOCK TABLES `academics_exam` WRITE;
/*!40000 ALTER TABLE `academics_exam` DISABLE KEYS */;
INSERT INTO `academics_exam` VALUES (1,'MId_Sem',100);
/*!40000 ALTER TABLE `academics_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_homework`
--

DROP TABLE IF EXISTS `academics_homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_homework` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `file` varchar(100) NOT NULL,
  `due_date` date NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `class_obj_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academics_homework_class_obj_id_7703a074_fk_academics_class_id` (`class_obj_id`),
  KEY `academics_homework_teacher_id_fffe2945_fk_accounts_customuser_id` (`teacher_id`),
  KEY `academics_homework_section_id_a0297e5e_fk_academics_section_id` (`section_id`),
  KEY `academics_homework_subject_id_d94408a6_fk_academics_subject_id` (`subject_id`),
  CONSTRAINT `academics_homework_class_obj_id_7703a074_fk_academics_class_id` FOREIGN KEY (`class_obj_id`) REFERENCES `academics_class` (`id`),
  CONSTRAINT `academics_homework_section_id_a0297e5e_fk_academics_section_id` FOREIGN KEY (`section_id`) REFERENCES `academics_section` (`id`),
  CONSTRAINT `academics_homework_subject_id_d94408a6_fk_academics_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `academics_subject` (`id`),
  CONSTRAINT `academics_homework_teacher_id_fffe2945_fk_accounts_customuser_id` FOREIGN KEY (`teacher_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_homework`
--

LOCK TABLES `academics_homework` WRITE;
/*!40000 ALTER TABLE `academics_homework` DISABLE KEYS */;
INSERT INTO `academics_homework` VALUES (1,'sam','homework_files/ppt.pdf','2026-03-06','2026-02-26 09:06:18.511720',1,3,1,1),(2,'mdx','homework_files/report.pdf','2026-03-13','2026-02-27 10:12:36.145181',1,3,1,1),(3,'Tamil Homework','homework_files/Screenshot_2026-03-02_185843.png','2026-03-30','2026-03-02 13:30:44.895564',1,3,1,1);
/*!40000 ALTER TABLE `academics_homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_homeworksubmission`
--

DROP TABLE IF EXISTS `academics_homeworksubmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_homeworksubmission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `homework_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `academics_homeworksubmis_homework_id_student_id_b8f412e1_uniq` (`homework_id`,`student_id`),
  KEY `academics_homeworksu_student_id_eba34a57_fk_academics` (`student_id`),
  CONSTRAINT `academics_homeworksu_homework_id_5b853016_fk_academics` FOREIGN KEY (`homework_id`) REFERENCES `academics_homework` (`id`),
  CONSTRAINT `academics_homeworksu_student_id_eba34a57_fk_academics` FOREIGN KEY (`student_id`) REFERENCES `academics_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_homeworksubmission`
--

LOCK TABLES `academics_homeworksubmission` WRITE;
/*!40000 ALTER TABLE `academics_homeworksubmission` DISABLE KEYS */;
INSERT INTO `academics_homeworksubmission` VALUES (2,'homework_submissions/ppt.pdf','2026-02-28 06:31:03.561554',2,1);
/*!40000 ALTER TABLE `academics_homeworksubmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_mark`
--

DROP TABLE IF EXISTS `academics_mark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_mark` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exam_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  `marks` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `academics_mark_student_id_subject_id_exam_id_856119fd_uniq` (`student_id`,`subject_id`,`exam_id`),
  KEY `academics_mark_exam_id_7327c17e_fk_academics_exam_id` (`exam_id`),
  KEY `academics_mark_subject_id_595833b8_fk_academics_subject_id` (`subject_id`),
  CONSTRAINT `academics_mark_exam_id_7327c17e_fk_academics_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `academics_exam` (`id`),
  CONSTRAINT `academics_mark_student_id_71e2934d_fk_academics_student_id` FOREIGN KEY (`student_id`) REFERENCES `academics_student` (`id`),
  CONSTRAINT `academics_mark_subject_id_595833b8_fk_academics_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `academics_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_mark`
--

LOCK TABLES `academics_mark` WRITE;
/*!40000 ALTER TABLE `academics_mark` DISABLE KEYS */;
INSERT INTO `academics_mark` VALUES (1,1,1,1,100),(2,1,2,1,58),(3,1,3,1,75);
/*!40000 ALTER TABLE `academics_mark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_questionpaper`
--

DROP TABLE IF EXISTS `academics_questionpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_questionpaper` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `class_obj_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academics_questionpa_class_obj_id_d3077600_fk_academics` (`class_obj_id`),
  KEY `academics_questionpa_teacher_id_c09a0051_fk_accounts_` (`teacher_id`),
  KEY `academics_questionpa_section_id_f4ec9c43_fk_academics` (`section_id`),
  KEY `academics_questionpa_subject_id_4fa84765_fk_academics` (`subject_id`),
  CONSTRAINT `academics_questionpa_class_obj_id_d3077600_fk_academics` FOREIGN KEY (`class_obj_id`) REFERENCES `academics_class` (`id`),
  CONSTRAINT `academics_questionpa_section_id_f4ec9c43_fk_academics` FOREIGN KEY (`section_id`) REFERENCES `academics_section` (`id`),
  CONSTRAINT `academics_questionpa_subject_id_4fa84765_fk_academics` FOREIGN KEY (`subject_id`) REFERENCES `academics_subject` (`id`),
  CONSTRAINT `academics_questionpa_teacher_id_c09a0051_fk_accounts_` FOREIGN KEY (`teacher_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_questionpaper`
--

LOCK TABLES `academics_questionpaper` WRITE;
/*!40000 ALTER TABLE `academics_questionpaper` DISABLE KEYS */;
INSERT INTO `academics_questionpaper` VALUES (2,'question_papers/ppt_xz3gJoQ.pdf','2026-02-26 09:17:33.103590',1,3,1,1);
/*!40000 ALTER TABLE `academics_questionpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_section`
--

DROP TABLE IF EXISTS `academics_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_section` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `class_obj_id` bigint NOT NULL,
  `class_teacher_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `academics_section_class_obj_id_3e9be354_fk_academics_class_id` (`class_obj_id`),
  KEY `academics_section_class_teacher_id_9181745a_fk_accounts_` (`class_teacher_id`),
  CONSTRAINT `academics_section_class_obj_id_3e9be354_fk_academics_class_id` FOREIGN KEY (`class_obj_id`) REFERENCES `academics_class` (`id`),
  CONSTRAINT `academics_section_class_teacher_id_9181745a_fk_accounts_` FOREIGN KEY (`class_teacher_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_section`
--

LOCK TABLES `academics_section` WRITE;
/*!40000 ALTER TABLE `academics_section` DISABLE KEYS */;
INSERT INTO `academics_section` VALUES (1,'A',1,NULL),(2,'B',1,NULL),(4,'A',2,NULL),(5,'B',2,NULL),(6,'A',3,NULL),(7,'B',3,NULL),(8,'A',4,NULL),(9,'B',4,NULL),(10,'A',5,NULL),(11,'B',5,NULL),(12,'A',6,NULL),(13,'B',6,NULL),(14,'A',7,NULL),(15,'B',7,NULL),(16,'A',8,NULL),(17,'B',8,NULL),(18,'A',9,NULL),(19,'B',9,NULL),(20,'A',10,NULL),(21,'B',10,NULL),(22,'A',11,NULL),(23,'B',11,NULL),(24,'A',12,NULL),(25,'B',12,NULL),(26,'A',13,NULL),(27,'B',13,NULL),(28,'A',14,NULL),(29,'B',14,NULL),(30,'A',15,NULL),(31,'B',15,NULL);
/*!40000 ALTER TABLE `academics_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_student`
--

DROP TABLE IF EXISTS `academics_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(150) NOT NULL,
  `admission_number` varchar(20) NOT NULL,
  `class_obj_id` bigint DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `section_id` bigint DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admission_number` (`admission_number`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `academics_student_class_obj_id_a782efee_fk_academics_class_id` (`class_obj_id`),
  KEY `academics_student_parent_id_f3e488ec_fk_accounts_customuser_id` (`parent_id`),
  KEY `academics_student_section_id_55f6d980_fk_academics_section_id` (`section_id`),
  CONSTRAINT `academics_student_class_obj_id_a782efee_fk_academics_class_id` FOREIGN KEY (`class_obj_id`) REFERENCES `academics_class` (`id`),
  CONSTRAINT `academics_student_parent_id_f3e488ec_fk_accounts_customuser_id` FOREIGN KEY (`parent_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `academics_student_section_id_55f6d980_fk_academics_section_id` FOREIGN KEY (`section_id`) REFERENCES `academics_section` (`id`),
  CONSTRAINT `academics_student_user_id_6dc29732_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_student`
--

LOCK TABLES `academics_student` WRITE;
/*!40000 ALTER TABLE `academics_student` DISABLE KEYS */;
INSERT INTO `academics_student` VALUES (1,'Roshine','20260226399155',1,5,1,4),(2,'vinodh','20260227403277',1,7,1,6),(3,'Achu','20260227287151',1,9,1,8),(4,'Mariya','20260227889070',1,9,1,12),(5,'Divakaran s','20260304235193',1,13,2,14),(6,'jagan','20260304357771',3,15,6,16),(7,'deepak','20260306952526',3,17,7,18),(8,'divya','20260311347237',1,19,2,20),(9,'sha','20260311465967',3,21,6,22),(10,'Revathi','20260311125024',5,23,10,24),(11,'shanmugapriya','20260311864608',8,25,16,26),(12,'saranya','20260311337567',7,27,14,28),(13,'shri','20260311606968',8,29,17,30),(14,'shri','20260311562100',8,29,17,31),(15,'shivadu','20260311243343',7,32,15,33),(16,'rayana','20260311256676',4,34,8,35),(17,'nithya','20260311280281',9,36,18,37),(18,'nivetha','20260311888841',7,38,14,39),(19,'kumar','20260311268795',2,40,4,41),(20,'diva','20260311332978',8,42,17,43),(21,'rosh','20260311982373',6,44,12,45),(22,'mariya','20260311291742',10,46,21,47),(23,'vijya','20260311976300',7,48,14,49),(24,'elumalai','20260311915424',5,50,11,51),(25,'chitra','20260311133992',4,52,8,53),(26,'Finan','20260311958927',1,54,2,55),(27,'sharmila','20260311136947',13,56,27,57),(28,'Yogesh','20260311601522',15,58,31,59),(29,'kiran','20260311585384',1,60,2,61);
/*!40000 ALTER TABLE `academics_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_subject`
--

DROP TABLE IF EXISTS `academics_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_subject`
--

LOCK TABLES `academics_subject` WRITE;
/*!40000 ALTER TABLE `academics_subject` DISABLE KEYS */;
INSERT INTO `academics_subject` VALUES (1,'TAMIL'),(2,'ENGLISH'),(3,'MATHEMATICS'),(4,'SCIENCE'),(5,'SOCIAL SCIENCE');
/*!40000 ALTER TABLE `academics_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `academics_teachersubjectassignment`
--

DROP TABLE IF EXISTS `academics_teachersubjectassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academics_teachersubjectassignment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_obj_id` bigint NOT NULL,
  `section_id` bigint DEFAULT NULL,
  `subject_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academics_teachersub_class_obj_id_ac917178_fk_academics` (`class_obj_id`),
  KEY `academics_teachersub_section_id_e9fa1eed_fk_academics` (`section_id`),
  KEY `academics_teachersub_subject_id_19646af1_fk_academics` (`subject_id`),
  KEY `academics_teachersub_teacher_id_ecc8d47e_fk_accounts_` (`teacher_id`),
  CONSTRAINT `academics_teachersub_class_obj_id_ac917178_fk_academics` FOREIGN KEY (`class_obj_id`) REFERENCES `academics_class` (`id`),
  CONSTRAINT `academics_teachersub_section_id_e9fa1eed_fk_academics` FOREIGN KEY (`section_id`) REFERENCES `academics_section` (`id`),
  CONSTRAINT `academics_teachersub_subject_id_19646af1_fk_academics` FOREIGN KEY (`subject_id`) REFERENCES `academics_subject` (`id`),
  CONSTRAINT `academics_teachersub_teacher_id_ecc8d47e_fk_accounts_` FOREIGN KEY (`teacher_id`) REFERENCES `accounts_customuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_teachersubjectassignment`
--

LOCK TABLES `academics_teachersubjectassignment` WRITE;
/*!40000 ALTER TABLE `academics_teachersubjectassignment` DISABLE KEYS */;
INSERT INTO `academics_teachersubjectassignment` VALUES (1,1,1,1,3);
/*!40000 ALTER TABLE `academics_teachersubjectassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser`
--

DROP TABLE IF EXISTS `accounts_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `role` varchar(20) NOT NULL,
  `must_change_password` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$1200000$CFf13ri20dB3lmRMHXomj3$tGfjW3v2zOKQJ71R6ZEG9cwLoD3E56JLLlW9/Yynuy8=','2026-03-11 08:34:19.649193',1,'','',1,1,'2026-02-26 09:00:20.249178','admin@gmail.com','ADMIN',0),(2,'pbkdf2_sha256$1200000$7EnbP58pfCRIHKlIjLFqqV$2/wiSTEn5v9Ua0500klZsdngw8d2Wp5yzr1Lcy7/h/I=','2026-03-11 08:34:53.806367',0,'vijay','raj',1,1,'2026-02-26 09:02:29.956213','principal@gmail.com','PRINCIPAL',1),(3,'pbkdf2_sha256$1200000$kS0T6kTZPIVTTsnDscEsFo$li496P2WDbqTzTqV5ogKarJm0HcKK34XV1zyUrLBSxw=','2026-03-11 08:55:46.558185',0,'ramar','',1,1,'2026-02-26 09:02:57.086201','teacher@gmail.com','TEACHER',1),(4,'pbkdf2_sha256$1200000$hNEGzLf8hpS7eBMqrEy7RT$iww2XIbVnRppyF9mJj2TsdMj8uZPaoFFiiDVe15JB5k=','2026-03-04 09:17:51.524333',0,'Roshine','',0,1,'2026-02-26 09:04:30.417817','20260226399155@gmail.com','STUDENT',0),(5,'pbkdf2_sha256$1200000$3T7H6arwsjibcDcWgnLhGk$qV8BMMD81aDdooeQIOX5kAYKIVb1H7lQ4qZ6aM6JcM8=','2026-03-04 09:18:19.838693',0,'Bala Murugan','',0,1,'2026-02-26 09:04:30.419707','balamurugan@gmail.com','PARENT',0),(6,'pbkdf2_sha256$1200000$3P4r2x0VVKnEgC5bdjr5yp$oomR1cu05z7omw1wjzgxzQlAXDbpJ91dgTNOs9a/pzs=',NULL,0,'vinodh','',0,1,'2026-02-26 19:16:59.250204','20260227403277@gmail.com','STUDENT',1),(7,'pbkdf2_sha256$1200000$3P4r2x0VVKnEgC5bdjr5yp$oomR1cu05z7omw1wjzgxzQlAXDbpJ91dgTNOs9a/pzs=',NULL,0,'ponnambala jothi','',0,1,'2026-02-26 19:16:59.257581','ponnambalajothi@gmail.com','PARENT',1),(8,'pbkdf2_sha256$1200000$B28qMcFGSjwz0lEnmtNJMr$bgp5037jeR45wq0/v1WD0U4Wolp2LwvtpFqvYOkgTXc=','2026-02-27 09:23:35.154823',0,'Achu','',0,1,'2026-02-27 09:17:06.291260','20260227287151@gmail.com','STUDENT',0),(9,'pbkdf2_sha256$1200000$EK832ePHVQDEAlxPOq6EVH$QdoWmE/PPal9Q5Li2ix+CaKz4lFlAXydrIKyCGfkHnc=','2026-02-27 09:45:28.986545',0,'das','',0,1,'2026-02-27 09:17:06.294260','das@gmail.com','PARENT',0),(12,'pbkdf2_sha256$1200000$sQZNcx5sVElQhy9zNe2h6C$L9plCNWIuYzg//p7gX9iwU14F7KG4Sfld93vWYmWNaM=',NULL,0,'Mariya','',0,1,'2026-02-27 09:44:08.509202','20260227889070@gmail.com','STUDENT',1),(13,'pbkdf2_sha256$1200000$rRZysT603DQ0hbBr0SBdI5$AFixTCxRG6uWUrDis/GebZRYu0BhU/zbhB9FyxBxiTY=',NULL,0,'sundar','',0,1,'2026-03-04 09:14:05.963728','sdivakaran401@gmailcom','PARENT',1),(14,'pbkdf2_sha256$1200000$ucKu2Aq1bScpGzryi8a9kW$rS9xM9wxjdYLG7kMSLNNtVlRmHlI82fI6cgTGO+Wj68=','2026-03-04 09:15:56.211964',0,'Divakaran s','',0,1,'2026-03-04 09:14:05.966199','20260304235193@gmail.com','STUDENT',0),(15,'pbkdf2_sha256$1200000$ZAhoJh0WoW4CMDYSQB11Xx$ELotGVX4OeuB5mzuzCaD+VHYWWiIGfvvo0zb6lfHO08=',NULL,0,'Padmanaban','',0,1,'2026-03-04 09:14:14.912541','abc@gmail.com','PARENT',1),(16,'pbkdf2_sha256$1200000$ZAhoJh0WoW4CMDYSQB11Xx$ELotGVX4OeuB5mzuzCaD+VHYWWiIGfvvo0zb6lfHO08=',NULL,0,'jagan','',0,1,'2026-03-04 09:14:14.914830','20260304357771@gmail.com','STUDENT',1),(17,'pbkdf2_sha256$1200000$QherDDU68vytWMHENB1fJx$BmQ2SmEAMCKAmzW5NpSQ07P6ubUc0g1zvDxIuvYAfFM=',NULL,0,'thulasi','',0,1,'2026-03-06 12:00:46.616441','deepakthulasi@gmail.com','PARENT',1),(18,'pbkdf2_sha256$1200000$QherDDU68vytWMHENB1fJx$BmQ2SmEAMCKAmzW5NpSQ07P6ubUc0g1zvDxIuvYAfFM=',NULL,0,'deepak','',0,1,'2026-03-06 12:00:46.618838','20260306952526@gmail.com','STUDENT',1),(19,'pbkdf2_sha256$1200000$py4fvkkJHcVIN4P8rnw4kz$NcF6Moy1jLO8TbHvC+yWNECJ9xwdfIdTE0YdZQqPbiE=',NULL,0,'venugopal','',0,1,'2026-03-11 08:24:22.919492','venugopal@gmail.com','PARENT',1),(20,'pbkdf2_sha256$1200000$py4fvkkJHcVIN4P8rnw4kz$NcF6Moy1jLO8TbHvC+yWNECJ9xwdfIdTE0YdZQqPbiE=',NULL,0,'divya','',0,1,'2026-03-11 08:24:22.924026','20260311347237@gmail.com','STUDENT',1),(21,'pbkdf2_sha256$1200000$9bfPH4MfMNHr35WoecvAt5$lke4yz3Wl0zZdc+4dRwtYm6WagK3WIcKMTg79J9M2D0=',NULL,0,'venu','',0,1,'2026-03-11 08:24:30.232050','asharmi3119@gmail.com','PARENT',1),(22,'pbkdf2_sha256$1200000$9bfPH4MfMNHr35WoecvAt5$lke4yz3Wl0zZdc+4dRwtYm6WagK3WIcKMTg79J9M2D0=',NULL,0,'sha','',0,1,'2026-03-11 08:24:30.234157','20260311465967@gmail.com','STUDENT',1),(23,'pbkdf2_sha256$1200000$eDpzAwCD6XbQyLYOEVJEhG$Kq2HUSGZcDtWivZeYOfqEfOlxfbOMjdDXC4u+b8QjZ0=',NULL,0,'Sankar','',0,1,'2026-03-11 08:25:17.486775','sankar12@gmail.com','PARENT',1),(24,'pbkdf2_sha256$1200000$eDpzAwCD6XbQyLYOEVJEhG$Kq2HUSGZcDtWivZeYOfqEfOlxfbOMjdDXC4u+b8QjZ0=',NULL,0,'Revathi','',0,1,'2026-03-11 08:25:17.488271','20260311125024@gmail.com','STUDENT',1),(25,'pbkdf2_sha256$1200000$tCkdcTS0G9f8z3ELIWiLMI$DACUiIVDlpIRls5XcQk8UlNhtLilNha/NYFuwMSD6Ls=',NULL,0,'arul','',0,1,'2026-03-11 08:28:40.749691','shanuarul@gmail.com','PARENT',1),(26,'pbkdf2_sha256$1200000$tCkdcTS0G9f8z3ELIWiLMI$DACUiIVDlpIRls5XcQk8UlNhtLilNha/NYFuwMSD6Ls=',NULL,0,'shanmugapriya','',0,1,'2026-03-11 08:28:40.752073','20260311864608@gmail.com','STUDENT',1),(27,'pbkdf2_sha256$1200000$EO70IfHTGsvZVMrkU0gqkM$L2ES1OCac8A3i6jM1rUBSzqBTe/oXTpjVW7+C2YoM58=',NULL,0,'saravanan','',0,1,'2026-03-11 08:28:50.766474','saranyasar@gmail.com','PARENT',1),(28,'pbkdf2_sha256$1200000$EO70IfHTGsvZVMrkU0gqkM$L2ES1OCac8A3i6jM1rUBSzqBTe/oXTpjVW7+C2YoM58=',NULL,0,'saranya','',0,1,'2026-03-11 08:28:50.768350','20260311337567@gmail.com','STUDENT',1),(29,'pbkdf2_sha256$1200000$dTKqMHoe9lNecLk8hp4at1$S+B8ED9e8KDcQM7uZ56C/X+lySYrpHKWKItdfzzAlco=',NULL,0,'hari','',0,1,'2026-03-11 08:29:01.728852','shrihari@gmail.com','PARENT',1),(30,'pbkdf2_sha256$1200000$dTKqMHoe9lNecLk8hp4at1$S+B8ED9e8KDcQM7uZ56C/X+lySYrpHKWKItdfzzAlco=',NULL,0,'shri','',0,1,'2026-03-11 08:29:01.731262','20260311606968@gmail.com','STUDENT',1),(31,'pbkdf2_sha256$1200000$ViFnibXtJEVCkaApS2Nu1O$BpbomAqG/t2lx2Q0RySraDJGmtENdsf8mNwC5FxNJP4=',NULL,0,'shri','',0,1,'2026-03-11 08:29:03.057509','20260311562100@gmail.com','STUDENT',1),(32,'pbkdf2_sha256$1200000$8UQcfU6iqAGadE8NxcvAOX$vUgXkHikJXs6v41IyT2tj1FfCpirKPPtiFgkO+WQ1z0=',NULL,0,'saravanan','',0,1,'2026-03-11 08:29:16.533988','shivasaravanan@gmail.com','PARENT',1),(33,'pbkdf2_sha256$1200000$8UQcfU6iqAGadE8NxcvAOX$vUgXkHikJXs6v41IyT2tj1FfCpirKPPtiFgkO+WQ1z0=',NULL,0,'shivadu','',0,1,'2026-03-11 08:29:16.535988','20260311243343@gmail.com','STUDENT',1),(34,'pbkdf2_sha256$1200000$MNIe9ArSrbZKZxP4NbSfnC$o78+AdUisrLmKtPk8V/4lYUbV7Z4mp2UC/yx793+BQc=',NULL,0,'joseph','',0,1,'2026-03-11 08:29:26.547466','josephrayana@gmail.com','PARENT',1),(35,'pbkdf2_sha256$1200000$MNIe9ArSrbZKZxP4NbSfnC$o78+AdUisrLmKtPk8V/4lYUbV7Z4mp2UC/yx793+BQc=',NULL,0,'rayana','',0,1,'2026-03-11 08:29:26.550385','20260311256676@gmail.com','STUDENT',1),(36,'pbkdf2_sha256$1200000$vm8xujHfvRLUuP9HLifCDW$ByrAUpDq2PZHL0ZdFN5/09/pb/Dy9vyK6jbulQL01HU=',NULL,0,'bala','',0,1,'2026-03-11 08:29:38.301229','nithyabala@gmail.com','PARENT',1),(37,'pbkdf2_sha256$1200000$vm8xujHfvRLUuP9HLifCDW$ByrAUpDq2PZHL0ZdFN5/09/pb/Dy9vyK6jbulQL01HU=',NULL,0,'nithya','',0,1,'2026-03-11 08:29:38.303184','20260311280281@gmail.com','STUDENT',1),(38,'pbkdf2_sha256$1200000$tlNniSC7MhTInS4dRuZlnn$CaFEiHHnZhp39yh3oAR01BmMmKO21xK09p4f1x5hcxE=',NULL,0,'mariyamma','',0,1,'2026-03-11 08:29:55.002799','mariyammaniv@gmail.com','PARENT',1),(39,'pbkdf2_sha256$1200000$tlNniSC7MhTInS4dRuZlnn$CaFEiHHnZhp39yh3oAR01BmMmKO21xK09p4f1x5hcxE=',NULL,0,'nivetha','',0,1,'2026-03-11 08:29:55.005260','20260311888841@gmail.com','STUDENT',1),(40,'pbkdf2_sha256$1200000$vHze600jFrFoofdqh6Hb58$Ic3O5Ws7Cw/NXnMO9ZSyxnGqiFXTKBYWZAZSIhyeMEw=',NULL,0,'vinoth','',0,1,'2026-03-11 08:31:09.622411','kumarvin@gmail.com','PARENT',1),(41,'pbkdf2_sha256$1200000$vHze600jFrFoofdqh6Hb58$Ic3O5Ws7Cw/NXnMO9ZSyxnGqiFXTKBYWZAZSIhyeMEw=',NULL,0,'kumar','',0,1,'2026-03-11 08:31:09.624662','20260311268795@gmail.com','STUDENT',1),(42,'pbkdf2_sha256$1200000$GoGAvJga5tD3GkCP9w8pJv$9CnWhs4yWGRxRXMWLjTQiT6FDJqtFTTfoeH7s5pQ4ZQ=',NULL,0,'karan','',0,1,'2026-03-11 08:31:19.738950','divakaran@gmail.com','PARENT',1),(43,'pbkdf2_sha256$1200000$GoGAvJga5tD3GkCP9w8pJv$9CnWhs4yWGRxRXMWLjTQiT6FDJqtFTTfoeH7s5pQ4ZQ=',NULL,0,'diva','',0,1,'2026-03-11 08:31:19.740885','20260311332978@gmail.com','STUDENT',1),(44,'pbkdf2_sha256$1200000$TKDHcmO0vBieiZgIZeT0kN$mduscsmV51OKy7qOellBoBsZaiKdIqRBhtwIM3e4GQA=',NULL,0,'balamurugan','',0,1,'2026-03-11 08:31:26.511794','roshmurugan@gmail.com','PARENT',1),(45,'pbkdf2_sha256$1200000$TKDHcmO0vBieiZgIZeT0kN$mduscsmV51OKy7qOellBoBsZaiKdIqRBhtwIM3e4GQA=',NULL,0,'rosh','',0,1,'2026-03-11 08:31:26.514190','20260311982373@gmail.com','STUDENT',1),(46,'pbkdf2_sha256$1200000$TiX62FPkBA9ChdECtoPoK1$cT2tYZ1YYBaS0pHxbyTgeMlSiIV6E9a9eyIYsCkeX1o=',NULL,0,'das','',0,1,'2026-03-11 08:31:34.938263','immanuveldas@gmail.com','PARENT',1),(47,'pbkdf2_sha256$1200000$TiX62FPkBA9ChdECtoPoK1$cT2tYZ1YYBaS0pHxbyTgeMlSiIV6E9a9eyIYsCkeX1o=',NULL,0,'mariya','',0,1,'2026-03-11 08:31:34.939686','20260311291742@gmail.com','STUDENT',1),(48,'pbkdf2_sha256$1200000$bbjx5T0nS5HafgyeXweQnr$ygPDpCSZr6XaYVAkaY2QOKnn8tbFmdFaZsfekiQi58E=',NULL,0,'barathi','',0,1,'2026-03-11 08:31:40.947293','vijya@gmail.com','PARENT',1),(49,'pbkdf2_sha256$1200000$bbjx5T0nS5HafgyeXweQnr$ygPDpCSZr6XaYVAkaY2QOKnn8tbFmdFaZsfekiQi58E=',NULL,0,'vijya','',0,1,'2026-03-11 08:31:40.951170','20260311976300@gmail.com','STUDENT',1),(50,'pbkdf2_sha256$1200000$6PONb5CuoQSVEnDQQDToMX$bB23hA2AAq77+vs3G1KD6Cak2rxMSZ/69hojLwnImWk=',NULL,0,'logeshwari','',0,1,'2026-03-11 08:31:49.109233','logeshwarielu@gmail.com','PARENT',1),(51,'pbkdf2_sha256$1200000$6PONb5CuoQSVEnDQQDToMX$bB23hA2AAq77+vs3G1KD6Cak2rxMSZ/69hojLwnImWk=',NULL,0,'elumalai','',0,1,'2026-03-11 08:31:49.111351','20260311915424@gmail.com','STUDENT',1),(52,'pbkdf2_sha256$1200000$lD0k9Wg9EOrv4ryTEekQX8$UdJskZ0uwFLEftLUBwQ8T+sFt7D2hSs1Ap8M8J4Gq2o=',NULL,0,'sharmi','',0,1,'2026-03-11 08:31:55.264178','chitrasharmi@gmail.com','PARENT',1),(53,'pbkdf2_sha256$1200000$lD0k9Wg9EOrv4ryTEekQX8$UdJskZ0uwFLEftLUBwQ8T+sFt7D2hSs1Ap8M8J4Gq2o=',NULL,0,'chitra','',0,1,'2026-03-11 08:31:55.266668','20260311133992@gmail.com','STUDENT',1),(54,'pbkdf2_sha256$1200000$X8s9daAK4nzE9FqFU5nVQp$APa8rLPkE6ZaaYE+e3ih3mBTgJGZwgNko3RXb90qLfk=',NULL,0,'Christopher Rodges','',0,1,'2026-03-11 08:32:02.775057','financhristopher@gmail.com','PARENT',1),(55,'pbkdf2_sha256$1200000$X8s9daAK4nzE9FqFU5nVQp$APa8rLPkE6ZaaYE+e3ih3mBTgJGZwgNko3RXb90qLfk=',NULL,0,'Finan','',0,1,'2026-03-11 08:32:02.777296','20260311958927@gmail.com','STUDENT',1),(56,'pbkdf2_sha256$1200000$RjWxMzCj2s3sKTswsSqmN6$F+hMFg8l+ZxG6NVnt5AEf8U/nh8MqDwVCiO2wX2wlpo=',NULL,0,'gopal','',0,1,'2026-03-11 08:32:12.711090','sharmigopal@gmail.com','PARENT',1),(57,'pbkdf2_sha256$1200000$RjWxMzCj2s3sKTswsSqmN6$F+hMFg8l+ZxG6NVnt5AEf8U/nh8MqDwVCiO2wX2wlpo=',NULL,0,'sharmila','',0,1,'2026-03-11 08:32:12.713118','20260311136947@gmail.com','STUDENT',1),(58,'pbkdf2_sha256$1200000$GTHdElovzdtVlBDcCkJyIC$rA0QIL2CklvAyc1yX8btv2ULzh4w/1ignSjCmU5rrbI=',NULL,0,'Lingam','',0,1,'2026-03-11 08:34:01.181936','lmoorthy147@gmail.com','PARENT',1),(59,'pbkdf2_sha256$1200000$GTHdElovzdtVlBDcCkJyIC$rA0QIL2CklvAyc1yX8btv2ULzh4w/1ignSjCmU5rrbI=',NULL,0,'Yogesh','',0,1,'2026-03-11 08:34:01.184323','20260311601522@gmail.com','STUDENT',1),(60,'pbkdf2_sha256$1200000$qTC9tGMBPjFxtolS89Gy49$NPDagbVAgBfAc4cJbT5LGywzklk9ZHfW9eELaroZj+A=',NULL,0,'messi','',0,1,'2026-03-11 08:36:32.470559','messi12@gmail.com','PARENT',1),(61,'pbkdf2_sha256$1200000$qTC9tGMBPjFxtolS89Gy49$NPDagbVAgBfAc4cJbT5LGywzklk9ZHfW9eELaroZj+A=',NULL,0,'kiran','',0,1,'2026-03-11 08:36:32.472727','20260311585384@gmail.com','STUDENT',1);
/*!40000 ALTER TABLE `accounts_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_groups`
--

DROP TABLE IF EXISTS `accounts_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_groups`
--

LOCK TABLES `accounts_customuser_groups` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_customuser_user_permissions`
--

DROP TABLE IF EXISTS `accounts_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser_user_permissions`
--

LOCK TABLES `accounts_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_customuser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add class',10,'add_class'),(26,'Can change class',10,'change_class'),(27,'Can delete class',10,'delete_class'),(28,'Can view class',10,'view_class'),(29,'Can add subject',18,'add_subject'),(30,'Can change subject',18,'change_subject'),(31,'Can delete subject',18,'delete_subject'),(32,'Can view subject',18,'view_subject'),(33,'Can add admission application',7,'add_admissionapplication'),(34,'Can change admission application',7,'change_admissionapplication'),(35,'Can delete admission application',7,'delete_admissionapplication'),(36,'Can view admission application',7,'view_admissionapplication'),(37,'Can add exam',11,'add_exam'),(38,'Can change exam',11,'change_exam'),(39,'Can delete exam',11,'delete_exam'),(40,'Can view exam',11,'view_exam'),(41,'Can add section',16,'add_section'),(42,'Can change section',16,'change_section'),(43,'Can delete section',16,'delete_section'),(44,'Can view section',16,'view_section'),(45,'Can add homework',12,'add_homework'),(46,'Can change homework',12,'change_homework'),(47,'Can delete homework',12,'delete_homework'),(48,'Can view homework',12,'view_homework'),(49,'Can add attendance session',9,'add_attendancesession'),(50,'Can change attendance session',9,'change_attendancesession'),(51,'Can delete attendance session',9,'delete_attendancesession'),(52,'Can view attendance session',9,'view_attendancesession'),(53,'Can add student',17,'add_student'),(54,'Can change student',17,'change_student'),(55,'Can delete student',17,'delete_student'),(56,'Can view student',17,'view_student'),(57,'Can add homework submission',13,'add_homeworksubmission'),(58,'Can change homework submission',13,'change_homeworksubmission'),(59,'Can delete homework submission',13,'delete_homeworksubmission'),(60,'Can view homework submission',13,'view_homeworksubmission'),(61,'Can add question paper',15,'add_questionpaper'),(62,'Can change question paper',15,'change_questionpaper'),(63,'Can delete question paper',15,'delete_questionpaper'),(64,'Can view question paper',15,'view_questionpaper'),(65,'Can add teacher subject assignment',19,'add_teachersubjectassignment'),(66,'Can change teacher subject assignment',19,'change_teachersubjectassignment'),(67,'Can delete teacher subject assignment',19,'delete_teachersubjectassignment'),(68,'Can view teacher subject assignment',19,'view_teachersubjectassignment'),(69,'Can add attendance record',8,'add_attendancerecord'),(70,'Can change attendance record',8,'change_attendancerecord'),(71,'Can delete attendance record',8,'delete_attendancerecord'),(72,'Can view attendance record',8,'view_attendancerecord'),(73,'Can add mark',14,'add_mark'),(74,'Can change mark',14,'change_mark'),(75,'Can delete mark',14,'delete_mark'),(76,'Can view mark',14,'view_mark');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-02-26 09:01:01.745115','1','Pre-KG',1,'[{\"added\": {}}]',10,1),(2,'2026-02-26 09:01:06.007834','2','LKG',1,'[{\"added\": {}}]',10,1),(3,'2026-02-26 09:01:17.625371','1','Pre-KG - A',1,'[{\"added\": {}}]',16,1),(4,'2026-02-26 09:01:23.292995','2','Pre-KG - B',1,'[{\"added\": {}}]',16,1),(5,'2026-02-26 09:01:35.539046','1','TAMIL',1,'[{\"added\": {}}]',18,1),(6,'2026-02-26 09:02:30.636425','2','principal@gmail.com',1,'[{\"added\": {}}]',6,1),(7,'2026-02-26 09:02:33.564233','2','principal@gmail.com',2,'[]',6,1),(8,'2026-02-26 09:02:57.747900','3','teacher@gmail.com',1,'[{\"added\": {}}]',6,1),(9,'2026-02-26 09:03:16.397453','1','MId_Sem - Pre-KG',1,'[{\"added\": {}}]',11,1),(10,'2026-02-26 09:03:54.350326','1','teacher@gmail.com - TAMIL - Pre-KG - A',1,'[{\"added\": {}}]',19,1),(11,'2026-02-27 09:34:29.179295','3','Mariya',2,'[]',7,1),(12,'2026-02-27 09:34:33.746403','3','Mariya',2,'[]',7,1),(13,'2026-02-27 09:35:14.878052','1','Pre-KG',2,'[]',10,1),(14,'2026-02-27 09:42:39.677739','3','Mariya',3,'',7,1),(15,'2026-02-27 09:43:18.004029','10','20260227944236@gmail.com',3,'',6,1),(16,'2026-02-28 05:22:36.026149','2','mdx - Pre-KG',2,'[]',12,1),(17,'2026-02-28 05:27:07.018471','2','vinodh',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(18,'2026-02-28 05:27:12.964460','5','Mariya',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(19,'2026-02-28 05:27:15.809500','2','vinodh',2,'[]',7,1),(20,'2026-02-28 05:27:18.008502','5','Mariya',2,'[]',7,1),(21,'2026-02-28 05:27:26.624629','4','Achu',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(22,'2026-02-28 05:27:31.336624','1','Roshine',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(23,'2026-02-28 05:27:35.697965','5','Mariya',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(24,'2026-03-01 10:55:41.752696','4','LKG - A',1,'[{\"added\": {}}]',16,1),(25,'2026-03-04 09:07:45.496928','4','1',1,'[{\"added\": {}}]',10,1),(26,'2026-03-04 09:07:48.471888','5','2',1,'[{\"added\": {}}]',10,1),(27,'2026-03-04 09:07:50.845574','6','3',1,'[{\"added\": {}}]',10,1),(28,'2026-03-04 09:07:54.852326','7','4',1,'[{\"added\": {}}]',10,1),(29,'2026-03-04 09:07:58.610618','8','5',1,'[{\"added\": {}}]',10,1),(30,'2026-03-04 09:08:01.164838','9','6',1,'[{\"added\": {}}]',10,1),(31,'2026-03-04 09:08:03.769097','10','7',1,'[{\"added\": {}}]',10,1),(32,'2026-03-04 09:08:06.369270','11','8',1,'[{\"added\": {}}]',10,1),(33,'2026-03-04 09:08:08.935584','12','9',1,'[{\"added\": {}}]',10,1),(34,'2026-03-04 09:08:12.348527','13','10',1,'[{\"added\": {}}]',10,1),(35,'2026-03-04 09:08:14.874000','14','11',1,'[{\"added\": {}}]',10,1),(36,'2026-03-04 09:08:17.853211','15','12',1,'[{\"added\": {}}]',10,1),(37,'2026-03-04 09:08:37.992062','5','LKG - B',1,'[{\"added\": {}}]',16,1),(38,'2026-03-04 09:08:45.770408','6','UKG - A',1,'[{\"added\": {}}]',16,1),(39,'2026-03-04 09:08:54.941715','7','UKG - B',1,'[{\"added\": {}}]',16,1),(40,'2026-03-04 09:09:01.872885','8','1 - A',1,'[{\"added\": {}}]',16,1),(41,'2026-03-04 09:09:07.213510','9','1 - B',1,'[{\"added\": {}}]',16,1),(42,'2026-03-04 09:09:19.443273','10','2 - A',1,'[{\"added\": {}}]',16,1),(43,'2026-03-04 09:09:25.896669','11','2 - B',1,'[{\"added\": {}}]',16,1),(44,'2026-03-04 09:09:31.024929','12','3 - A',1,'[{\"added\": {}}]',16,1),(45,'2026-03-04 09:09:36.913506','13','3 - B',1,'[{\"added\": {}}]',16,1),(46,'2026-03-04 09:09:49.878364','14','4 - A',1,'[{\"added\": {}}]',16,1),(47,'2026-03-04 09:09:58.499492','15','4 - B',1,'[{\"added\": {}}]',16,1),(48,'2026-03-04 09:10:04.686145','16','5 - A',1,'[{\"added\": {}}]',16,1),(49,'2026-03-04 09:10:10.970265','17','5 - B',1,'[{\"added\": {}}]',16,1),(50,'2026-03-04 09:10:16.064721','18','6 - A',1,'[{\"added\": {}}]',16,1),(51,'2026-03-04 09:10:21.855469','19','6 - B',1,'[{\"added\": {}}]',16,1),(52,'2026-03-04 09:10:26.901033','20','7 - A',1,'[{\"added\": {}}]',16,1),(53,'2026-03-04 09:10:31.911633','21','7 - B',1,'[{\"added\": {}}]',16,1),(54,'2026-03-04 09:10:38.288725','22','8 - A',1,'[{\"added\": {}}]',16,1),(55,'2026-03-04 09:10:43.600572','23','8 - B',1,'[{\"added\": {}}]',16,1),(56,'2026-03-04 09:10:47.864624','24','9 - A',1,'[{\"added\": {}}]',16,1),(57,'2026-03-04 09:10:52.887191','25','9 - B',1,'[{\"added\": {}}]',16,1),(58,'2026-03-04 09:10:57.831436','26','10 - A',1,'[{\"added\": {}}]',16,1),(59,'2026-03-04 09:11:02.053619','27','10 - B',1,'[{\"added\": {}}]',16,1),(60,'2026-03-04 09:11:07.906570','28','11 - A',1,'[{\"added\": {}}]',16,1),(61,'2026-03-04 09:11:14.228072','29','11 - B',1,'[{\"added\": {}}]',16,1),(62,'2026-03-04 09:11:19.198441','30','12 - A',1,'[{\"added\": {}}]',16,1),(63,'2026-03-04 09:11:24.681957','31','12 - B',1,'[{\"added\": {}}]',16,1),(64,'2026-03-04 09:11:36.883141','2','ENGLISH',1,'[{\"added\": {}}]',18,1),(65,'2026-03-04 09:11:48.534083','3','MATHEMATICS',1,'[{\"added\": {}}]',18,1),(66,'2026-03-04 09:11:53.307558','4','SCIENCE',1,'[{\"added\": {}}]',18,1),(67,'2026-03-04 09:12:02.591288','5','SOCIAL SCIENCE',1,'[{\"added\": {}}]',18,1),(68,'2026-03-11 08:34:31.623396','31','Yogesh',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'academics','admissionapplication'),(8,'academics','attendancerecord'),(9,'academics','attendancesession'),(10,'academics','class'),(11,'academics','exam'),(12,'academics','homework'),(13,'academics','homeworksubmission'),(14,'academics','mark'),(15,'academics','questionpaper'),(16,'academics','section'),(17,'academics','student'),(18,'academics','subject'),(19,'academics','teachersubjectassignment'),(6,'accounts','customuser'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-02-26 08:59:43.675635'),(2,'contenttypes','0002_remove_content_type_name','2026-02-26 08:59:43.730288'),(3,'auth','0001_initial','2026-02-26 08:59:43.868354'),(4,'auth','0002_alter_permission_name_max_length','2026-02-26 08:59:43.916545'),(5,'auth','0003_alter_user_email_max_length','2026-02-26 08:59:43.918061'),(6,'auth','0004_alter_user_username_opts','2026-02-26 08:59:43.926917'),(7,'auth','0005_alter_user_last_login_null','2026-02-26 08:59:43.931532'),(8,'auth','0006_require_contenttypes_0002','2026-02-26 08:59:43.932081'),(9,'auth','0007_alter_validators_add_error_messages','2026-02-26 08:59:43.938456'),(10,'auth','0008_alter_user_username_max_length','2026-02-26 08:59:43.943493'),(11,'auth','0009_alter_user_last_name_max_length','2026-02-26 08:59:43.948228'),(12,'auth','0010_alter_group_name_max_length','2026-02-26 08:59:43.959958'),(13,'auth','0011_update_proxy_permissions','2026-02-26 08:59:43.966200'),(14,'auth','0012_alter_user_first_name_max_length','2026-02-26 08:59:43.970724'),(15,'accounts','0001_initial','2026-02-26 08:59:44.178458'),(16,'academics','0001_initial','2026-02-26 08:59:45.182655'),(17,'admin','0001_initial','2026-02-26 08:59:45.264884'),(18,'admin','0002_logentry_remove_auto_add','2026-02-26 08:59:45.284712'),(19,'admin','0003_logentry_add_action_flag_choices','2026-02-26 08:59:45.293703'),(20,'sessions','0001_initial','2026-02-26 08:59:45.321247'),(21,'academics','0002_remove_exam_class_obj_remove_exam_date_and_more','2026-02-26 09:22:45.196136'),(22,'academics','0003_remove_mark_marks_obtained_remove_mark_teacher_and_more','2026-02-26 09:24:02.831878'),(23,'academics','0004_section_class_teacher','2026-02-26 18:31:09.395083'),(24,'academics','0005_admissionapplication_section','2026-02-28 05:26:53.974398'),(25,'academics','0006_alter_homeworksubmission_homework_and_more','2026-02-28 06:13:00.574793');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('tyukya1gsl0kn22ic68mq5r978cafhko','.eJxVjLsOAiEUBf-F2hBeEbC09xsI94GsGkiW3cr474ZkC23PzJy3SHnfatoHr2khcRFWnH43yPjkNgE9crt3ib1t6wJyKvKgQ9468et6uH8HNY86a3W2QYENRTF7dqRQF2u1Ud4HryNGBiqoyUAJwXnUHokR2ZocHZD4fAHmlziU:1w0FM2:KdqzcPe4WGfwL-ySHH_J8EYR2SbGfoXxjFlLwoy-nI8','2026-03-25 08:55:46.568376');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-11 15:01:33
