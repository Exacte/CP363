CREATE TABLE customers (
    username VARCHAR(30),
    password VARCHAR(30) NOT NULL,
    adress VARCHAR(30) NOT NULL,
    phone_number VARCHAR(10) NOT NULL,
    credit_card INTEGER NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE orders (
    order_id INTEGER,
    album_id INTEGER,
    quantity INTEGER,
    price NUMERIC(5 , 2 ),
    PRIMARY KEY (order_id),
    FOREIGN KEY (album_id)
        REFERENCES albums (album_id)
);

CREATE TABLE purchases (
    purchas_id INTEGER,
    username VARCHAR(30),
    total NUMERIC(5 , 2 ),
    PRIMARY KEY (purchas_id),
    FOREIGN KEY (purchas_id)
        REFERENCES orders (order_id),
    FOREIGN KEY (username)
        REFERENCES customers (username)
);