-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema firstirina
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `firstirina` ;

-- -----------------------------------------------------
-- Schema firstirina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `firstirina` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `firstirina` ;

-- -----------------------------------------------------
-- Table `firstirina`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firstirina`.`user` ;

CREATE TABLE IF NOT EXISTS `firstirina`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL COMMENT 'identifiant Uniqur non numerique(id)',
  `email` VARCHAR(120) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'Mot de passe haché, sera géré par PHP\nchangement de case , il doit etre case sensitive',
  `realname` VARCHAR(60) NULL,
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'Mot de passe hache sera gere par PHP\nchangement de case, il doit etre case sensetive(cs)\nvoir password_hash() et password\n',
  `actif` TINYINT NULL DEFAULT 0 COMMENT 'base sur 1 octet, donc 256 posibilités\n0=> inscrit non validé par mail\n1=>actif grace au mail\n2=>barrier',
  `usercol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `username_UNIQUE` ON `firstirina`.`user` (`username` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
