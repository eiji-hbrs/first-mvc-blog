-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema first-eiji
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `first-eiji` ;

-- -----------------------------------------------------
-- Schema first-eiji
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `first-eiji` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `first-eiji` ;

-- -----------------------------------------------------
-- Table `first-eiji`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `first-eiji`.`user` ;

CREATE TABLE IF NOT EXISTS `first-eiji`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id par défault\nObligatoire mais',
  `userName` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_ai_ci' NOT NULL COMMENT 'Identifiant Unique non numérique (id)',
  `email` VARCHAR(120) NOT NULL,
  `realName` VARCHAR(60) NULL,
  `pwd` VARCHAR(255) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_0900_as_cs' NOT NULL COMMENT 'Mot de passe hachée sera géré par PHP\nChangement de case, il dot être case sensitive\nVoir passeword() \n255 caractère pour l\'avenir',
  `actif` TINYINT NULL DEFAULT 0 COMMENT 'Basé sur un octet, donc 256 possibilitées\n0 => inscrit non validé par mail\n1 => actif grâce au mail',
  `uniquid` CHAR(59) NULL,
  `usercol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `user_name_UNIQUE` ON `first-eiji`.`user` (`userName` ASC) VISIBLE;

CREATE UNIQUE INDEX `actif_UNIQUE` ON `first-eiji`.`user` (`actif` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `first-eiji`.`article`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `first-eiji`.`article` ;

CREATE TABLE IF NOT EXISTS `first-eiji`.`article` (
  `id` INT NOT NULL,
  `title` VARCHAR(100) NULL,
  `date` DATETIME NULL,
  `published` TINYINT UNSIGNED NULL COMMENT 'valeur de 0 à 255\n0 => non publié\n1 => publié\n2 => caché',
  `articlecol` VARCHAR(45) NULL,
  `user_id` INT UNSIGNED NOT NULL COMMENT 'un article ne peut avoir un seul user ',
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_article_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `first-eiji`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_article_user_idx` ON `first-eiji`.`article` (`user_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
