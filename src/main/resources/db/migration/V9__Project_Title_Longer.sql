-- MySQL Workbench Synchronization
-- Generated: 2016-01-19 23:58
-- Model: MMU Mini Project Model
-- Version: 1.0
-- Project: MMU Mini Project Model
-- Author: Emyliana

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `project` 
CHANGE COLUMN `project_title` `project_title` VARCHAR(300) NULL DEFAULT NULL;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
