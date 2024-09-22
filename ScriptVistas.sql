USE hr_analytics;

-- 1. Relación entre TrainingOpportunitiesWithinYear y TrainingOpportunitiesTaken REDONDEADO A 2 DECIMALES
CREATE VIEW Training_Opportunities_Relationship AS
SELECT EmployeeID,
       TrainingOpportunitiesWithinYear,
       TrainingOpportunitiesTaken,
       ROUND ((TrainingOpportunitiesTaken / TrainingOpportunitiesWithinYear) * 100, 2) AS PercentageTrainingTaken
FROM performance_rating
WHERE TrainingOpportunitiesWithinYear > 0;

-- 2. Rango de salarios entre mujeres y hombres filtrado por departamento
CREATE VIEW Avg_Salary_By_Gender_Department AS
SELECT Department,
       Gender,
       ROUND(AVG(Salary), 2) AS AvgSalary
FROM employee
GROUP BY Department, Gender;

-- 3. Relación del nivel de Education con el salario
CREATE VIEW Education_And_Salary_With_Description AS
SELECT e.Education, 
       el.EducationLevel,
       ROUND(AVG(e.Salary), 2) AS AvgSalary
FROM employee e
JOIN education_level el ON e.Education = el.EducationLevelID
GROUP BY e.Education, el.EducationLevelID;

-- 4. Resultados de EnvironmentSatisfaction, JobSatisfaction y RelationshipSatisfaction
CREATE VIEW satisfaccion_general AS
SELECT EmployeeID, 
       EnvironmentSatisfaction, 
       JobSatisfaction, 
       RelationshipSatisfaction,
       ROUND((EnvironmentSatisfaction + JobSatisfaction + RelationshipSatisfaction) / 3.0, 2) AS GeneralSatisfaction
FROM performance_rating;

-- 5. Relación del desempeño con los años desde la última promoción
CREATE VIEW desempeno_promociones AS
SELECT	rl.RatingID,
		rl.RatingLevel,
	ROUND(AVG(e.YearsSinceLastPromotion), 2) AS PromedioLastPromotion
 FROM employee e   
 JOIN performance_rating pr ON e.employeeID = pr.EmployeeID
 JOIN rating_level rl ON pr.ManagerRating = rl.RatingID
 GROUP BY rl.RatingID, rl.RatingLevel;
 
 -- 6. Relación de WorkLifeBalance con DistanceFromHome
CREATE VIEW WorkLifeBalance_vs_Distance AS
SELECT e.DistanceFromHome_KM,
       pr.WorkLifeBalance
FROM employee e
JOIN performance_rating pr ON e.EmployeeID = pr.EmployeeID;

-- 7. Promedio de DistanceFromHome según WorkLifeBalance
CREATE VIEW Average_DistanceBy_WorkLifeBalance AS
SELECT 
    p.WorkLifeBalance,
    sl.SatisfactionLevel AS WorkLifeBalanceDescription,
    AVG(e.DistanceFromHome_KM) AS AverageDistanceFromHome
FROM employee e
JOIN performance_rating p ON e.EmployeeID = p.EmployeeID
JOIN satisfied_level sl ON p.WorkLifeBalance = sl.SatisfactionID  
GROUP BY p.WorkLifeBalance, sl.SatisfactionLevel;

SELECT * FROM Average_DistanceBy_WorkLifeBalance;



 