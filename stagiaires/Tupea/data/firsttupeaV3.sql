-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema firsttupea
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `firsttupea` ;

-- -----------------------------------------------------
-- Schema firsttupea
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `firsttupea` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `firsttupea` ;

-- -----------------------------------------------------
-- Table `firsttupea`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firsttupea`.`user` ;

CREATE TABLE IF NOT EXISTS `firsttupea`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id par défaut ',
  `username` VARCHAR(30) NOT NULL COMMENT 'Identifieant Unique non numerique (id)',
  `email` VARCHAR(120) NOT NULL,
  `realname` VARCHAR(60) NULL,
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL,
  `actif` TINYINT NULL DEFAULT 0,
  `uniqid` VARCHAR(59) NULL COMMENT 'uniqid est créé avec la fonction (true)  de PHP et rajoute des bytes transformés en hexadécimal',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `username_UNIQUE` ON `firsttupea`.`user` (`username` ASC) VISIBLE;

CREATE UNIQUE INDEX `actif_UNIQUE` ON `firsttupea`.`user` (`actif` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `firsttupea`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firsttupea`.`article` ;

CREATE TABLE IF NOT EXISTS `firsttupea`.`article` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titile` VARCHAR(100) NOT NULL,
  `content` TEXT NOT NULL,
  `date` DATETIME NULL,
  `published` TINYINT UNSIGNED NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_article_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `firsttupea`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_article_user_idx` ON `firsttupea`.`article` (`user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `firsttupea`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firsttupea`.`category` ;

CREATE TABLE IF NOT EXISTS `firsttupea`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `description` VARCHAR(400) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firsttupea`.`category_has_article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firsttupea`.`category_has_article` ;

CREATE TABLE IF NOT EXISTS `firsttupea`.`category_has_article` (
  `category_id` INT UNSIGNED NOT NULL,
  `article_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`category_id`, `article_id`),
  CONSTRAINT `fk_category_has_article_category1`
    FOREIGN KEY (`article_id`)
    REFERENCES `firsttupea`.`category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_category_has_article_article1`
    FOREIGN KEY (`category_id`)
    REFERENCES `firsttupea`.`article` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_category_has_article_category1_idx` ON `firsttupea`.`category_has_article` (`article_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
