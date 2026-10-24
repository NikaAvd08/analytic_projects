ATTACH DATABASE 'data/vitrine.db' AS vitrine;

DROP TABLE IF EXISTS vitrine.daily_revenue_trend;
CREATE TABLE  vitrine.daily_revenue_trend AS
WITH daily_payment AS (
	SELECT 
		DATE(payment_date) AS revenue_date,
        SUM(amount) AS daily_amount
	FROM payment
    GROUP BY DATE(payment_date)
)
SELECT 
	revenue_date,
    daily_amount,
    SUM(daily_amount) OVER (ORDER BY  revenue_date) AS runing_total_revenue,
    ROUND(AVG(daily_amount) OVER (
		ORDER BY revenue_date
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
	),2) AS rolling_avg_7_days
FROM daily_payment;


DROP TABLE IF EXISTS vitrine.customer_rental_gaps;
CREATE TABLE vitrine.customer_rental_gaps AS
WITH rental_sequence AS (
    SELECT
        customer_id,
        rental_date,
        LAG(rental_date) OVER (
            PARTITION BY customer_id
            ORDER BY rental_date
        ) AS previous_rental_date
    FROM rental
),
gaps_aggregation AS (
    SELECT
        customer_id,
        CASE
            WHEN previous_rental_date IS NOT NULL 
            THEN CAST(JULIANDAY(rental_date) - JULIANDAY(previous_rental_date) AS INTEGER) 
            ELSE NULL
        END AS days_since_last_rental
    FROM rental_sequence
)
SELECT 
    days_since_last_rental,
    COUNT(*) AS total_cases 
FROM gaps_aggregation
WHERE days_since_last_rental IS NOT NULL
GROUP BY days_since_last_rental
ORDER BY days_since_last_rental ASC;


