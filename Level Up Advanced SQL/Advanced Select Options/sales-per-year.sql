WITH
  salesPerYears AS (
    SELECT
      strftime ('%Y', soldDate) AS year,
      salesAmount
    FROM
      sales
  )
SELECT
  year,
  CONCAT ('$', SUM(salesAmount)) AS revenue,
  COUNT(*) AS numSales
FROM
  salesPerYears
GROUP BY
  year
ORDER BY
  year ASC;
