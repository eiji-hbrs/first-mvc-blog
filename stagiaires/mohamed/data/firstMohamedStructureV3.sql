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


-- -----------------------------------------------------
-- Table `firstMohamed`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firstMohamed`.`article` ;

CREATE TABLE IF NOT EXISTS `firstMohamed`.`article` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` VARCHAR(45) NOT NULL,
  `date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `published` TINYINT UNSIGNED NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_article_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `firstMohamed`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_article_user_idx` ON `firstMohamed`.`article` (`user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `firstMohamed`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firstMohamed`.`category` ;

CREATE TABLE IF NOT EXISTS `firstMohamed`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `id_UNIQUE` ON `firstMohamed`.`category` (`id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `firstMohamed`.`article_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firstMohamed`.`article_has_category` ;

CREATE TABLE IF NOT EXISTS `firstMohamed`.`article_has_category` (
  `article_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`article_id`, `category_id`),
  CONSTRAINT `fk_article_has_category_article1`
    FOREIGN KEY (`article_id`)
    REFERENCES `firstMohamed`.`article` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_article_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `firstMohamed`.`category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_article_has_category_category1_idx` ON `firstMohamed`.`article_has_category` (`category_id` ASC) VISIBLE;

CREATE INDEX `fk_article_has_category_article1_idx` ON `firstMohamed`.`article_has_category` (`article_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
