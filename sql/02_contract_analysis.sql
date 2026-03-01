SELECT
    Contract,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(AVG(churn) * 100, 2) AS churn_rate_percent
FROM churn
GROUP BY Contract
ORDER BY churn_rate_percent DESC;