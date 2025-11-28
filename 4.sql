CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE zakaz (
    zakaz_id SERIAL PRIMARY KEY,
    zakaz_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_zakaz NUMERIC NOT NULL
);

create Table zakaz_product (
    zakaz_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (zakaz_id, product_id),
    FOREIGN KEY (zakaz_id) REFERENCES zakaz(zakaz_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
)
