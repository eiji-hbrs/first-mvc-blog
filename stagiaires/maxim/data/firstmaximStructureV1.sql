-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema firstmaxim
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `firstmaxim` ;

-- -----------------------------------------------------
-- Schema firstmaxim
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `firstmaxim` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `firstmaxim` ;

-- -----------------------------------------------------
-- Table `firstmaxim`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firstmaxim`.`user` ;

CREATE TABLE IF NOT EXISTS `firstmaxim`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id par defaut\nobligatoire mais',
  `username` VARCHAR(30) NOT NULL COMMENT 'unique',
  `email` VARCHAR(120) NOT NULL COMMENT 'mail de l\'utilisateur\n',
  `realname` VARCHAR(60) NULL,
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'mot de passe haché sera géré par PHP\nchangement de case il doit etre case sentitive\nvoir password hash() et password\npour avenir\n',
  `actif` TINYINT NULL DEFAULT 0 COMMENT 'basé sur 1 octet donc 256 possibilité\n\n0 => inscrit non validé par mail\n1=> actif grâce au mail',
  `uniqid` CHAR(59) NULL,
  `usercol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `user_name_UNIQUE` ON `firstmaxim`.`user` (`username` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
