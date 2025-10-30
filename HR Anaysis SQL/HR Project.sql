use reshma;
select * from hr_analytics_data;
-- 1. Identify Top 5 Departments by Attrition Rate
SELECT 
    Department,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*) AS AttritionRate
FROM hr_analytics_data
GROUP BY Department
ORDER BY AttritionRate DESC
LIMIT 5;

-- 2. Average Monthly Income by JobRole (Aggregation + HAVING)
SELECT 
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS AvgSalary
FROM hr_analytics_data
GROUP BY JobRole
HAVING AVG(MonthlyIncome) > 5000
ORDER BY AvgSalary DESC;
-- 3. Attrition Trend by Work Experience (CASE + Aggregate)
SELECT 
    CASE 
        WHEN YearsAtCompany < 3 THEN 'New (<3 years)'
        WHEN YearsAtCompany BETWEEN 3 AND 7 THEN 'Mid (3-7 years)'
        ELSE 'Senior (>7 years)'
    END AS ExperienceLevel,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS EmployeesLeft,
    COUNT(*) AS TotalEmployees,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS AttritionRate
FROM hr_analytics_data
GROUP BY ExperienceLevel
ORDER BY 
    CASE 
        WHEN ExperienceLevel = 'New (<3 years)' THEN 1
        WHEN ExperienceLevel = 'Mid (3-7 years)' THEN 2
        WHEN ExperienceLevel = 'Senior (>7 years)' THEN 3
    END ASC;

CREATE VIEW Attrition_Risk_View AS
SELECT 
    
    Department,
    JobRole,
    MonthlyIncome,
    OverTime,
    JobSatisfaction,
    YearsSinceLastPromotion,
    CASE 
        WHEN OverTime = 'Yes' AND JobSatisfaction <= 2 THEN 'High Risk'
        WHEN OverTime = 'No' AND JobSatisfaction <= 2 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS RiskLevel
FROM hr_analytics_data;
SELECT * FROM Attrition_Risk_View WHERE RiskLevel='High Risk';
SELECT 
    'Attrited Employees' AS Category,
    AVG(MonthlyIncome) AS AvgIncome,
    AVG(YearsAtCompany) AS AvgTenure
FROM hr_analytics_data
WHERE Attrition = 'Yes'

UNION ALL

SELECT 
    'Active Employees' AS Category,
    AVG(MonthlyIncome),
    AVG(YearsAtCompany)
FROM hr_analytics_data
WHERE Attrition = 'No';

SELECT 
    d.DepartmentName,
    e.Gender,
    COUNT(CASE WHEN e.Attrition='Yes' THEN 1 END) AS EmployeesLeft,
    COUNT(*) AS TotalEmployees,
    ROUND(COUNT(CASE WHEN e.Attrition='Yes' THEN 1 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM hr_analytics_data e
JOIN Department d ON e.Department = d.DepartmentName
GROUP BY d.DepartmentName, e.Gender
ORDER BY d.DepartmentName;

SELECT 
    Department,
    Gender,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS EmployeesLeft,
    COUNT(*) AS TotalEmployees,
    ROUND(
        COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS AttritionRate
FROM hr_analytics_data
GROUP BY Department, Gender
ORDER BY Department;



