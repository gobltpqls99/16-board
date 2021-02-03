-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.23 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- sb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `sb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sb`;

-- 테이블 sb.auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `auth` (
  `uid` int unsigned DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `FK_auth_board` FOREIGN KEY (`uid`) REFERENCES `board` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.auth:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;

-- 테이블 sb.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `orifile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `savefile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `readnum` int unsigned NOT NULL DEFAULT '0',
  `uid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.board:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`id`, `title`, `content`, `writer`, `created`, `orifile`, `savefile`, `readnum`, `uid`) VALUES
	(2, '1', '<p>111111111111111</p>\r\n<p><strong>111</strong></p>', '1111', NULL, NULL, NULL, 1, 1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 sb.board_ip 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_ip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `wdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  CONSTRAINT `FK_board-ip_board` FOREIGN KEY (`bid`) REFERENCES `board` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.board_ip:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board_ip` DISABLE KEYS */;
INSERT INTO `board_ip` (`id`, `ip`, `wdate`, `bid`) VALUES
	(1, '::1', '2021-02-03 17:48:21', 2),
	(2, '::1', '2021-02-03 17:49:17', 2),
	(3, '::1', '2021-02-03 17:49:23', 2),
	(4, '::1', '2021-02-03 17:49:27', 2);
/*!40000 ALTER TABLE `board_ip` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
