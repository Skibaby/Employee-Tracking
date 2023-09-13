USE employee_db;


INSERT INTO departments (title)
VALUES ('Customer Service'), ('Maintenance'),('Marketing'),('Human Resources'),('Management');


INSERT INTO roles (title, salary, department_id)
VALUES ('secretary', 48000, 1), ('Sales Telecaller', 75000, 3),('Janitor', 30000, 2),('HR Director', 75000, 4),('VP',103000,5);

INSERT INTO employees (first_name, last_name, role_id)
VALUES ('Ann', 'Perry', 4), ('Patricia', 'Johnson', 1),('Al', 'Jones', 2),('Felix','Martinez',5),('Calvin','Arnold',3);

