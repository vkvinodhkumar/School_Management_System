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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_admissionapplication`
--

LOCK TABLES `academics_admissionapplication` WRITE;
/*!40000 ALTER TABLE `academics_admissionapplication` DISABLE KEYS */;
INSERT INTO `academics_admissionapplication` VALUES (1,'Roshine','Bala Murugan','balamurugan@gmail.com','APPROVED','20260226399155','2026-02-26 09:04:05.944067',1,1),(2,'vinodh','ponnambala jothi','ponnambalajothi@gmail.com','APPROVED','20260227403277','2026-02-26 19:04:56.484581',1,1),(4,'Achu','das','das@gmail.com','APPROVED','20260227287151','2026-02-27 09:16:40.375048',1,1),(5,'Mariya','das','das@gmail.com','APPROVED','20260227889070','2026-02-27 09:43:52.603975',1,2),(6,'sharmi','gopal','gopal@gmail.com','REJECTED',NULL,'2026-02-28 05:31:44.881358',1,NULL),(7,'jagan','Padmanaban','abc@gmail.com','PENDING',NULL,'2026-03-01 09:42:38.439873',3,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_class`
--

LOCK TABLES `academics_class` WRITE;
/*!40000 ALTER TABLE `academics_class` DISABLE KEYS */;
INSERT INTO `academics_class` VALUES (1,'Pre-KG'),(2,'LKG'),(3,'UKG');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_homework`
--

LOCK TABLES `academics_homework` WRITE;
/*!40000 ALTER TABLE `academics_homework` DISABLE KEYS */;
INSERT INTO `academics_homework` VALUES (1,'sam','homework_files/ppt.pdf','2026-03-06','2026-02-26 09:06:18.511720',1,3,1,1),(2,'mdx','homework_files/report.pdf','2026-03-13','2026-02-27 10:12:36.145181',1,3,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_section`
--

LOCK TABLES `academics_section` WRITE;
/*!40000 ALTER TABLE `academics_section` DISABLE KEYS */;
INSERT INTO `academics_section` VALUES (1,'A',1,NULL),(2,'B',1,NULL),(4,'A',2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_student`
--

LOCK TABLES `academics_student` WRITE;
/*!40000 ALTER TABLE `academics_student` DISABLE KEYS */;
INSERT INTO `academics_student` VALUES (1,'Roshine','20260226399155',1,5,1,4),(2,'vinodh','20260227403277',1,7,1,6),(3,'Achu','20260227287151',1,9,1,8),(4,'Mariya','20260227889070',1,9,1,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academics_subject`
--

LOCK TABLES `academics_subject` WRITE;
/*!40000 ALTER TABLE `academics_subject` DISABLE KEYS */;
INSERT INTO `academics_subject` VALUES (1,'TAMIL');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_customuser`
--

LOCK TABLES `accounts_customuser` WRITE;
/*!40000 ALTER TABLE `accounts_customuser` DISABLE KEYS */;
INSERT INTO `accounts_customuser` VALUES (1,'pbkdf2_sha256$1200000$CFf13ri20dB3lmRMHXomj3$tGfjW3v2zOKQJ71R6ZEG9cwLoD3E56JLLlW9/Yynuy8=','2026-03-01 10:55:24.322503',1,'','',1,1,'2026-02-26 09:00:20.249178','admin@gmail.com','ADMIN',0),(2,'pbkdf2_sha256$1200000$7EnbP58pfCRIHKlIjLFqqV$2/wiSTEn5v9Ua0500klZsdngw8d2Wp5yzr1Lcy7/h/I=','2026-03-01 09:41:38.522735',0,'vijay','raj',1,1,'2026-02-26 09:02:29.956213','principal@gmail.com','PRINCIPAL',1),(3,'pbkdf2_sha256$1200000$kS0T6kTZPIVTTsnDscEsFo$li496P2WDbqTzTqV5ogKarJm0HcKK34XV1zyUrLBSxw=','2026-03-01 09:55:15.431266',0,'ramar','',1,1,'2026-02-26 09:02:57.086201','teacher@gmail.com','TEACHER',1),(4,'pbkdf2_sha256$1200000$hNEGzLf8hpS7eBMqrEy7RT$iww2XIbVnRppyF9mJj2TsdMj8uZPaoFFiiDVe15JB5k=','2026-03-01 09:49:18.009583',0,'Roshine','',0,1,'2026-02-26 09:04:30.417817','20260226399155@gmail.com','STUDENT',0),(5,'pbkdf2_sha256$1200000$3T7H6arwsjibcDcWgnLhGk$qV8BMMD81aDdooeQIOX5kAYKIVb1H7lQ4qZ6aM6JcM8=','2026-02-27 12:12:30.549011',0,'Bala Murugan','',0,1,'2026-02-26 09:04:30.419707','balamurugan@gmail.com','PARENT',0),(6,'pbkdf2_sha256$1200000$3P4r2x0VVKnEgC5bdjr5yp$oomR1cu05z7omw1wjzgxzQlAXDbpJ91dgTNOs9a/pzs=',NULL,0,'vinodh','',0,1,'2026-02-26 19:16:59.250204','20260227403277@gmail.com','STUDENT',1),(7,'pbkdf2_sha256$1200000$3P4r2x0VVKnEgC5bdjr5yp$oomR1cu05z7omw1wjzgxzQlAXDbpJ91dgTNOs9a/pzs=',NULL,0,'ponnambala jothi','',0,1,'2026-02-26 19:16:59.257581','ponnambalajothi@gmail.com','PARENT',1),(8,'pbkdf2_sha256$1200000$B28qMcFGSjwz0lEnmtNJMr$bgp5037jeR45wq0/v1WD0U4Wolp2LwvtpFqvYOkgTXc=','2026-02-27 09:23:35.154823',0,'Achu','',0,1,'2026-02-27 09:17:06.291260','20260227287151@gmail.com','STUDENT',0),(9,'pbkdf2_sha256$1200000$EK832ePHVQDEAlxPOq6EVH$QdoWmE/PPal9Q5Li2ix+CaKz4lFlAXydrIKyCGfkHnc=','2026-02-27 09:45:28.986545',0,'das','',0,1,'2026-02-27 09:17:06.294260','das@gmail.com','PARENT',0),(12,'pbkdf2_sha256$1200000$sQZNcx5sVElQhy9zNe2h6C$L9plCNWIuYzg//p7gX9iwU14F7KG4Sfld93vWYmWNaM=',NULL,0,'Mariya','',0,1,'2026-02-27 09:44:08.509202','20260227889070@gmail.com','STUDENT',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-02-26 09:01:01.745115','1','Pre-KG',1,'[{\"added\": {}}]',10,1),(2,'2026-02-26 09:01:06.007834','2','LKG',1,'[{\"added\": {}}]',10,1),(3,'2026-02-26 09:01:17.625371','1','Pre-KG - A',1,'[{\"added\": {}}]',16,1),(4,'2026-02-26 09:01:23.292995','2','Pre-KG - B',1,'[{\"added\": {}}]',16,1),(5,'2026-02-26 09:01:35.539046','1','TAMIL',1,'[{\"added\": {}}]',18,1),(6,'2026-02-26 09:02:30.636425','2','principal@gmail.com',1,'[{\"added\": {}}]',6,1),(7,'2026-02-26 09:02:33.564233','2','principal@gmail.com',2,'[]',6,1),(8,'2026-02-26 09:02:57.747900','3','teacher@gmail.com',1,'[{\"added\": {}}]',6,1),(9,'2026-02-26 09:03:16.397453','1','MId_Sem - Pre-KG',1,'[{\"added\": {}}]',11,1),(10,'2026-02-26 09:03:54.350326','1','teacher@gmail.com - TAMIL - Pre-KG - A',1,'[{\"added\": {}}]',19,1),(11,'2026-02-27 09:34:29.179295','3','Mariya',2,'[]',7,1),(12,'2026-02-27 09:34:33.746403','3','Mariya',2,'[]',7,1),(13,'2026-02-27 09:35:14.878052','1','Pre-KG',2,'[]',10,1),(14,'2026-02-27 09:42:39.677739','3','Mariya',3,'',7,1),(15,'2026-02-27 09:43:18.004029','10','20260227944236@gmail.com',3,'',6,1),(16,'2026-02-28 05:22:36.026149','2','mdx - Pre-KG',2,'[]',12,1),(17,'2026-02-28 05:27:07.018471','2','vinodh',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(18,'2026-02-28 05:27:12.964460','5','Mariya',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(19,'2026-02-28 05:27:15.809500','2','vinodh',2,'[]',7,1),(20,'2026-02-28 05:27:18.008502','5','Mariya',2,'[]',7,1),(21,'2026-02-28 05:27:26.624629','4','Achu',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(22,'2026-02-28 05:27:31.336624','1','Roshine',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(23,'2026-02-28 05:27:35.697965','5','Mariya',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',7,1),(24,'2026-03-01 10:55:41.752696','4','LKG - A',1,'[{\"added\": {}}]',16,1);
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

-- Dump completed on 2026-03-01 17:26:32
