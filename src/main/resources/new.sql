CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;
USE `mydb`;

DROP TABLE IF EXISTS `mydb`.`coworker`;
DROP TABLE IF EXISTS `mydb`.`subject`;
DROP TABLE IF EXISTS `mydb`.`position`;
DROP TABLE IF EXISTS `mydb`.`academic_degree`;
DROP TABLE IF EXISTS `mydb`.`academic_status`;
DROP TABLE IF EXISTS `mydb`.`type_of_exam`;
DROP TABLE IF EXISTS `mydb`.`coworker_has_subject`;


CREATE TABLE `mydb`.`coworker`
(
    `id`                           INT         NOT NULL AUTO_INCREMENT,
    `name`                         VARCHAR(45) NOT NULL,
    `surname`                      VARCHAR(45) NOT NULL,
    `birthday`                     VARCHAR(45) NOT NULL,
    `experience`                   INT         NOT NULL,
    `position_id`                  INT         NOT NULL,
    `academic_degree_id`           INT         NOT NULL,
    `academic_status_id`           INT         NOT NULL,
    `seria_and_number_of_passport` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
)
    ENGINE = InnoDB;


CREATE TABLE `mydb`.`coworker_has_subject`
(
    `coworker_id` INT NOT NULL,
    `subject_id`  INT NOT NULL,
    PRIMARY KEY (`coworker_id`, subject_id)
)
    ENGINE = InnoDB;



CREATE TABLE `mydb`.`subject`
(
    `id`                 INT         NOT NULL AUTO_INCREMENT,
    `name`               VARCHAR(45) NOT NULL,
    `type_of_exam_id`    INT         NOT NULL,
    `number_of_semester` INT         NOT NULL,
    `code`               VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`position`
-- -----------------------------------------------------
CREATE TABLE `mydb`.`position`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`academic_degree`
-- -----------------------------------------------------
CREATE TABLE `mydb`.`academic_degree`
(
    `id`   INT          NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(225) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
)
    ENGINE = InnoDB;
#

-- -----------------------------------------------------
-- Table `mydb`.`academic_status`
-- -----------------------------------------------------
CREATE TABLE `mydb`.`academic_status`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_of_exam`
-- -----------------------------------------------------
CREATE TABLE `mydb`.`type_of_exam`
(
    `id`   INT         NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
)
    ENGINE = InnoDB;


