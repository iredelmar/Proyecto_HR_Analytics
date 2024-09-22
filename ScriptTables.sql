use hr_analytics;


CREATE TABLE employee (
	EmployeeID varchar(10) PRIMARY KEY,
	FirstName VARCHAR(60),
	LastName VARCHAR(60),
	Gender VARCHAR(25),
	Age INT,
	BusinessTravel VARCHAR(20),
	Department VARCHAR(20),
	DistanceFromHome_KM INT,
	State VARCHAR(2),
	Ethnicity VARCHAR(50),
	Education INT,
	EducationField VARCHAR(20),
	JobRole VARCHAR(40),
	MaritalStatus VARCHAR(15),
	Salary INT,
	StockOptionLevel INT,
	OverTime VARCHAR(5),
	HireDate DATE, 
	Attrition VARCHAR(5),
	YearsAtCompany INT, 
	YearsInMostRecentRole INT, 
	YearsSinceLastPromotion INT,
	YearsWithCurrManager INT
);


CREATE TABLE education_level (
	EducationLevelID INT PRIMARY KEY,
	EducationLevel VARCHAR(50)
);


CREATE TABLE rating_level (
	RatingID INT PRIMARY KEY,
	RatingLevel VARCHAR(30)
);

CREATE TABLE satisfied_level (
	SatisfactionID INT PRIMARY KEY,
	SatisfactionLevel VARCHAR(30)
);

-- Agregar foreign key para vincular education de la tabla employee con EducationLevelID de la tabla education_level
ALTER TABLE employee
ADD CONSTRAINT FK_EducationLevel
FOREIGN KEY (Education) REFERENCES education_level(EducationLevelID);


ALTER TABLE performance_rating
ADD CONSTRAINT FK_Employee
FOREIGN KEY (EmployeeID) REFERENCES employee(EmployeeID);