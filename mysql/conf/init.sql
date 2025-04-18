CREATE USER 'hobbyuser'@'%' IDENTIFIED BY 'hobby';



CREATE DATABASE IF NOT EXISTS testdb;
GRANT ALL PRIVILEGES ON testdb.* TO 'hobbyuser'@'%';
FLUSH PRIVILEGES;


USE testdb;

CREATE TABLE IF NOT EXISTS test_table (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO test_table (name) VALUES ('Alice'), ('Bob'), ('Charlie');
