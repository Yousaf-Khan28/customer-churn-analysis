SELECT
    InternetService,
    COUNT(*) AS customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percent
FROM churn
GROUP BY InternetService
ORDER BY churn_rate_percent DESC;


SELECT
    TechSupport,
    COUNT(*) AS customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percent
FROM churn
GROUP BY TechSupport
ORDER BY churn_rate_percent DESC;