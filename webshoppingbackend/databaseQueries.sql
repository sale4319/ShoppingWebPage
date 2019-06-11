CREATE TABLE category(

	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,

	CONSTRAINT pk_category_id PRIMARY KEY (id)

);
INSERT INTO category (name,description,image_url,is_active) VALUES ('Laptop', 'This is description for Laptop.', 'CAT_1.png', true);
INSERT INTO category (name,description,image_url,is_active) VALUES ('Television', 'This is description for TV.', 'CAT_2.png', true);
INSERT INTO category (name,description,image_url,is_active) VALUES ('Mobile', 'This is description for mobile.', 'CAT_3.png', true);

CREATE TABLE user_detail (
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),
	CONSTRAINT pk_user_id PRIMARY KEY(id),

);

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES('Sale', 'Saki', 'ADMIN', true, '$2a$10$d2z0Oy3EgLK1IY3w/QRHHe/2kSH6JEB23IZiht8p51us6WH91m44m', 's@gmail.com', '0000000000');

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES('Ica', 'Dandarica', 'USER', true, '$2a$10$/turYA6ZuIKnyHJo271sMe39OfnA4roxLI0awKnrFHICJEscrNGA2', 'i@gmail.com', '1111111111');

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES('Maca', 'Katosav', 'SUPPLIER', true, '$2a$10$/turYA6ZuIKnyHJo271sMe39OfnA4roxLI0awKnrFHICJEscrNGA2', 'k@gmail.com', '1111111111');

CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),	

);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'iPhone 5s', 'apple', 'This is one of the best phone available in the market right now!', 18000, 5, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Samsung s7', 'samsung', 'A smart phone by samsung!', 32000, 2, true, 3, 3, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'Google Pixel', 'google', 'This is one of the best android smart phone available in the market right now!', 57000, 5, true, 3, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', ' Macbook Pro', 'apple', 'This is one of the best laptops available in the market right now!', 54000, 3, true, 1, 2, 0, 0 );

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'Dell Latitude E6510', 'dell', 'This is one of the best laptop series from dell that can be used!', 48000, 5, true, 1, 3, 0, 0 );


CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

INSERT INTO address( user_id, address_line_one, address_line_two, city, state, country, postal_code, is_billing, is_shipping) 
VALUES (1, 'Cara Musana', 'Staarog', 'Bujdo', 'RS', 'BA', '76688', true, false );

CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);

INSERT INTO cart (user_id, grand_total, cart_lines) VALUES (2, 0, 0);

CREATE TABLE cart_line(
	id IDENTITY,
	cart_id int,
	total DECIMAL(10,2),
	product_id int,
	product_count int,
	buying_price DECIMAL(10,2),
	is_available boolean,
	CONSTRAINT fk_cartline_cart_id FOREIGN KEY (cart_id) REFERENCES cart(id),
	CONSTRAINT fk_cartline_product_id FOREIGN KEY (product_id) REFERENCES product(id),
	CONSTRAINT pk_cartline_id PRIMARY KEY (id)
	
);












