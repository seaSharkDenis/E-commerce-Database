CREATE DATABASE IF NOT EXISTS ecommerce;

USE ecommerce;

CREATE TABLE IF NOT EXISTS color(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS product_category(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS brand(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS size_category(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS attribute_category(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS size_option(
    id INT AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT,
    name VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

CREATE TABLE IF NOT EXISTS attribute_type(
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(50) NOT NULL,
    data_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES attribute_category(id)
);

CREATE TABLE IF NOT EXISTS product(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    category_id INT,
    brand_id INT,
    base_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES product_category(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE IF NOT EXISTS product_image(
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE IF NOT EXISTS product_variation(
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    color_id INT,
    size_id INT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_id) REFERENCES size_option(id)
);

CREATE TABLE IF NOT EXISTS product_attribute(
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    attribute_type_id INT,
    value VARCHAR(255) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);

CREATE TABLE IF NOT EXISTS product_item(
    id INT AUTO_INCREMENT PRIMARY KEY,
    variation_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_qty INT NOT NULL,
    FOREIGN KEY (variation_id) REFERENCES product_variation(id)
);