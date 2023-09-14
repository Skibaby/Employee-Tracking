
-- DROP DATABASE IF EXISTS employee_db_2;


-- CREATE DATABASE employee_db_2;


USE employee_db_2;


-- CREATE TABLE department (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(255) NOT NULL
-- );


-- CREATE TABLE `role` (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   title VARCHAR(255) NOT NULL,
--   salary DECIMAL(10,2) NOT NULL,
--   department_id INT,
--   FOREIGN KEY (department_id) REFERENCES department(id)
-- );


CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  role_id INT,
  manager_id INT,
  FOREIGN KEY (role_id) REFERENCES role(id),
  FOREIGN KEY (manager_id) REFERENCES employee(id)
);










-- CREATE TABLE departments (
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- title VARCHAR(30) NOT NULL
-- );

-- CREATE TABLE roles (
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(30),
--     salary DECIMAL,
--     department_id INT
-- );

-- CREATE TABLE employees (
-- id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
-- first_name VARCHAR(30),
-- last_name VARCHAR(30),
-- role_id INT,
-- manager_id INT, 
-- FOREIGN KEY (role_id) REFERENCES roles(id),
-- FOREIGN KEY (manager_id) REFERENCES employees(id)
-- );