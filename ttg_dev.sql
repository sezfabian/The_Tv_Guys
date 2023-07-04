-- Drop database
DROP DATABASE IF EXISTS ttg_dev_db;

-- Create database + user if doesn't exist
CREATE DATABASE IF NOT EXISTS ttg_dev_db;
CREATE USER IF NOT EXISTS 'ttg_dev'@'localhost';
SET PASSWORD FOR 'ttg_dev'@'localhost' = '2011cp';
GRANT ALL PRIVILEGES ON ttg_dev_db.* TO 'ttg_dev'@'localhost';
GRANT SELECT ON performance_schema.* TO 'ttg_dev'@'localhost';
FLUSH PRIVILEGES;

USE ttg_dev_db;

-- create users table
CREATE TABLE IF NOT EXISTS `Users`
(
 `id`       INT NOT NULL AUTO_INCREMENT ,
 `created_at`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `updated_at`    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `User_name`     VARCHAR(45) NOT NULL ,
 `User_mail`     VARCHAR(45) NOT NULL ,
 `User_phone`    VARCHAR(15) NOT NULL ,
 `User_pass`     VARCHAR(45) NOT NULL ,
 `User_address`  VARCHAR(255) ,
 `User_pin`      VARCHAR(255) ,
 `Date_of_birth` DATE ,

PRIMARY KEY (`id`)
);

-- create categories table
CREATE TABLE IF NOT EXISTS `Categories`
(
 `id`  INT NOT NULL AUTO_INCREMENT ,
 `created_at`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `updated_at`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `Category_name` VARCHAR(45) NOT NULL ,

PRIMARY KEY (`id`)
);

-- create subcategories table
CREATE TABLE IF NOT EXISTS `Sub_categories`
(
 `id`   INT NOT NULL AUTO_INCREMENT ,
 `Sub_cat_name` VARCHAR(45) NOT NULL ,
 `Category_id` INT NOT NULL ,
 `created_at`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `updated_at`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,

PRIMARY KEY (`id`),
KEY `FK_1` (`Category_id`),
CONSTRAINT `FK_1` FOREIGN KEY (`Category_id`) REFERENCES `Categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Products`
(
 `id`           INT NOT NULL AUTO_INCREMENT ,
 `Name`         VARCHAR(45) NOT NULL ,
 `Description`  VARCHAR(255) ,
 `Cost`         FLOAT NOT NULL ,
 `Price`        FLOAT NOT NULL ,
 `Brand`        VARCHAR(45) ,
 `Size`         VARCHAR(45) ,
 `Os`           VARCHAR(45) ,
 `Dimensions`   VARCHAR(45) ,
 `Resolution`   VARCHAR(45) ,
 `Warranty`     INT ,
 `Design`       VARCHAR(45) ,
 `Sub_cat_id`   INT ,
 `Category_id`  INT ,
 `Image`        VARCHAR(255) ,
 `Created_at`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `Updated_at`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `Stock`        INT ,

PRIMARY KEY (`id`),
KEY `FK_1` (`Sub_cat_id`),
CONSTRAINT `FK_2` FOREIGN KEY (`Sub_cat_id`) REFERENCES `Sub_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
KEY `FK_2` (`Category_id`),
CONSTRAINT `FK_4` FOREIGN KEY (`Category_id`) REFERENCES `Categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);

-- create orders table
CREATE TABLE `Orders`
(
 `Order_id`     INT NOT NULL AUTO_INCREMENT ,
 `User_id`      INT NOT NULL ,
 `Order_time`   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 `Order_closed` ENUM('yes', 'no') NOT NULL ,
 `Total`        FLOAT ,
 `Paid`         FLOAT ,
 `Balance`      FLOAT AS (Total - Paid) ,

PRIMARY KEY (`Order_id`),
KEY `FK_1` (`User_id`),
CONSTRAINT `FK_3` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`)
);

-- create order_items junction table
CREATE TABLE `Order_items`
(
 `Cart_id`  INT NOT NULL AUTO_INCREMENT ,
 `Order_id` INT NOT NULL ,
 `Prod_id`  INT NOT NULL ,
 `Quantity` INT NOT NULL ,

PRIMARY KEY (`Cart_id`),
KEY `FK_1` (`Order_id`),
CONSTRAINT `FK_5` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`Order_id`) ON DELETE CASCADE,
KEY `FK_2` (`Prod_id`), 
CONSTRAINT `FK_6` FOREIGN KEY (`Prod_id`) REFERENCES `Products` (`Prod_id`)
);

-- create payment modes table
CREATE TABLE `Payment_modes`
(
 `Mode_id`     INT NOT NULL AUTO_INCREMENT ,
 `Mode_name`   VARCHAR(45) NOT NULL ,
 `Description` VARCHAR(255) NOT NULL ,

PRIMARY KEY (`Mode_id`)
);

-- create payments table
CREATE TABLE `Payments`
(
 `Payment_id` INT NOT NULL AUTO_INCREMENT ,
 `User_id`    INT NOT NULL ,
 `Mode_id`    INT NOT NULL ,
 `Reference`  VARCHAR(45) NOT NULL ,
 `Amount`     FLOAT NOT NULL ,
 `Order_id`   INT NOT NULL ,
 `Status`     ENUM('complete', 'pending') NOT NULL,

PRIMARY KEY (`Payment_id`),
KEY `FK_1` (`User_id`),
KEY `FK_2` (`Mode_id`),
KEY `FK_3` (`Order_id`),
CONSTRAINT `FK_12` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
CONSTRAINT `FK_13` FOREIGN KEY (`Mode_id`) REFERENCES `Payment_modes` (`Mode_id`),
CONSTRAINT `FK_14` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`Order_id`)
);

-- create reviews table
CREATE TABLE `Reviews`
(
 `Review_id` int NOT NULL AUTO_INCREMENT ,
 `User_id`   int NOT NULL ,
 `Prod_id`   int NOT NULL ,
 `Rating`    TINYINT UNSIGNED NOT NULL ,
 `Comments`  varbinary(255) ,

PRIMARY KEY (`Review_id`),
KEY `FK_1` (`User_id`),
KEY `FK_2` (`Prod_id`),
CONSTRAINT `FK_7` FOREIGN KEY (`User_id`) REFERENCES `Users` (`User_id`),
CONSTRAINT `FK_8` FOREIGN KEY (`Prod_id`) REFERENCES `Products` (`Prod_id`)
);
