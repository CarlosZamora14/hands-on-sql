WITH
  CustomersReport AS (
    SELECT
      CustomerID,
      COUNT(*) AS num_products,
      SUM(NumberofUsers) AS total_users,
    FROM
      Subscriptions
    GROUP BY
      CustomerID
  )
SELECT
  *,
  CASE
    WHEN num_products = 1 OR total_users >= 5000 THEN 1
    ELSE 0
  END AS upsell_opportunity
FROM
  CustomersReport;