SELECT
    SUM(
        CASE 
            WHEN Contract = 'Month-to-month'
             AND InternetService = 'Fiber optic'
             AND TechSupport = 'No'
            THEN 1 ELSE 0
        END
    ) AS high_risk_customers,

    SUM(
        CASE 
            WHEN Contract = 'Month-to-month'
             AND InternetService = 'Fiber optic'
             AND TechSupport = 'No'
             AND churn = 1
            THEN 1 ELSE 0
        END
    ) AS high_risk_churned,

    ROUND(
        SUM(
            CASE 
                WHEN Contract = 'Month-to-month'
                 AND InternetService = 'Fiber optic'
                 AND TechSupport = 'No'
                 AND churn = 1
                THEN 1 ELSE 0
            END
        )
        /
        SUM(
            CASE 
                WHEN Contract = 'Month-to-month'
                 AND InternetService = 'Fiber optic'
                 AND TechSupport = 'No'
                THEN 1 ELSE 0
            END
        ) * 100
    , 2) AS high_risk_churn_rate_percent,

    ROUND(
        SUM(
            CASE 
                WHEN Contract = 'Month-to-month'
                 AND InternetService = 'Fiber optic'
                 AND TechSupport = 'No'
                THEN 1 ELSE 0
            END
        )
        /
        COUNT(*) * 100
    , 2) AS high_risk_percent_of_total_customers,

    ROUND(
        SUM(
            CASE 
                WHEN Contract = 'Month-to-month'
                 AND InternetService = 'Fiber optic'
                 AND TechSupport = 'No'
                 AND churn = 1
                THEN 1 ELSE 0
            END
        )
        /
        SUM(churn) * 100
    , 2) AS high_risk_share_of_total_churn_percent

FROM churn;