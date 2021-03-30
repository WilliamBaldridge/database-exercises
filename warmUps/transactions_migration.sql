USE bank_db;


DROP TABLE if EXISTS transactions;

CREATE TABLE transactions(
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    transaction_date DATE DEFAULT (CURDATE()),
    description VARCHAR(200) NOT NULL,
    memo TEXT,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_successful BOOLEAN,
    PRIMARY KEY (id)
);