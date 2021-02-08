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
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `passwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `grade` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.auth:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
INSERT INTO `auth` (`id`, `userid`, `passwd`, `username`, `email`, `created`, `grade`) VALUES
	(1, '01071973595', 'Adltpqls12!', '이세빈', 'gobltpqls99@naver.com', '2021-01-29 15:53:11', 1);
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;

-- 테이블 sb.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `orifile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `savefile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `readnum` int unsigned NOT NULL DEFAULT '0',
  `uid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.board:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`id`, `title`, `content`, `writer`, `created`, `orifile`, `savefile`, `readnum`, `uid`) VALUES
	(1, '최연준 얼굴이 나라다', '', 'YJ', '2021-02-02 09:52:11', 'yj.png', '210202_09-b6ab9cde-3f00-4cde-b1c7-567641151881.png', 1, 0);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 sb.board_ip 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_ip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  CONSTRAINT `FK_board_ip_board` FOREIGN KEY (`bid`) REFERENCES `board` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.board_ip:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board_ip` DISABLE KEYS */;
INSERT INTO `board_ip` (`id`, `ip`, `created`, `bid`) VALUES
	(1, '::1', '0000-00-00 00:00:00', 1);
/*!40000 ALTER TABLE `board_ip` ENABLE KEYS */;

-- 테이블 sb.book 구조 내보내기
CREATE TABLE IF NOT EXISTS `book` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '번호',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '도서명',
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '저자',
  `wdate` datetime NOT NULL COMMENT '등록일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.book:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`id`, `name`, `writer`, `wdate`) VALUES
	(1, '소피의 세계', '요슈타인 가이더', '1889-04-11 00:00:00'),
	(2, 'NANA', 'AI YAZAWA', '1999-04-11 00:00:00'),
	(3, '4대 비극', '셰익스피어', '1779-04-11 00:00:00'),
	(4, '빨간구두', '', '2019-04-11 00:00:00');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;

-- 테이블 sb.city 구조 내보내기
CREATE TABLE IF NOT EXISTS `city` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '순번',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '도시명',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '국가명',
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '도시설명',
  `lat` float unsigned DEFAULT NULL COMMENT '위도',
  `lon` float unsigned DEFAULT NULL COMMENT '경도',
  `population` int unsigned DEFAULT NULL COMMENT '인구수',
  `sdate` datetime DEFAULT NULL COMMENT '도시설립일',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.city:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`id`, `name`, `country`, `summary`, `lat`, `lon`, `population`, `sdate`) VALUES
	(1, 'Seoul', 'Korea', '한국의 수도', 38.5, 127.5, 40000000, '1000-01-01 00:00:00'),
	(2, 'Busan', 'Korea', '한국의 제3의 도시-도로가 좁다. 동백섬도 좋다.', 34.87, 128.73, 2923012, '1200-01-01 00:00:00'),
	(3, 'Incheon', 'Korea', '한국의 제3의 도시-수도권에 위치하고있다.', 37.27, 126.42, 2923000, '1300-01-01 00:00:00'),
	(4, 'abcd', NULL, '내 위에zz', 28, 128, 500000, NULL);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;

-- 테이블 sb.gallery 구조 내보내기
CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `writer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `readnum` int unsigned NOT NULL DEFAULT '0',
  `uid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  CONSTRAINT `FK_gallery_auth` FOREIGN KEY (`uid`) REFERENCES `auth` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 sb.gallery:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` (`id`, `title`, `content`, `writer`, `created`, `readnum`, `uid`) VALUES
	(1, 'aaa', 'aaa', 'aaa', '2021-02-05 12:58:52', 0, 1);
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;

-- 테이블 sb.gallery_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `gallery_file` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `orifile` varchar(255) NOT NULL,
  `savefile` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `gid` (`fid`) USING BTREE,
  CONSTRAINT `FK_gallery_file_gallery` FOREIGN KEY (`fid`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.gallery_file:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gallery_file` DISABLE KEYS */;
INSERT INTO `gallery_file` (`id`, `orifile`, `savefile`, `created`, `fid`) VALUES
	(1, 'aaa', 'aaa', '2021-02-05 12:59:25', 1),
	(2, 'aaa', 'aaa', '2021-02-05 12:59:48', 1);
/*!40000 ALTER TABLE `gallery_file` ENABLE KEYS */;

-- 테이블 sb.gallery_ip 구조 내보내기
CREATE TABLE IF NOT EXISTS `gallery_ip` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `bid` (`bid`) USING BTREE,
  CONSTRAINT `FK_gallery_ip_gallery` FOREIGN KEY (`bid`) REFERENCES `gallery` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 sb.gallery_ip:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `gallery_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_ip` ENABLE KEYS */;

-- 테이블 sb.sessions 구조 내보내기
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 sb.sessions:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
	('zlVlF-qTQmq5bSgBUqDGuyD9fS1QRBy5', 1612863042, '{"cookie":{"originalMaxAge":null,"expires":null,"secure":false,"httpOnly":true,"path":"/"}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
