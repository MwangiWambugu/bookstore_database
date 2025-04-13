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
-- Publisher
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(150)
);

-- Book Language
CREATE TABLE book_language (
    language_id INT PRIMARY KEY,
    language VARCHAR(50)
);

-- Books
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(200),
    genre VARCHAR(100),
    publisher_id INT,
    language_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);


--  Author
CREATE TABLE author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(150)
);


-- Book_Author
CREATE TABLE book_author (
    book_author_id INT PRIMARY KEY,
    book_id INT,
    author_id INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- Order Line
CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY,
    customer_order_id INT,
    book_id INT,
    quantity INT,
    FOREIGN KEY (customer_order_id) REFERENCES cust_order(customer_order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

