SELECT
    COUNT(*) AS total_customers,
    SUM(churn) AS total_churned,
    ROUND(AVG(churn) * 100, 2) AS overall_churn_rate_percent,

    ROUND(
        (
          (SUM(churn) -
            SUM(
              CASE
                WHEN Contract = 'Month-to-month'
                 AND InternetService = 'Fiber optic'
                 AND TechSupport = 'No'
                 AND churn = 1
                THEN 1 ELSE 0
              END
            )
          )
          +
          (0.475 *
            SUM(
              CASE
                WHEN Contract = 'Month-to-month'
                 AND InternetService = 'Fiber optic'
                 AND TechSupport = 'No'
                THEN 1 ELSE 0
              END
            )
          )
        ) / COUNT(*) * 100
    , 2) AS new_overall_churn_rate_percent

FROM churn;