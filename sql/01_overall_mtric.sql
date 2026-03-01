SELECT
    COUNT(*) AS total_customers,
    SUM(churn) AS total_churned,
    ROUND(AVG(churn) * 100, 2) AS overall_churn_rate_percent
FROM churn;