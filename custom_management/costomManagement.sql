-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.9.1-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- dump1 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `dump1` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `dump1`;

-- 테이블 dump1.account 구조 내보내기
CREATE TABLE IF NOT EXISTS `account` (
  `BUSI_NUM` char(20) NOT NULL COMMENT '사업자번호(P.K)',
  `FACTORY` char(20) DEFAULT NULL COMMENT '사무소',
  `TRADE_BANK` char(20) DEFAULT NULL COMMENT '거래은행',
  `ACCOUNT_NUM` char(20) DEFAULT NULL COMMENT '계좌번호',
  PRIMARY KEY (`BUSI_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 dump1.custom 구조 내보내기
CREATE TABLE IF NOT EXISTS `custom` (
  `BUSI_NUM` char(20) NOT NULL COMMENT '사업자번호(P.K)',
  `CUSTOM` char(20) NOT NULL COMMENT '거래처명',
  `SHORT` char(20) DEFAULT NULL COMMENT '약칭',
  `CEO` char(10) DEFAULT NULL COMMENT '대표자',
  `CHARGE_PERSON` char(10) DEFAULT NULL COMMENT '담당자',
  `BUSI_CONDITION` char(10) DEFAULT NULL COMMENT '업태',
  `ITEM` char(10) DEFAULT NULL COMMENT '종목',
  `POST_NUM` char(10) DEFAULT NULL COMMENT '우편번호',
  `ADDR1` varchar(80) DEFAULT NULL COMMENT '주소1',
  `ADDR2` varchar(80) DEFAULT NULL COMMENT '주소2',
  `TEL` char(10) DEFAULT NULL COMMENT '전화번호',
  `FAX` char(10) DEFAULT NULL COMMENT '팩스번호',
  `HOMEPAGE` char(20) DEFAULT NULL COMMENT '홈페이지',
  `CO_YN` char(1) DEFAULT NULL COMMENT '과세여부',
  `FOREIGN_YN` char(1) DEFAULT NULL COMMENT '해외여부',
  `TAX_YN` char(1) DEFAULT NULL COMMENT '과세구분',
  `COUNTRY_ENG` char(20) DEFAULT NULL COMMENT '국가_영문',
  `COUNTRY_KOR` char(20) DEFAULT NULL COMMENT '국가_한글',
  `SPECIAL_RELATION` char(1) DEFAULT NULL COMMENT '특수관계자',
  `TRADE_STOP` char(1) DEFAULT NULL COMMENT '거래중지',
  `CONTRACT_PERIOD_S` date DEFAULT NULL COMMENT '계약기간(시작)',
  `CONTRACT_PERIOD_E` date DEFAULT NULL COMMENT '계약기간(끝)',
  `REGI_INFO_MAN` char(10) DEFAULT NULL COMMENT '등록정보(등록인)',
  `REGI_INFO_DATE` date DEFAULT NULL COMMENT '등록정보(등록날짜)',
  `MODI_INFO_MAN` char(10) DEFAULT NULL COMMENT '변경정보(변경인)',
  `MODI_INFO_DATE` date DEFAULT NULL COMMENT '변경정보(변경날짜)',
  PRIMARY KEY (`BUSI_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
