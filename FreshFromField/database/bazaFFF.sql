-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fresh_from_fields
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fresh_from_fields
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fresh_from_fields` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `fresh_from_fields` ;

-- -----------------------------------------------------
-- Table `fresh_from_fields`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`user` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(40) NOT NULL,
  `password` LONGTEXT NOT NULL,
  `first_name` VARCHAR(20) NULL DEFAULT NULL,
  `last_name` VARCHAR(20) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `country` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(40) NOT NULL,
  `membershipStartDate` DATETIME(6) NOT NULL,
  `last_login` DATETIME(6) NOT NULL,
  `is_superuser` TINYINT(1) NOT NULL,
  `is_staff` TINYINT(1) NOT NULL,
  `is_active` TINYINT(1) NOT NULL,
  `date_joined` DATETIME(6) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`adminuser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`adminuser` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`adminuser` (
  `userId` INT NOT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `adminuser_userId_4498ae56_fk_user_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `fresh_from_fields`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`auth_group`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`auth_group` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`auth_group` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`django_content_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`django_content_type` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`django_content_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `app_label` VARCHAR(100) NOT NULL,
  `model` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label` ASC, `model` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`auth_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`auth_permission` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`auth_permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `content_type_id` INT NOT NULL,
  `codename` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id` ASC, `codename` ASC) VISIBLE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `fresh_from_fields`.`django_content_type` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`auth_group_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`auth_group_permissions` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`auth_group_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `group_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `fresh_from_fields`.`auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `fresh_from_fields`.`auth_group` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`seller`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`seller` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`seller` (
  `userId` INT NOT NULL,
  `numberOfListings` INT NULL DEFAULT NULL,
  `rating` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `seller_userId_8e3f3cfa_fk_user_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `fresh_from_fields`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`chat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`chat` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`chat` (
  `chatId` INT NOT NULL AUTO_INCREMENT,
  `user1` INT NOT NULL,
  `user2` INT NOT NULL,
  PRIMARY KEY (`chatId`),
  INDEX `chat_user2_9db0acf7_fk_seller_userId` (`user2` ASC) VISIBLE,
  INDEX `chat_user1_7a0ed44b_fk_user_userId` (`user1` ASC) VISIBLE,
  CONSTRAINT `chat_user1_7a0ed44b_fk_user_userId`
    FOREIGN KEY (`user1`)
    REFERENCES `fresh_from_fields`.`user` (`userId`),
  CONSTRAINT `chat_user2_9db0acf7_fk_seller_userId`
    FOREIGN KEY (`user2`)
    REFERENCES `fresh_from_fields`.`seller` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`customer` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`customer` (
  `userId` INT NOT NULL,
  `rating` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `customer_userId_fc6305d9_fk_user_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `fresh_from_fields`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`django_admin_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`django_admin_log` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`django_admin_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `action_time` DATETIME(6) NOT NULL,
  `object_id` LONGTEXT NULL DEFAULT NULL,
  `object_repr` VARCHAR(200) NOT NULL,
  `action_flag` SMALLINT UNSIGNED NOT NULL,
  `change_message` LONGTEXT NOT NULL,
  `content_type_id` INT NULL DEFAULT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id` ASC) VISIBLE,
  INDEX `django_admin_log_user_id_c564eba6_fk_user_userId` (`user_id` ASC) VISIBLE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co`
    FOREIGN KEY (`content_type_id`)
    REFERENCES `fresh_from_fields`.`django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userId`
    FOREIGN KEY (`user_id`)
    REFERENCES `fresh_from_fields`.`user` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`django_migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`django_migrations` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`django_migrations` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `app` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `applied` DATETIME(6) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`django_session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`django_session` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`django_session` (
  `session_key` VARCHAR(40) NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `expire_date` DATETIME(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  INDEX `django_session_expire_date_a5c62663` (`expire_date` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`listing`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`listing` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`listing` (
  `listingId` INT NOT NULL AUTO_INCREMENT,
  `price` INT NULL DEFAULT NULL,
  `listingName` VARCHAR(30) NULL DEFAULT NULL,
  `unit` VARCHAR(30) NULL DEFAULT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `description` VARCHAR(2000) NULL DEFAULT NULL,
  `type` VARCHAR(30) NULL DEFAULT NULL,
  `date_added` DATETIME(6) NOT NULL,
  `image` LONGBLOB NULL DEFAULT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`listingId`),
  INDEX `listing_userId_72c211b8_fk_seller_userId` (`userId` ASC) VISIBLE,
  CONSTRAINT `listing_userId_72c211b8_fk_seller_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `fresh_from_fields`.`seller` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`favorite_listings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`favorite_listings` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`favorite_listings` (
  `favid` INT NOT NULL AUTO_INCREMENT,
  `listingId` INT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`favid`),
  INDEX `favorite_listings_listingId_fb48edb3_fk_listing_listingId` (`listingId` ASC) VISIBLE,
  INDEX `favorite_listings_userId_ecd7dfca_fk_user_userId` (`userId` ASC) VISIBLE,
  CONSTRAINT `favorite_listings_listingId_fb48edb3_fk_listing_listingId`
    FOREIGN KEY (`listingId`)
    REFERENCES `fresh_from_fields`.`listing` (`listingId`),
  CONSTRAINT `favorite_listings_userId_ecd7dfca_fk_user_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `fresh_from_fields`.`user` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`message` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`message` (
  `messageId` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(500) NULL DEFAULT NULL,
  `dateAndTime` TIME NULL DEFAULT NULL,
  `chatId` INT NOT NULL,
  `sender` INT NOT NULL,
  PRIMARY KEY (`messageId`),
  INDEX `message_chatId_e9e4fd58_fk_chat_chatId` (`chatId` ASC) VISIBLE,
  INDEX `message_sender_fd9674f2_fk_user_userId` (`sender` ASC) VISIBLE,
  CONSTRAINT `message_chatId_e9e4fd58_fk_chat_chatId`
    FOREIGN KEY (`chatId`)
    REFERENCES `fresh_from_fields`.`chat` (`chatId`),
  CONSTRAINT `message_sender_fd9674f2_fk_user_userId`
    FOREIGN KEY (`sender`)
    REFERENCES `fresh_from_fields`.`user` (`userId`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`reservation` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`reservation` (
  `listingId` INT NOT NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`listingId`),
  UNIQUE INDEX `reservation_listingId_userId_2f7cfce1_uniq` (`listingId` ASC, `userId` ASC) VISIBLE,
  INDEX `reservation_userId_f11b51e2_fk_customer_userId` (`userId` ASC) VISIBLE,
  CONSTRAINT `reservation_listingId_3f5d0e9a_fk_listing_listingId`
    FOREIGN KEY (`listingId`)
    REFERENCES `fresh_from_fields`.`listing` (`listingId`),
  CONSTRAINT `reservation_userId_f11b51e2_fk_customer_userId`
    FOREIGN KEY (`userId`)
    REFERENCES `fresh_from_fields`.`customer` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`user_groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`user_groups` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`user_groups` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_groups_user_id_group_id_40beef00_uniq` (`user_id` ASC, `group_id` ASC) VISIBLE,
  INDEX `user_groups_group_id_b76f8aba_fk_auth_group_id` (`group_id` ASC) VISIBLE,
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id`
    FOREIGN KEY (`group_id`)
    REFERENCES `fresh_from_fields`.`auth_group` (`id`),
  CONSTRAINT `user_groups_user_id_abaea130_fk_user_userId`
    FOREIGN KEY (`user_id`)
    REFERENCES `fresh_from_fields`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fresh_from_fields`.`user_user_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`user_user_permissions` ;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`user_user_permissions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `user_user_permissions_user_id_permission_id_7dc6e2e0_uniq` (`user_id` ASC, `permission_id` ASC) VISIBLE,
  INDEX `user_user_permission_permission_id_9deb68a3_fk_auth_perm` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm`
    FOREIGN KEY (`permission_id`)
    REFERENCES `fresh_from_fields`.`auth_permission` (`id`),
  CONSTRAINT `user_user_permissions_user_id_ed4a47ea_fk_user_userId`
    FOREIGN KEY (`user_id`)
    REFERENCES `fresh_from_fields`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Tabela `fresh_from_fields`.`rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fresh_from_fields`.`rating`;

CREATE TABLE IF NOT EXISTS `fresh_from_fields`.`rating` (
  `ratingId` INT NOT NULL AUTO_INCREMENT,
  `user1` INT NOT NULL,
  `user2` INT NOT NULL,
  `rating` DECIMAL(3,1) NOT NULL,
  PRIMARY KEY (`ratingId`),
  CONSTRAINT `rating_user1_userId_fk_user_userId`
    FOREIGN KEY (`user1`)
    REFERENCES `fresh_from_fields`.`user` (`userId`),
  CONSTRAINT `rating_user2_userId_fk_user_userId`
    FOREIGN KEY (`user2`)
    REFERENCES `fresh_from_fields`.`user` (`userId`),
  CHECK (`rating` BETWEEN 1 AND 5)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
INSERT INTO fresh_from_fields.user (username, password, email, membershipStartDate, last_login, is_superuser, is_staff, is_active, date_joined)
VALUES 
('nikola', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'kova@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 1, 1, 1, '2024-05-01 12:00:00'),
('maxim', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'maxim@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 1, 1, 1, '2024-05-01 12:00:00'),
('djole', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'djole@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 1, 1, 1, '2024-05-01 12:00:00'),
('marko', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'mare@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 1, 1, 1, '2024-05-01 12:00:00'),
('user1', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user1@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user2', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user2@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user3', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user3@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user4', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user4@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user5', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user5@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user6', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user6@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user7', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user7@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user8', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user8@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user9', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user9@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user10', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user10@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00'),
('user11', 'pbkdf2_sha256$600000$gnMlPUNWrH4kzsCHKcFpJt$Z4dNxvYl7LWwU2vDnnuEA0F0GQ/1ZcutW+er26IRUKk=', 'user11@email.com', '2024-05-01 12:00:00', '2024-05-01 12:00:00', 0, 0, 1, '2024-05-01 12:00:00');


-- Dodavanje admin korisnika (adminuser)
INSERT INTO fresh_from_fields.adminuser (userId)
VALUES (1), (2), (3), (4); 

-- Dodavanje prodavaca (seller)
INSERT INTO fresh_from_fields.seller (userId, numberOfListings, rating)
VALUES 
(1,0, 0.0),(2,0, 0.0),(3,0, 0.0),(4,0, 0.0),(6, 1, 4.5), (7, 1, 4.0), (8, 1, 4.2), (5, 1, 4.8);

-- Dodavanje kupaca (customer)
INSERT INTO fresh_from_fields.customer (userId, rating)
VALUES 
(1, 0.0),(2, 0.0),(3, 0.0),(4, 0.0), (9, 4.8), (10, 3.5), (11, 4.0);

-- Dodavanje listinga (listing)
INSERT INTO fresh_from_fields.listing (price, listingName, unit, quantity, description, type, date_added, image, userId)
VALUES 
(100, 'Jabuke', 'din/kg', 50, 'Jako lepe jabuke', 'Voće', '2024-05-02 10:00:00', NULL, 6),
(200, 'Jagode', 'din/kg', 100, 'jako lepe jagode', 'Voće', '2024-05-03 11:00:00', NULL, 7),
(100, 'Sargarepe', 'din/kg', 50, 'jako lepe sargarepe', 'Povrće', '2024-05-02 10:00:00', NULL, 5),
(200, 'Paprike', 'din/kg', 100, 'crvene Paprike', 'Povrće', '2024-05-03 11:00:00', NULL, 8);
-- Dodajte još listinga prema potrebi ...

-- Dodavanje omiljenih listinga (favorite_listings)
INSERT INTO fresh_from_fields.favorite_listings (listingId, userId)
VALUES 
(1, 9), (1, 10), (2,11), (2, 10);
