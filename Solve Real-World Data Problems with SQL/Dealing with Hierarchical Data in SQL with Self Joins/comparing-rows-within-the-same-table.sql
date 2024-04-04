WITH
  MonthlyRevenue AS (
    SELECT
      DATE_TRUNC ('month', OrderDate) AS Month,
      SUM(Revenue) AS Revenue
    FROM
      Subscriptions
    GROUP BY
      Month
  )
SELECT
  CurrentMonths.Month AS current_month,
  PreviousMonths.Month AS previous_month,
  CurrentMonths.Revenue AS current_revenue,
  PreviousMonths.Revenue AS previous_revenue
FROM
  MonthlyRevenue AS CurrentMonths
  INNER JOIN MonthlyRevenue AS PreviousMonths ON DATEDIFF (
    'month',
    PreviousMonths.Month,
    CurrentMonths.Month
  ) = 1
WHERE
  CurrentMonths.Revenue > PreviousMonths.Revenue
