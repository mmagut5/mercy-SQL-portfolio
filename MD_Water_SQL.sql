USE md_water_services;
SELECT * FROM data_dictionary;
SELECT town_name,
COUNT(employee_name) AS num_employees
FROM employee
GROUP BY town_name
ORDER BY town_name;

SELECT * FROM visits;

SELECT assigned_employee_id ,
SUM(visit_count) AS number_of_visits
FROM visits
GROUP BY assigned_employee_id
ORDER BY assigned_employee_id;

CREATE VIEW employee_visit AS  SELECT assigned_employee_id ,
COUNT(visit_count) AS number_of_visits
FROM visits
GROUP BY assigned_employee_id
ORDER BY assigned_employee_id;

SELECT * FROM employee_visit;

SELECT * FROM employee;

UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, '','.')),'@ndogowater.gov');

SELECT employee.assigned_employee_id,employee.employee_name,employee_visit.number_of_visits
FROM employee
INNER JOIN employee_visit 
ON employee.assigned_employee_id = employee_visit.assigned_employee_id
ORDER BY number_of_visits DESC;

SELECT town_name,province_name,
COUNT(employee_name) AS number_of_employees
FROM employee
WHERE town_name="Harare"
GROUP BY town_name,province_name;

SELECT * FROM employee;

SELECT * FROM water_source;
SELECT type_of_water_source,
AVG(number_of_people_served) AS avg_people
FROM water_source
WHERE type_of_water_source='well'
GROUP BY type_of_water_source;

SELECT * FROM visits;