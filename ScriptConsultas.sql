-- Obtener todos los empleados con su nivel de educacion

SELECT e.EmployeeID, e.FirstName, e.LastName, el.EducationLevel
FROM Employee e
JOIN education_level el ON e.Education = el.EducationLevelID;

-- 

-- Contar el número de empleados por nivel de educación:
SELECT el.EducationLevel, COUNT(e.EmployeeID) AS NumberOfEmployees
FROM employee e
JOIN education_level el ON e.Education = el.EducationLevelID
GROUP BY el.EducationLevel;


-- Obtener el rendimiento de empleados por departamento:
SELECT e.Department, AVG(pr.ManagerRating) AS AverageManagerRating
FROM performance_rating pr
JOIN employee e ON pr.EmployeeID = e.EmployeeID
GROUP BY e.Department;

-- Empleados que han tenido viajes de negocio y su satisfacción laboral:
SELECT e.FirstName, e.LastName, e.BusinessTravel, pr.JobSatisfaction
FROM employee e
JOIN performance_rating pr ON e.EmployeeID = pr.EmployeeID
WHERE e.BusinessTravel != 'No Travel';

SELECT Department, 
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(EmployeeID) AS AttritionRate
FROM employee
GROUP BY Department;