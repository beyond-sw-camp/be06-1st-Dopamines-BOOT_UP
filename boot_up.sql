-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 119.192.172.145    Database: boot_up
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `nickname` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `status` tinyint NOT NULL,
  `last_connection` datetime NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin@naver.com','1q2w3e4r!','박경숙','박경숙 매니저','2024-05-22 02:33:02','2024-05-22 02:33:02','01089891212',1,'2024-05-22 02:33:02');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmark` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `market_board_idx` bigint NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `bookmark_ibfk_2` (`user_idx`),
  KEY `bookmark_ibfk_1_idx` (`market_board_idx`),
  CONSTRAINT `bookmark_ibfk_1` FOREIGN KEY (`market_board_idx`) REFERENCES `market_board` (`idx`),
  CONSTRAINT `bookmark_ibfk_2` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendar` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `course_num` int DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `calendar_ibfk_1` (`course_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatting_room`
--

DROP TABLE IF EXISTS `chatting_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatting_room` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `response_user_idx` bigint NOT NULL,
  `request_user_idx` bigint NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `chatting_room_ibfk_1` (`response_user_idx`),
  KEY `chatting_room_ibfk_2` (`request_user_idx`),
  CONSTRAINT `chatting_room_ibfk_1` FOREIGN KEY (`response_user_idx`) REFERENCES `user` (`idx`),
  CONSTRAINT `chatting_room_ibfk_2` FOREIGN KEY (`request_user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatting_room`
--

LOCK TABLES `chatting_room` WRITE;
/*!40000 ALTER TABLE `chatting_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatting_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_board`
--

DROP TABLE IF EXISTS `free_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_board` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_id` (`user_idx`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_board`
--

LOCK TABLES `free_board` WRITE;
/*!40000 ALTER TABLE `free_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_board_like`
--

DROP TABLE IF EXISTS `free_board_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_board_like` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `user_idx` bigint NOT NULL,
  `free_board_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `free_board_like_ibfk_1_idx` (`user_idx`),
  KEY `free_board_like_ibfk_2` (`free_board_idx`),
  CONSTRAINT `free_board_like_ibfk_1` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`),
  CONSTRAINT `free_board_like_ibfk_2` FOREIGN KEY (`free_board_idx`) REFERENCES `free_board` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_board_like`
--

LOCK TABLES `free_board_like` WRITE;
/*!40000 ALTER TABLE `free_board_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_board_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_comment`
--

DROP TABLE IF EXISTS `free_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_comment` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `free_board_idx` bigint NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `free_comment_ibfk_1` (`free_board_idx`),
  CONSTRAINT `free_comment_ibfk_1` FOREIGN KEY (`free_board_idx`) REFERENCES `free_board` (`idx`),
  CONSTRAINT `free_comment_ibfk_2` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_comment`
--

LOCK TABLES `free_comment` WRITE;
/*!40000 ALTER TABLE `free_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_comment_like`
--

DROP TABLE IF EXISTS `free_comment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_comment_like` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `user_idx` bigint NOT NULL,
  `free_comment_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `free_comment_like_ibfk_2` (`free_comment_idx`),
  CONSTRAINT `free_comment_like_ibfk_1` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`),
  CONSTRAINT `free_comment_like_ibfk_2` FOREIGN KEY (`free_comment_idx`) REFERENCES `free_comment` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_comment_like`
--

LOCK TABLES `free_comment_like` WRITE;
/*!40000 ALTER TABLE `free_comment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_comment_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_recomment`
--

DROP TABLE IF EXISTS `free_recomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_recomment` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `free_comment_idx` bigint NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `free_recomment_ibfk_1` (`free_comment_idx`),
  CONSTRAINT `free_recomment_ibfk_1` FOREIGN KEY (`free_comment_idx`) REFERENCES `free_comment` (`idx`),
  CONSTRAINT `free_recomment_ibfk_2` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_recomment`
--

LOCK TABLES `free_recomment` WRITE;
/*!40000 ALTER TABLE `free_recomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_recomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_recomment_like`
--

DROP TABLE IF EXISTS `free_recomment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `free_recomment_like` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `free_recomment_idx` bigint NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `free_recomment_like_ibfk_1` (`free_recomment_idx`),
  CONSTRAINT `free_recomment_like_ibfk_1` FOREIGN KEY (`free_recomment_idx`) REFERENCES `free_recomment` (`idx`),
  CONSTRAINT `free_recomment_like_ibfk_2` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_recomment_like`
--

LOCK TABLES `free_recomment_like` WRITE;
/*!40000 ALTER TABLE `free_recomment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_recomment_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_board`
--

DROP TABLE IF EXISTS `market_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_board` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `status` tinyint NOT NULL,
  `price` int NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  CONSTRAINT `market_board_ibfk_1` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_board`
--

LOCK TABLES `market_board` WRITE;
/*!40000 ALTER TABLE `market_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `sendtime` datetime NOT NULL,
  `content` text NOT NULL,
  `chatting_room_idx` bigint NOT NULL,
  `sender_idx` bigint NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `chatting_room_idx` (`chatting_room_idx`),
  KEY `sender_idx` (`sender_idx`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`chatting_room_idx`) REFERENCES `chatting_room` (`idx`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`sender_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `contents` text NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `admin_idx` bigint NOT NULL,
  `file` varchar(200) DEFAULT NULL,
  `course_num` int DEFAULT NULL,
  PRIMARY KEY (`idx`),
  KEY `admin_idx_idx` (`admin_idx`),
  CONSTRAINT `admin_idx` FOREIGN KEY (`admin_idx`) REFERENCES `admin` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `contents` text NOT NULL,
  `start_date` date NOT NULL,
  `course_num` int NOT NULL,
  `end_date` date NOT NULL,
  `calendar_idx` int NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `calendar_idx_idx` (`calendar_idx`),
  CONSTRAINT `calendar_idx` FOREIGN KEY (`calendar_idx`) REFERENCES `calendar` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `video` varchar(200) DEFAULT NULL,
  `contents` text NOT NULL,
  `course_num` int NOT NULL,
  `team_name` varchar(30) NOT NULL,
  `member` varchar(100) NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservated_seat`
--

DROP TABLE IF EXISTS `reservated_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservated_seat` (
  `idx` bigint NOT NULL,
  `reservation_idx` bigint NOT NULL,
  `seat_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`) USING BTREE,
  KEY `reservation_idx_idx` (`reservation_idx`),
  KEY `seat_idx_idx` (`seat_idx`),
  CONSTRAINT `reservation_idx` FOREIGN KEY (`reservation_idx`) REFERENCES `reservation` (`idx`),
  CONSTRAINT `seat_idx` FOREIGN KEY (`seat_idx`) REFERENCES `seat` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservated_seat`
--

LOCK TABLES `reservated_seat` WRITE;
/*!40000 ALTER TABLE `reservated_seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservated_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `num_of_mem` int NOT NULL,
  `using_time` int NOT NULL,
  `reserve_time` datetime NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `seat_num` int NOT NULL,
  `floor` int NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `nickname` varchar(10) NOT NULL,
  `role` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `socialLogined` tinyint NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `status` tinyint NOT NULL,
  `course_num` int NOT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'user_visitor@naver.com','qwer1234','비지터','nick_vi','user','2024-05-22 02:27:11','2024-05-22 02:27:11','01012341234','경기도 안양시',0,NULL,NULL,1,0),(2,'user_student@naver.com','qwer1234','수강','nick_st','member','2024-05-22 02:29:37','2024-05-22 02:29:37','01033334444','경기도 화성시',0,NULL,NULL,1,5),(3,'user_gra_student@naver.com','qwer1234','수료','nick_gst','member_g','2024-05-22 02:29:39','2024-05-22 02:29:39','01055556666','경기도 수원시',0,NULL,NULL,1,6);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_board`
--

DROP TABLE IF EXISTS `visitor_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_board` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  CONSTRAINT `visitor_board_ibfk_1` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_board`
--

LOCK TABLES `visitor_board` WRITE;
/*!40000 ALTER TABLE `visitor_board` DISABLE KEYS */;
INSERT INTO `visitor_board` VALUES (2,'안녕하세요','반갑습니다. 처음뵙겠습니다.',NULL,'2024-05-22 02:36:06','2024-05-22 02:36:06',1),(3,'오','처음뵙겠습니다.',NULL,'2024-05-22 02:36:37','2024-05-22 02:36:37',2),(4,'궁금해요','여기 좋아요?',NULL,'2024-05-22 02:36:52','2024-05-22 02:36:52',3);
/*!40000 ALTER TABLE `visitor_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_board_like`
--

DROP TABLE IF EXISTS `visitor_board_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_board_like` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `user_idx` bigint NOT NULL,
  `visitor_board_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `visitor_board_like_ibfk_2` (`visitor_board_idx`),
  CONSTRAINT `visitor_board_like_ibfk_1` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`),
  CONSTRAINT `visitor_board_like_ibfk_2` FOREIGN KEY (`visitor_board_idx`) REFERENCES `visitor_board` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_board_like`
--

LOCK TABLES `visitor_board_like` WRITE;
/*!40000 ALTER TABLE `visitor_board_like` DISABLE KEYS */;
INSERT INTO `visitor_board_like` VALUES (2,2,2),(3,3,2),(4,3,4);
/*!40000 ALTER TABLE `visitor_board_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_comment`
--

DROP TABLE IF EXISTS `visitor_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_comment` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `visitor_board_idx` bigint NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `visitor_comment_ibfk_1` (`visitor_board_idx`),
  CONSTRAINT `visitor_comment_ibfk_1` FOREIGN KEY (`visitor_board_idx`) REFERENCES `visitor_board` (`idx`),
  CONSTRAINT `visitor_comment_ibfk_2` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_comment`
--

LOCK TABLES `visitor_comment` WRITE;
/*!40000 ALTER TABLE `visitor_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_comment_like`
--

DROP TABLE IF EXISTS `visitor_comment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_comment_like` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `user_idx` bigint NOT NULL,
  `comment_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `comment_idx` (`comment_idx`),
  CONSTRAINT `visitor_comment_like_ibfk_1` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`),
  CONSTRAINT `visitor_comment_like_ibfk_2` FOREIGN KEY (`comment_idx`) REFERENCES `visitor_comment` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_comment_like`
--

LOCK TABLES `visitor_comment_like` WRITE;
/*!40000 ALTER TABLE `visitor_comment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor_comment_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_recomment`
--

DROP TABLE IF EXISTS `visitor_recomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_recomment` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `visitor_comment_idx` bigint NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `visitor_recomment_ibfk_1` (`visitor_comment_idx`),
  CONSTRAINT `visitor_recomment_ibfk_1` FOREIGN KEY (`visitor_comment_idx`) REFERENCES `visitor_comment` (`idx`),
  CONSTRAINT `visitor_recomment_ibfk_2` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_recomment`
--

LOCK TABLES `visitor_recomment` WRITE;
/*!40000 ALTER TABLE `visitor_recomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor_recomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor_recomment_like`
--

DROP TABLE IF EXISTS `visitor_recomment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor_recomment_like` (
  `idx` bigint NOT NULL AUTO_INCREMENT,
  `visitor_recomment_idx` bigint NOT NULL,
  `user_idx` bigint NOT NULL,
  PRIMARY KEY (`idx`),
  KEY `user_idx` (`user_idx`),
  KEY `visitor_recomment_like_ibfk_1` (`visitor_recomment_idx`),
  CONSTRAINT `visitor_recomment_like_ibfk_1` FOREIGN KEY (`visitor_recomment_idx`) REFERENCES `visitor_recomment` (`idx`),
  CONSTRAINT `visitor_recomment_like_ibfk_2` FOREIGN KEY (`user_idx`) REFERENCES `user` (`idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_recomment_like`
--

LOCK TABLES `visitor_recomment_like` WRITE;
/*!40000 ALTER TABLE `visitor_recomment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor_recomment_like` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 10:51:02
