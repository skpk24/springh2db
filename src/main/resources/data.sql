DROP TABLE IF EXISTS billionaires;
 
CREATE TABLE billionaires (
  id INT AUTO_INCREMENT  PRIMARY KEY,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
  career VARCHAR(250) DEFAULT NULL
);
 
INSERT INTO billionaires (first_name, last_name, career) VALUES
  ('Aliko', 'Dangote', 'Billionaire Industrialist'),
  ('Bill', 'Gates', 'Billionaire Tech Entrepreneur'),
  ('Folrunsho', 'Alakija', 'Billionaire Oil Magnate');
  
  
DROP TABLE IF EXISTS SHOPPING_LIST_ITEM ;
DROP TABLE IF EXISTS SHOPPING_LIST;
DROP TABLE IF EXISTS ORDER_ITEM ;
DROP TABLE IF EXISTS ORDER_HEADER ;
DROP TABLE IF EXISTS SHOPPING_CART_ITEM ;
DROP TABLE IF EXISTS SHOPPING_CART ;
DROP TABLE IF EXISTS USER_LOGIN  ;
DROP TABLE IF EXISTS PRODUCT_CATEGORY_MEMBER ;
DROP TABLE IF EXISTS PRODUCT_CATEGORY ;
DROP TABLE IF EXISTS PRODUCT;  

CREATE TABLE IF NOT EXISTS user_login (
	`user_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`username` VARCHAR(250) NOT NULL,
	`password` VARCHAR(250) NOT NULL,
	`first_name` VARCHAR(250) NOT NULL,
	`last_name` VARCHAR(250) NOT NULL,
	`parent_user_id` INT(11) UNSIGNED,
	`wallet` DECIMAL(20,2) UNSIGNED DEFAULT 0.0,
	`is_loggedin` CHAR(1) NOT NULL,
	`category_code` VARCHAR(250) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS `product_category` (
	`product_category_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`primary_parent_category_id` INT(11) UNSIGNED DEFAULT NULL,
	`category_name` VARCHAR(100) DEFAULT NULL,
	`description` VARCHAR(255) DEFAULT NULL,
	`category_image_url` VARCHAR(2000) DEFAULT NULL,
	CONSTRAINT `prod_ctgry_parent` FOREIGN KEY (`primary_parent_category_id`) REFERENCES `product_category` (`product_category_id`)
);

CREATE TABLE IF NOT EXISTS `product` (
	`product_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`product_name` VARCHAR(255) DEFAULT NULL,
	`description` VARCHAR(1000) DEFAULT NULL,
	`img_url` VARCHAR(1000) DEFAULT NULL,
	`price` DECIMAL(20,2) UNSIGNED DEFAULT NULL,
	`inventory` INT(3) NOT NULL
);

CREATE TABLE IF NOT EXISTS `product_category_member` (
	`product_category_member_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`product_category_id` INT(11) UNSIGNED NOT NULL ,
	`product_id` INT(11) UNSIGNED NOT NULL ,
	`sequence_num` DECIMAL(20,0) DEFAULT NULL,
	CONSTRAINT `prod_cmbr_category` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`product_category_id`),
	CONSTRAINT `prod_cmbr_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);

CREATE TABLE IF NOT EXISTS `shopping_list` (
	`shopping_list_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`user_id` INT(11) UNSIGNED NOT NULL,
	`list_name` VARCHAR(100) DEFAULT NULL,
	`description` VARCHAR(255) DEFAULT NULL,
	`is_public` CHAR(1) DEFAULT NULL,
	`is_active` CHAR(1) DEFAULT NULL,
	`category_code` VARCHAR(250) NOT NULL,
	CONSTRAINT `SHLIST_PTY` FOREIGN KEY (`user_id`) REFERENCES `user_login` (`user_id`)
);

CREATE TABLE IF NOT EXISTS `shopping_list_item` (
  `shopping_list_item_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `shopping_list_id` INT(11) UNSIGNED NOT NULL,
  `product_id` INT(11) UNSIGNED NOT NULL,
  CONSTRAINT `SHLST_ITEM` FOREIGN KEY (`shopping_list_id`) REFERENCES `shopping_list` (`shopping_list_id`),
  CONSTRAINT `SHLST_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);
 
CREATE TABLE IF NOT EXISTS `shopping_cart` (
	`shopping_cart_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`user_id` INT(11) UNSIGNED NOT NULL,
	`sub_total` DECIMAL(20,2) DEFAULT NULL,
	`grand_total` DECIMAL(20,2) DEFAULT NULL,
	CONSTRAINT `SHCRT_USER` FOREIGN KEY (`user_id`) REFERENCES `user_login` (`user_id`)
);
 
CREATE TABLE IF NOT EXISTS `shopping_cart_item` (
  `shopping_cart_item_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `shopping_cart_id` INT(11) UNSIGNED NOT NULL,
  `product_id` INT(11) UNSIGNED NOT NULL,
  `quantity` INT(4) NOT NULL,
  `unit_price` DECIMAL(20,2) DEFAULT NULL,
  CONSTRAINT `SHCRT_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `SHCRT_SHCRT_ITEM` FOREIGN KEY (`shopping_cart_id`) REFERENCES `shopping_cart` (`shopping_cart_id`)
);


CREATE TABLE IF NOT EXISTS `order_header` (
	`order_header_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`external_id` VARCHAR(20) DEFAULT NULL,
	`transaction_id` VARCHAR(20) DEFAULT NULL,
	`ref_id` VARCHAR(20) DEFAULT NULL,
	`pay_num` INT(2) DEFAULT '1',
	`order_name` VARCHAR(100) DEFAULT NULL,
	`user_id` INT(11) UNSIGNED NOT NULL,
	`status` INT(1) UNSIGNED DEFAULT NULL,
	`order_date` DATETIME DEFAULT NULL,
	`currency_uom` VARCHAR(3) DEFAULT NULL,
	`shopping_cart_id` VARCHAR(20) DEFAULT NULL,
	`remaining_sub_total` DECIMAL(18,2) DEFAULT NULL,
	`grand_total` DECIMAL(18,2) DEFAULT NULL,
	`is_viewed` CHAR(1) DEFAULT NULL,
	CONSTRAINT `ORDER_HDR_USR` FOREIGN KEY (`user_id`) REFERENCES `user_login` (`user_id`)
);

CREATE TABLE IF NOT EXISTS `order_item` (
	`order_item_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`order_header_id` INT(11) UNSIGNED NOT NULL,
	`product_id` INT(11) UNSIGNED NOT NULL,
	`quantity` INT(4) NOT NULL,
	`unit_price` DECIMAL(20,2) DEFAULT NULL,
	`item_description` VARCHAR(255) DEFAULT NULL,
	`status` INT(1) UNSIGNED DEFAULT NULL,
	CONSTRAINT `ITEM_ORD_HDR` FOREIGN KEY (`order_header_id`) REFERENCES `order_header` (`order_header_id`),
	CONSTRAINT `ORD_ITM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
);


INSERT INTO user_login (username, password, first_name, last_name, parent_user_id, wallet, is_loggedin, category_code) VALUES
	('parentuser1', '123456', 'Parent ','User 1', NULL, 0.0, 'N', NULL),
	('abdul', '123456', 'Abdul ','Hafiz', 1, 0.0, 'N', NULL),
	('sufiyan', '123456', 'Mohammed ','Sufiyan', 1, 0.0, 'N', NULL);
	
INSERT INTO user_login (username, password, first_name, last_name, parent_user_id, wallet, is_loggedin, category_code) VALUES
	('parentuser2', '123456', 'Parent ','User 2', NULL, 0.0, 'N', NULL),
	('salman', '123456', 'Salman ','Mistry', 2, 0.0, 'N', NULL),
	('syed', '123456', 'Mohammed ','Syed', 2, 0.0, 'N', NULL);
	
	

	


INSERT INTO product_category (product_category_id, primary_parent_category_id, category_name, description, category_image_url) VALUES
	(1, null, 'ROOT', 'ROOT ', NULL),
	(2, 1, 'Salads', 'Salads ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Tuna-Salad.jpg'),
	(3, 1, 'Sandwiches', 'Sandwiches ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Halloumi-Cheese-Sandwich.jpg'),
	(4, 1, 'Savoury', 'Savoury ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Vegetable-Puff.jpg'),
	(5, 1, 'Viennoiserie', 'Viennoiserie ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Croissant-Butter.jpg'),
	(6, 1, 'Bread', 'Bread ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bagel-With-Sesame.jpg'),
	(7, 1, 'Cakes And Pastries', 'Cakes_n_Pastries ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Macaroon.jpg'),
	(8, 1, 'Hot Dishes', 'Hot_Dishes ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Cream-Of-Mushroom-Soup.jpg');
	
INSERT INTO product_category (product_category_id, primary_parent_category_id, category_name, description, category_image_url) VALUES
	(9, 3, 'Fish Sandwich', 'Fish_Sandwich ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Tuna-Club-Sandwich.jpg'),
	(10, 3, 'Vegetarian Sandwich', 'Vegetarian_Sandwich ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Club-Sandwich.jpg'),
	(11, 3, 'Beef Sandwich', 'Beef_Sandwich ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Roast-Beef-Club-Sandwich.jpg'),
	(12, 3, 'Chicken Sandwich', 'Chicken_Sandwich ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Buffalo-Chicken-Sandwich.jpg');

INSERT INTO product_category (product_category_id, primary_parent_category_id, category_name, description, category_image_url) VALUES
	(13, 4, 'Regular Savoury', 'Regular_Savoury ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Chicken-Puff.jpg');
	

INSERT INTO product_category (product_category_id, primary_parent_category_id, category_name, description, category_image_url) VALUES
	(14, 5, 'Danish', 'Danish ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Danish-Cream-Cheese-Sultana-Square.jpg'),
	(15, 5, 'Muffins', 'Muffins ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Muffin-Banana.jpg'),
	(16, 5, 'Cookies', 'Cookies ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Double-Chocolate-Cookies.jpg'),
	(17, 5, 'Croissants', 'Croissants ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Croissant-Chocolate.jpg');
	
	
INSERT INTO product_category (product_category_id, primary_parent_category_id, category_name, description, category_image_url) VALUES
	(18, 6, 'Long Fermented Premium Breads', 'Long_Fermented_Premium_Breads ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Rustical-Bread.jpg'),
	(19, 6, 'Sandwich Breads', 'Sandwich_Breads ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Ciabatta.jpg'),
	(20, 6, 'Sliced Bread', 'Sliced_Bread ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/White-Bread.jpg'),
	(21, 6, 'Bagels', 'Bagels ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bagel-With-Sesame.jpg'),
	(22, 6, 'Baguettes', 'Baguettes ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Kraftkorn-Baguette.jpg'),
	(23, 6, 'Bread Rolls', 'Bread_Rolls ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bran-Rolls.jpg'),
	(24, 6, 'Buns', 'Buns ','https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Burger-Bun-with-White-Sesame.jpg');
	
	

INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(1, 'Bagel Rye', 'Bagel Rye ', 1.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bagel-Rye.jpg'),
	(2, 'Bagel With Sesame ', 'Bagel With Sesame  ', 2.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bagel-With-Sesame.jpg'),
	(3, 'Bagel Dry Fruit ', 'Bagel Dry Fruit  ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bagel-Dry-Fruit.jpg'),
	(4, 'Bagel Plain ', 'Bagel Plain  ', 1.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bagel-Plain.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(21, 1, 1),
	(21, 2, 2),
	(21, 3, 3),
	(21, 4, 4),
	(6, 1, 1),
	(6, 2, 2),
	(6, 3, 3),
	(6, 4, 4);
	
INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(5, 'White Baguette ', 'White Baguette  ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/White-Baguette.jpg'),
	(6, 'Wholemeal Baguette ', 'Wholemeal Baguette ', 5.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Wholemeal-Baguette.jpg'),
	(7, 'Bran Baguette ', 'Bran Baguette ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bran-Baguette.jpg'),
	(8, 'Country Baguette ', 'Country Baguette ', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Country-Baguette.jpg'),
	(9, 'Kraftkorn Baguette ', 'Kraftkorn Baguette ', 4.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Kraftkorn-Baguette.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(22, 5, 1),
	(22, 6, 2),
	(22, 7, 3),
	(22, 8, 4),
	(22, 9, 5),
	(6, 5, 1),
	(6, 6, 2),
	(6, 7, 3),
	(6, 8, 4),
	(6, 9, 5);

INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(10, 'Traditional Rolls White ', 'Traditional Rolls White ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Traditional-Rolls-White.jpg'),
	(11, 'Wholemeal Rye Rolls ', 'Wholemeal Rye Rolls ', 5.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Wholemeal-Rye-Rolls.jpg'),
	(12, 'Black Forest Rye Rolls', 'Black Forest Rye Rolls', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Black-Forest-Rye-Rolls.jpg'),
	(13, 'Bran Rolls', 'Bran Rolls', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Bran-Rolls.jpg'),
	(14, 'Ciabatta White Rolls ', 'Ciabatta White Rolls ', 4.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Ciabatta-White-Rolls.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(23, 10, 1),
	(23, 11, 2),
	(23, 12, 3),
	(23, 13, 4),
	(23, 14, 5),
	(6, 10, 1),
	(6, 11, 2),
	(6, 12, 3),
	(6, 13, 4),
	(6, 14, 5);

INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(15, 'Plain Bun', 'Plain Bun', 1.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Plain-Bun.jpg'),
	(16, 'Potato Bun ', 'Potato Bun ', 2.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Potato-Bun.jpg'),
	(17, 'Burger Bun with White Sesame ', 'Burger Bun with White Sesame ', 2.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Burger-Bun-with-White-Sesame.jpg'),
	(18, 'Hot Dog Roll ', 'Hot Dog Roll ', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Hot-Dog-Roll.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(24, 15, 1),
	(24, 16, 2),
	(24, 17, 3),
	(24, 18, 4),
	(6, 15, 1),
	(6, 16, 2),
	(6, 17, 3),
	(6, 18, 4);

INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(19, 'Rye Baguette', 'Rye Baguette', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Rye-Baguette.jpg'),
	(20, 'Sourdough Bread  ', 'Sourdough Bread  ', 5.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Sourdough-Bread.jpg'),
	(21, 'Pan De Campagne Bread ', 'Pan De Campagne Bread ', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Pan-De-Campagne-Bread.jpg'),
	(22, 'Rustical Bread', 'Rustical Bread', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Rustical-Bread.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(18, 19, 1),
	(18, 20, 2),
	(18, 21, 3),
	(18, 22, 4),
	(6, 19, 1),
	(6, 20, 2),
	(6, 21, 3),
	(6, 22, 4);
	
INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(23, 'Ciabatta Wholemeal ', 'Ciabatta Wholemeal ', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Ciabatta-Wholemeal.jpg'),
	(24, 'Ciabatta with Olives ', 'Ciabatta with Olives ', 5.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Ciabatta-with-Olives.jpg'),
	(25, 'Panini Rectangle ', 'Panini Rectangle ', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Panini-Rectangle.jpg'),
	(26, 'Ciabatta ', 'Ciabatta ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Ciabatta.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(19, 23, 1),
	(19, 24, 2),
	(19, 25, 3),
	(19, 26, 4),
	(6, 23, 1),
	(6, 24, 2),
	(6, 25, 3),
	(6, 26, 4);


INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(27, 'White Bread ', 'White Bread ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/White-Bread.jpg'),
	(28, 'Black Olive Bread ', 'Black Olive Bread  ', 3.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Black-Olive-Bread.jpg'),
	(29, 'Carrot Bread ', 'Carrot Bread ', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Carrot-Bread.jpg'),
	(30, 'Multicereal Bread ', 'Multicereal Bread ', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Multicereal-Bread.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(20, 27, 1),
	(20, 28, 2),
	(20, 29, 3),
	(20, 30, 4),
	(6, 27, 1),
	(6, 28, 2),
	(6, 29, 3),
	(6, 30, 4);
	
	
INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(31, 'Macaroon', 'Macaroon', 6.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Macaroon.jpg'),
	(32, 'Baked Blueberry Cheesecake ', 'Baked Blueberry Cheesecake ', 6.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Baked-Blueberry-Cheesecake.jpg'),
	(33, 'Baked Oreo Cheesecake ', 'Baked Oreo Cheesecake ', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Baked-Oreo-Cheesecake.jpg'),
	(34, 'Baked Strawberry Cheesecake ', 'Baked Strawberry Cheesecake ', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Baked-Strawberry-Cheesecake.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(7, 31, 1),
	(7, 32, 2),
	(7, 33, 3),
	(7, 34, 4);

INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(35, 'Roasted Pumpkin Soup', 'Roasted Pumpkin Soup', 6.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Roasted-Pumpkin-Soup.jpeg'),
	(36, 'Scotch Broth Soup ', 'Scotch Broth Soup ', 6.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Scotch-Broth-Soup.jpg'),
	(37, 'Tamarind Chicken Soup', 'Tamarind Chicken Soup', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Tamarind-Chicken-Soup.jpg'),
	(38, 'Chicken Corn Soup', 'Chicken Corn Soup', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Chicken-Corn-Soup.jpeg'),
	(39, 'Chicken Vermicelli ', 'Chicken Vermicelli ', 6.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Chicken-Vermicelli.jpg'),
	(40, 'Cream Of Mushroom Soup ', 'Cream Of Mushroom Soup ', 6.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Cream-Of-Mushroom-Soup.jpg'),
	(41, 'Poached Chicken With Lemon Capers ', 'Poached Chicken With Lemon Capers ', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Poached-Chicken-With-Lemon-Capers.jpg'),
	(42, 'Poached Chicken With Plum Sauce ', 'Poached Chicken With Plum Sauce', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Poached-Chicken-With-Plum-Sauce.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(8, 35, 1),
	(8, 36, 2),
	(8, 37, 3),
	(8, 38, 4),
	(8, 39, 5),
	(8, 40, 6),
	(8, 41, 7),
	(8, 42, 8);


INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(43, 'Tuna Salad', 'Tuna Salad', 6.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Tuna-Salad.jpg'),
	(44, 'Warakanab', 'Warakanab', 6.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Warakanab.jpg'),
	(45, 'Caesar Salad ', 'Caesar Salad ', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Caesar-Salad.jpg'),
	(46, 'Greek Salad ', 'Greek Salad ', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Greek-Salad.jpg'),
	(47, 'Hummus', 'Hummus', 6.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Hummus.jpg'),
	(48, 'Moutabal', 'Moutabal', 6.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Moutabal.jpg'),
	(49, 'Pineapple Chicken Salad ', 'Pineapple Chicken Salad ', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Pineapple-Chicken-Salad.jpg'),
	(50, 'Rocca Salad ', 'Rocca Salad ', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Rocca-Salad.jpg'),
	(51, 'Shrimps Salad', 'Shrimps Salad', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Shrimps-Salad.jpg'),
	(52, 'Tuna Pasta Salad ', 'Tuna Pasta Salad ', 7.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Tuna-Pasta-Salad.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(2, 43, 1),
	(2, 44, 2),
	(2, 45, 3),
	(2, 46, 4),
	(2, 47, 5),
	(2, 48, 6),
	(2, 49, 7),
	(2, 50, 8),
	(2, 51, 9),
	(2, 52, 10);
	

INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(53, 'Beef Slider Sandwich ', 'Beef Slider Sandwich ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Beef-Slider-Sandwich.jpg'),
	(54, 'Beef Steak Sandwich ', 'Beef Steak Sandwich ', 3.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Beef-Steak-Sandwich.jpg'),
	(55, 'Mexican Beef In Pitta Bread ', 'Mexican Beef In Pitta Bread ', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Mexican-Beef-In-Pitta-Bread.jpg'),
	(56, 'Roast Beef Club Sandwich ', 'Roast Beef Club Sandwich ', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Roast-Beef-Club-Sandwich.jpg'),
	(57, 'Roast Beef Sandwich', 'Roast Beef Sandwich', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Roast-Beef-Sandwich.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(11, 53, 1),
	(11, 54, 2),
	(11, 55, 3),
	(11, 56, 4),
	(11, 57, 5),
	(3, 53, 1),
	(3, 54, 2),
	(3, 55, 3),
	(3, 56, 4),
	(3, 57, 5);


INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(58, 'Buffalo Chicken Sandwich', 'Buffalo Chicken Sandwich', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Buffalo-Chicken-Sandwich.jpg'),
	(59, 'Chicken Fajita Wrap ', 'Chicken Fajita Wrap ', 3.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Chicken-Fajita-Wrap.jpg'),
	(60, 'Chicken Pesto Wrap', 'Chicken Pesto Wrap', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Chicken-Pesto-Wrap.jpg'),
	(61, 'Mini Chicken Wrap ', 'Mini Chicken Wrap ', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Mini-Chicken-Wrap.jpg'),
	(62, 'Parmesan Chicken Sanwich', 'Parmesan Chicken Sanwich', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Parmesan-Chicken-Sanwich.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(12, 58, 1),
	(12, 59, 2),
	(12, 60, 3),
	(12, 61, 4),
	(12, 62, 5),
	(3, 58, 1),
	(3, 59, 2),
	(3, 60, 3),
	(3, 61, 4),
	(3, 62, 5);
	
INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(63, 'Tuna Club Sandwich ', 'Tuna Club Sandwich ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Tuna-Club-Sandwich.jpg'),
	(64, 'Tuna Sandwich ', 'Tuna Sandwich ', 3.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Tuna-Sandwich.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(9, 63, 1),
	(9, 64, 2),
	(3, 63, 1),
	(3, 64, 2);
	
	
INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(65, 'Club Sandwich', 'Club Sandwich', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Club-Sandwich.jpg'),
	(66, 'Halloumi Cheese Sandwich ', 'Halloumi Cheese Sandwich ', 3.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Halloumi-Cheese-Sandwich.jpg'),
	(67, 'Mediterranean Cheese Sandwich', 'Mediterranean Cheese Sandwich', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Mediterranean-Cheese-Sandwich.jpg'),
	(68, 'Basil Tomato Pesto Sandwich', 'Basil Tomato Pesto Sandwich', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Basil-Tomato-Pesto-Sandwich.jpg'),
	(69, 'Breakfast Bagel Sandwich', 'Breakfast Bagel Sandwich', 4.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Breakfast-Bagel-Sandwich.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(10, 58, 1),
	(10, 59, 2),
	(10, 60, 3),
	(10, 61, 4),
	(10, 62, 5),
	(3, 58, 1),
	(3, 59, 2),
	(3, 60, 3),
	(3, 61, 4),
	(3, 62, 5);
	
INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(70, 'Vegetable Puff ', 'Vegetable Puff ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Vegetable-Puff.jpg'),
	(71, 'Chicken Puff', 'Chicken Puff', 3.5, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Chicken-Puff.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(13, 70, 1),
	(13, 71, 2),
	(4, 70, 1),
	(4, 71, 2);

INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(72, 'Double Chocolate Cookies', 'Double Chocolate Cookies', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Double-Chocolate-Cookies.jpg'),
	(73, 'Almond Cookies', 'Almond Cookies', 3.0, 1000,  'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Almond-Cookies.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(16, 72, 1),
	(16, 73, 2),
	(5, 72, 1),
	(5, 73, 2);
	
INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(74, 'Croissant Cheese', 'Croissant Cheese', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Croissant-Cheese.jpg'),
	(75,  'Croissant Chocolate ', 'Croissant Chocolate ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Croissant-Chocolate.jpg'),
	(76, 'Croissant Zaatar ', 'Croissant Zaatar ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Croissant-Zaatar.jpg'),
	(77,  'Croissant Butter', 'Croissant Butter', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Croissant-Butter.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(17, 74, 1),
	(17, 75, 2),
	(17, 76, 3),
	(17, 77, 4),
	(5, 74, 1),
	(5, 75, 2),
	(5, 76, 3),
	(5, 77, 4);
	
INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(78, 'Danish Cream Cheese Sultana Square', 'Danish Cream Cheese Sultana Square', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Danish-Cream-Cheese-Sultana-Square.jpg'),
	(79,  'Danish Raisin Roll ', 'Danish Raisin Roll ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Danish-Raisin-Roll.jpg'),
	(80, 'Danish Twisted', 'Danish Twisted', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Danish-Twisted.jpg'),
	(81,  'Danish Blueberry', 'Danish Blueberry', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Danish-Blueberry.jpg'),
	(82,  'Danish Cinnamon Roll', 'Danish Cinnamon Roll', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Danish-Cinnamon-Roll.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(14, 78, 1),
	(14, 79, 2),
	(14, 80, 3),
	(14, 81, 4),
	(14, 82, 5),
	(5, 78, 1),
	(5, 79, 2),
	(5, 80, 3),
	(5, 81, 4),
	(5, 82, 5);

INSERT INTO product (product_id, product_name, description, price, inventory, img_url) VALUES
	(83, 'Muffin Double Chocolate ', 'Muffin Double Chocolate ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Muffin-Double-Chocolate.jpg'),
	(84,  'Muffin Mix Fruit', 'Muffin Mix Fruit', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Muffin-Mix-Fruit.jpg'),
	(85, 'Muffin Pistachio ', 'Muffin Pistachio ', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Muffin-Pistachio.jpg'),
	(86,  'Muffin Strawberry ', 'Muffin Strawberry ', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Muffin-Strawberry.jpg'),
	(87,  'Muffin Vanilla ', 'Muffin Vanilla ', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Muffin-Vanilla.jpg'),
	(88, 'Muffin Banana', 'Muffin Banana', 3.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Muffin-Banana.jpg'),
	(89,  'Muffin Blueberry ', 'Muffin Blueberry ', 5.0, 1000, 'https://www.grandcentralbakery.qa/wp-content/uploads/2018/07/Muffin-Blueberry.jpg');

INSERT INTO product_category_member (product_category_id, product_id, sequence_num) VALUES
	(15, 83, 1),
	(15, 84, 2),
	(15, 85, 3),
	(15, 86, 4),
	(15, 87, 5),
	(15, 88, 6),
	(15, 89, 7),
	(5, 83, 1),
	(5, 84, 2),
	(5, 85, 3),
	(5, 86, 4),
	(5, 87, 5),
	(5, 88, 6),
	(5, 89, 7);
	
	
	
	
	
		
	
	