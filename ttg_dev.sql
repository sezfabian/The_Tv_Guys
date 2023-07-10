-- Drop database
DROP DATABASE IF EXISTS ttg_dev_db;

-- Create database + user if doesn't exist
CREATE DATABASE IF NOT EXISTS ttg_dev_db;
CREATE USER IF NOT EXISTS 'ttg_dev'@'localhost' IDENTIFIED BY '2011cp';
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
CREATE TABLE IF NOT EXISTS `Orders`
(
 `id`            INT NOT NULL AUTO_INCREMENT ,
 `User_id`       INT NOT NULL ,
 `Order_date`    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 `Total_amount`  FLOAT NOT NULL,
 `Paid amount`   FLOAT,       
 `created_at`    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 `updated_at`    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,

 PRIMARY KEY (`id`),
 KEY `FK_User` (`User_id`),
 CONSTRAINT `FK_User` FOREIGN KEY (`User_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Order_items`
(
  `id`          INT NOT NULL AUTO_INCREMENT,
  `Order_id`    INT NOT NULL,
  `Product_id`  INT NOT NULL,
  `Quantity`    INT NOT NULL,
  `Price`       FLOAT NOT NULL,
  `created_at`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (`id`),
  KEY `FK_Order` (`Order_id`),
  KEY `FK_Product` (`Product_id`),
  CONSTRAINT `FK_Order` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Product` FOREIGN KEY (`Product_id`) REFERENCES `Products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Payments`
(
  `id`           INT NOT NULL AUTO_INCREMENT,
  `Order_id`     INT NOT NULL,
  `Payment_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Amount`       FLOAT NOT NULL,
  `created_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `FK_Order` (`Order_id`),
  CONSTRAINT `FK_Order` FOREIGN KEY (`Order_id`) REFERENCES `Orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS `Product_reviews`
(
  `id`          INT NOT NULL AUTO_INCREMENT,
  `User_id`     INT NOT NULL,
  `Product_id`  INT NOT NULL,
  `Review`      VARCHAR(255) NOT NULL,
  `Rating`      INT NOT NULL,
  `Order_item_id` INT NOT NULL,
  `created_at`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (`id`),
  KEY `FK_User` (`User_id`),
  KEY `FK_Product` (`Product_id`),
  KEY `FK_OrderItem` (`Order_item_id`),
  CONSTRAINT `FK_User` FOREIGN KEY (`User_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Product` FOREIGN KEY (`Product_id`) REFERENCES `Products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_OrderItem` FOREIGN KEY (`Order_item_id`) REFERENCES `Order_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);




