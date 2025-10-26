use reshma;
SELECT * FROM bank_churn LIMIT 10;
SELECT COUNT(*) AS Total_Customers FROM bank_churn;
SELECT COUNT(*) AS Total_Customers, SUM(Exited) AS Churned_Customers,
ROUND(100.0 * SUM(Exited) / COUNT(*), 2) AS Churn_Rate FROM bank_churn;
SELECT Geography, COUNT(*) AS Total_Customers, 
SUM(Exited) AS Churned_Customers, ROUND(100.0 * SUM(Exited)/COUNT(*), 2) 
AS Churn_Rate FROM bank_churn
GROUP BY Geography ORDER BY Churn_Rate DESC;
SELECT 
    Gender,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(100.0 * SUM(Exited)/COUNT(*), 2) AS Churn_Rate
FROM bank_churn
GROUP BY Gender
ORDER BY Churn_Rate DESC;

SELECT 
    Exited AS Churn_Status,
    ROUND(AVG(Age),1) AS Avg_Age,
    ROUND(AVG(CreditScore),1) AS Avg_CreditScore,
    ROUND(AVG(Balance),2) AS Avg_Balance,
    ROUND(AVG(EstimatedSalary),2) AS Avg_Salary
FROM bank_churn
GROUP BY Exited; 
SELECT Exited, ROUND(AVG(Age),1) AS Avg_Age,
ROUND(AVG(CreditScore),1) AS Avg_CreditScore, ROUND(AVG(Balance),1) AS Avg_Balance,
ROUND(AVG(EstimatedSalary),1) AS Avg_Salary FROM bank_churn
GROUP BY Exited;
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Young (<30)'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle-Aged (30–50)'
        ELSE 'Senior (>50)'
    END AS Age_Group,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned,
    ROUND(100.0 * SUM(Exited)/COUNT(*), 2) AS Churn_Rate
FROM bank_churn
GROUP BY Age_Group
ORDER BY Churn_Rate DESC; 
SELECT NumOfProducts, COUNT(*) AS Total_Customers, SUM(Exited) AS 
Churned_Customers, ROUND(100.0 * SUM(Exited)/COUNT(*), 2) AS 
Churn_Rate FROM bank_churn GROUP BY NumOfProducts ORDER BY NumOfProducts;

SELECT IsActiveMember, COUNT(*) AS Total_Customers, SUM(Exited) AS Churned_Customers,
 ROUND(100.0 * SUM(Exited)/COUNT(*), 2) AS Churn_Rate FROM bank_churn GROUP BY IsActiveMember;
 
 SELECT 
    HasCrCard,
    COUNT(*) AS Total_Customers,
    SUM(Exited) AS Churned_Customers,
    ROUND(100.0 * SUM(Exited)/COUNT(*), 2) AS Churn_Rate
FROM bank_churn
GROUP BY HasCrCard;

SELECT 
    CustomerID, Surname, Geography, Gender, Balance, Age, EstimatedSalary
FROM bank_churn
WHERE Exited = 1
ORDER BY Balance DESC
LIMIT 10;

SELECT 
    IsActiveMember,
    ROUND(AVG(Balance),2) AS Avg_Balance,
    ROUND(AVG(CreditScore),2) AS Avg_CreditScore,
    ROUND(100.0 * SUM(Exited)/COUNT(*), 2) AS Churn_Rate
FROM bank_churn
GROUP BY IsActiveMember
ORDER BY Avg_Balance DESC;




