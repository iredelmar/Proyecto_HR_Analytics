DELIMITER //

CREATE PROCEDURE Calculate_Attrition_Rate()
BEGIN
    -- Eliminar la vista si ya existe
    DROP VIEW IF EXISTS Department_Attrition_Rate;

    -- Crear la nueva vista
    CREATE VIEW Department_Attrition_Rate AS
    SELECT Department,
           ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(EmployeeID) * 100, 2) AS AttritionRate
    FROM employee
    GROUP BY Department;
END //

DELIMITER ;


CALL Calculate_Attrition_Rate();

SELECT * FROM Department_Attrition_Rate;