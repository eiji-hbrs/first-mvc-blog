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
  `email` VARCHAR(120) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_cs_0900_ai_ci' NOT NULL COMMENT 'Mot de passe haché, sera géré par PHP\nchangement de case , il doit etre case sensitive',
  `realname` VARCHAR(60) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NULL,
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'Mot de passe hache sera gere par PHP\nchangement de case, il doit etre case sensetive(cs)\nvoir password_hash() et password\n',
  `actif` TINYINT NULL DEFAULT 0 COMMENT 'base sur 1 octet, donc 256 posibilités\n0=> inscrit non validé par mail\n1=>actif grace au mail\n2=>barrie',
  `uniqid` CHAR(59) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `username_UNIQUE` ON `firstirina`.`user` (`username` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `firstirina`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firstirina`.`article` ;

CREATE TABLE IF NOT EXISTS `firstirina`.`article` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `content` TEXT NOT NULL,
  `date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Temps du serveur actuel: CURRENT_TIMESTAMP ou NOW()',
  `published` TINYINT UNSIGNED NULL,
  `user_id` INT UNSIGNED NOT NULL COMMENT 'Un article ne peut avoir 1 seul user',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_article_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `firstirina`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_article_user_idx` ON `firstirina`.`article` (`user_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
