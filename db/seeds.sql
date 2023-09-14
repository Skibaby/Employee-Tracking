USE employee_db_2;

-- Preform INSERTS one table at a time

-- INSERT INTO department (`name`) VALUES
--   ('Software Development'),
--   ('Quality Assurance'),
--   ('Product Management');


-- INSERT INTO `role` (title, salary, department_id) VALUES
--   ('Software Engineer', 6000.00, 1),
--   ('UI/UX Designer', 5000.00, 1),
--   ('QA Engineer', 4500.00, 2),
--   ('Product Manager', 7000.00, 3),
--   ('Technical Lead', 8000.00, 1),
--   ('Database Administrator', 5500.00, 1);


-- Need to wait for insert of role before inserting employee
-- Check the role id that you need to insert

-- INSERT INTO employee (first_name, last_name, role_id) VALUES
--   ('Mary', 'Doe', 1),
--   ('Jane', 'Hope', 5),
--   ('Michael', 'Johnson', 3),
--   ('Emily', 'Wynn',2),
--   ('Larry', 'Brown', 1),
--   ('Sarah', 'Jones', 6),
--   ('Bob', 'Taylor', 3),
--   ('Olivia', 'Miller', 2),
--   ('Nancy', 'Wilson', 5),
--   ('Sophia', 'Anderson', 4);


-- Need to wait for insert of employee before inserting manager_id
-- Check the employee id that you need to insert

UPDATE employee SET manager_id = 2 WHERE id = 1;
UPDATE employee SET manager_id = 6 WHERE id = 5;
UPDATE employee SET manager_id = 2 WHERE id = 4;
UPDATE employee SET manager_id = 7 WHERE id = 8;
UPDATE employee SET manager_id = 6 WHERE id = 10;







-- USE employee_db;


-- INSERT INTO departments (title)
-- VALUES ('Customer Service'), ('Maintenance'),('Marketing'),('Human Resources'),('Management');


-- INSERT INTO roles (title, salary, department_id)
-- VALUES ('secretary', 48000, 1), ('Sales Telecaller', 75000, 3),('Janitor', 30000, 2),('HR Director', 75000, 4),('VP',103000,5);

-- INSERT INTO employees (first_name, last_name, role_id)
-- VALUES ('Ann', 'Perry', 4), ('Patricia', 'Johnson', 1),('Al', 'Jones', 2),('Felix','Martinez',5),('Calvin','Arnold',3);

