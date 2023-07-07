CREATE USER BANK IDENTIFIED BY <password>;
GRANT CREATE SESSION TO BANK;
GRANT CREATE TABLE TO BANK;
GRANT INSERT, UPDATE, DELETE ON customer TO BANK;
GRANT INSERT, SELECT ON transaction TO BANK;
CREATE TABLE customer (
account_id INT PRIMARY KEY,
first_name VARCHAR2(50) NOT NULL,
last_name VARCHAR2(50) NOT NULL,
address VARCHAR2(100) NOT NULL,
mobile VARCHAR2(20) NOT NULL,
id VARCHAR2(20) NOT NULL,
balance NUMBER(10,2) DEFAULT 100.00 NOT NULL,
CONSTRAINT min_balance CHECK (balance >= 100)
);
CREATE TABLE transaction (
transaction_id INT PRIMARY KEY,
from_account_id INT,
to_account_id INT,
timestamp TIMESTAMP DEFAULT current_timestamp,
amount NUMBER(10,2) NOT NULL,
CONSTRAINT fk_from_account FOREIGN KEY (from_account_id)
REFERENCES customer (account_id)
ON DELETE CASCADE,
CONSTRAINT fk_to_account FOREIGN KEY (to_account_id)
REFERENCES customer (account_id)
ON DELETE CASCADE
);