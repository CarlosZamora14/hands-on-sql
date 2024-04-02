SELECT
  strftime ('%Y', soldDate) AS year,
  strftime ('%m', soldDate) AS month,
  COUNT(salesId) AS monthlySalesCount,
  LAG (COUNT(salesId), 1) OVER (
    ORDER BY
      soldDate
  ) AS prevMonthlySalesCount
FROM
  sales
GROUP BY
  year,
  month;
