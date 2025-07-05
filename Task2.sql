-- sample table to work with
CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

INSERT INTO employees VALUES 
(1, 'John', 'Doe', 'john.doe@email.com', '2024-01-15', 55000.00, 'IT');

INSERT INTO employees (employee_id, first_name, last_name, email) 
VALUES (2, 'Jane', 'Smith', 'jane.smith@email.com');

INSERT INTO employees VALUES 
(3, 'Mike', 'Johnson', 'mike.j@email.com', '2024-02-01', 48000.00, 'Sales'),
(4, 'Sarah', 'Williams', 'sarah.w@email.com', '2024-02-15', 52000.00, 'Marketing');


select *
from employees;

INSERT INTO employees VALUES 
(5, 'Bob', 'Brown', NULL, '2024-03-01', NULL, 'IT');

UPDATE employees 
SET salary = 56000.00 
WHERE employee_id = 1;

UPDATE employees 
SET salary = 50000.00,
    department = 'Sales'
WHERE email IS NULL;

DELETE FROM employees 
WHERE employee_id = 2;

DELETE FROM employees 
WHERE department = 'Marketing' 
AND salary < 53000.00;

UPDATE employees 
SET email = 'bob.brown@email.com' 
WHERE email IS NULL;


SELECT * FROM employees 
WHERE salary IS NULL;
