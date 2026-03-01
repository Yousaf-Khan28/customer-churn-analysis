USE churn_analysis;
SHOW TABLES;
SELECT COUNT(*) AS total_rows
FROM churn;

SELECT
	SUM(churn) AS total_churned,
    COUNT(*) AS total_customers,
    ROUND(avg(churn) * 100, 2) AS churn_rate_percentage
FROM churn

SELECT
    SUM(
		CASE
			WHEN Contract = 'Month-to-month'
             AND InternetService = 'Fiber optic'
             AND TechSupport = 'No'
            THEN 1
            ELSE 0
		END
	) AS high_risk,
    ROUND(
		SUM(
        	CASE
				WHEN Contract = 'Month-to-month'
				 AND InternetService = 'Fiber optic'
				 AND TechSupport = 'No'
				THEN 1
				ELSE 0
			END
            ) / COUNT(*) * 100, 2
	) AS high_risk_percentage
FROM churn

