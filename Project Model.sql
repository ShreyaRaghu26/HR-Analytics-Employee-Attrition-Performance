create database employee;
use employee;

DROP TABLE IF EXISTS `employee_personal_details`;
CREATE TABLE employee_personal_details (
    EmployeeNumber INT PRIMARY KEY,
    Age INT,
    Attrition VARCHAR(100),
    Business_Travel VARCHAR(255),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(20),
    Gender ENUM('Male', 'Female'),
    MaritalStatus ENUM('Single', 'Married', 'Divorced'),
    NumCompaniesWorked INT
);

DROP TABLE IF EXISTS `department_details`;
CREATE TABLE department_details (
	Dept_No INT PRIMARY KEY AUTO_INCREMENT,
    Department VARCHAR(255),
    EmployeeCount INT
);

DROP TABLE IF EXISTS `employee_job_details`;
CREATE TABLE employee_job_details (
    JobID INT PRIMARY KEY AUTO_INCREMENT,
    Dept_No INT,
    EmployeeNumber INT,
    JobRole VARCHAR(255),
    JobLevel INT,
    JobInvolvement ENUM('1','2','3','4'),
    PerformanceRating ENUM('1','2','3','4'),
    FOREIGN KEY (EmployeeNumber) REFERENCES employee_personal_details(EmployeeNumber),
    FOREIGN KEY (Dept_No) REFERENCES department_details(Dept_No)
);
    
DROP TABLE IF EXISTS `employee_wages`;
CREATE TABLE employee_wages (
	WageID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeNumber INT,
    DailyRate INT,
    HourlyRate INT,
    MonthlyRate INT,
    OverTime ENUM('Yes', 'No'),
    FOREIGN KEY (EmployeeNumber) REFERENCES employee_personal_details(EmployeeNumber)
);

DROP TABLE IF EXISTS `employee_compensation`;
CREATE TABLE employee_compensation (
    CompensationID INT PRIMARY KEY AUTO_INCREMENT,
    WageID INT,
    EmployeeNumber INT,
    MonthlyIncome INT,
    PercentSalaryHike INT,
    StockOptionLevel ENUM('0','1','2','3'),
    FOREIGN KEY (EmployeeNumber) REFERENCES employee_personal_details(EmployeeNumber),
    FOREIGN KEY (WageID) REFERENCES employee_wages(WageID)
);

DROP TABLE IF EXISTS `employee_work_history`;
CREATE TABLE employee_work_history (
    WorkID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeNumber INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrentManager INT,
    FOREIGN KEY (EmployeeNumber) REFERENCES employee_personal_details(EmployeeNumber)
);

DROP TABLE IF EXISTS `employee_satisfaction_balance`;
CREATE TABLE employee_satisfaction_balance (
    SatBalanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeNumber INT,
    JobSatisfaction ENUM('1','2','3','4'),
    EnvironmentSatisfaction ENUM('1','2','3','4'),
    RelationshipSatisfaction ENUM('1','2','3','4'),
	WorkLifeBalance ENUM('1','2','3','4'),
    FOREIGN KEY (EmployeeNumber) REFERENCES employee_personal_details(EmployeeNumber)
);
