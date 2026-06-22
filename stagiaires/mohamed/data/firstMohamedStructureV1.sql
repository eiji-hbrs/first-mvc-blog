-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema firstMohamed
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `firstMohamed` ;

-- -----------------------------------------------------
-- Schema firstMohamed
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `firstMohamed` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `firstMohamed` ;

-- -----------------------------------------------------
-- Table `firstMohamed`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firstMohamed`.`user` ;

CREATE TABLE IF NOT EXISTS `firstMohamed`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id par défaut',
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(120) NOT NULL,
  `realname` VARCHAR(60) NULL,
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL,
  `actif` TINYINT NULL,
  `userid` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `username_UNIQUE` ON `firstMohamed`.`user` (`username` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
