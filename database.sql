CREATE DATABASE bookshop;

USE bookshop;
-- Customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    second_name VARCHAR(100),
    email VARCHAR(150)
);
-- Country
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100)
);
--  Address
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street VARCHAR(150),
    city VARCHAR(100),
    zip_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);


-- Address Status
CREATE TABLE address_status (
    address_status_id INT PRIMARY KEY,
    description VARCHAR(100)
);

-- Customer Address
CREATE TABLE customer_address (
    customer_address_id INT PRIMARY KEY,
    customer_id INT,
    address_id INT,
    address_status_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (address_status_id) REFERENCES address_status(address_status_id)
);

-- Shipping Method
CREATE TABLE shipping_method (
    shipping_method_id INT PRIMARY KEY,
    method VARCHAR(100)
);

-- Order Status
CREATE TABLE order_status (
    order_status_id INT PRIMARY KEY,
    order_status VARCHAR(100)
);

--  Customer Order
CREATE TABLE cust_order (
    customer_order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status_id INT,
    shipping_method_id INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id)
);

-- Order History
CREATE TABLE order_history (
    hist_id INT PRIMARY KEY,
    customer_order_id INT,
    order_status_id INT,
    FOREIGN KEY (customer_order_id) REFERENCES cust_order(customer_order_id),
    FOREIGN KEY (order_status_id) REFERENCES order_status(order_status_id)
);
