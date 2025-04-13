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


