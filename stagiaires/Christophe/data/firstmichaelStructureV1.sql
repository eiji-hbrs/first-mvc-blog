-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema firstmichael
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `firstmichael` ;

-- -----------------------------------------------------
-- Schema firstmichael
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `firstmichael` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `firstmichael` ;

-- -----------------------------------------------------
-- Table `firstmichael`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firstmichael`.`user` ;

CREATE TABLE IF NOT EXISTS `firstmichael`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id par défaut\nobligatoire mais autoincrément\nunsigned',
  `username` VARCHAR(30) NOT NULL COMMENT 'Pour se connecter',
  `email` VARCHAR(120) NOT NULL COMMENT 'mail de user',
  `realname` VARCHAR(60) NULL,
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'Mot de passe haché, sera géré par PHP\nchangement de case, il doit être case sensitive (cs)\nVoir password_hash() et password_verify()\n255 carcatères pour avenir',
  `actif` TINYINT NULL DEFAULT 0 COMMENT 'basé sur 1 octet, donc 256 posibilités\n\n0 => inscrit non validé par mail\n1 => actif grâce au mail \n2 => bannie',
  `uniqid` CHAR(59) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `username_UNIQUE` ON `firstmichael`.`user` (`username` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
