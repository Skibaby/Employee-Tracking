USE employee_db_2;

-- Preform INSERTS one table at a time

INSERT INTO department (`name`) VALUES
  ('Software Development'),
  ('Quality Assurance'),
  ('Product Management');


INSERT INTO `role` (title, salary, department_id) VALUES
  ('Software Engineer', 6000.00, 1),
  ('UI/UX Designer', 5000.00, 1),
  ('QA Engineer', 4500.00, 2),
  ('Product Manager', 7000.00, 3),
  ('Technical Lead', 8000.00, 1),
  ('Database Administrator', 5500.00, 1);


Need to wait for insert of role before inserting employee
Check the role id that you need to insert

INSERT INTO employee (first_name, last_name, role_id) VALUES
  ('Mary', 'Doe', 8),
  ('Jane', 'Hope', 9),
  ('Michael', 'Johnson', 10),
  ('Emily', 'Wynn',11),
  ('Larry', 'Brown', 12),
  ('Sarah', 'Jones', 11),
  ('Bob', 'Taylor', 7),
  ('Olivia', 'Miller', 9),
  ('Nancy', 'Wilson', 8),
  ('Sophia', 'Anderson', 11);


Need to wait for insert of employee before inserting manager_id
Check the employee id that you need to insert

UPDATE employee SET manager_id = 21 WHERE id = 22;
UPDATE employee SET manager_id = 21 WHERE id = 24;
UPDATE employee SET manager_id = 26 WHERE id = 29;
UPDATE employee SET manager_id = 29 WHERE id = 23;
UPDATE employee SET manager_id = 29 WHERE id = 27;







-- USE employee_db;


-- INSERT INTO departments (title)
-- VALUES ('Customer Service'), ('Maintenance'),('Marketing'),('Human Resources'),('Management');


-- INSERT INTO roles (title, salary, department_id)
-- VALUES ('secretary', 48000, 1), ('Sales Telecaller', 75000, 3),('Janitor', 30000, 2),('HR Director', 75000, 4),('VP',103000,5);

-- INSERT INTO employees (first_name, last_name, role_id)
-- VALUES ('Ann', 'Perry', 4), ('Patricia', 'Johnson', 1),('Al', 'Jones', 2),('Felix','Martinez',5),('Calvin','Arnold',3);

