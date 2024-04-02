WITH
  monthAndYear AS (
    SELECT
      *,
      strftime ('%m', soldDate) AS month,
      strftime ('%Y', soldDate) AS year
    FROM
      sales
  )
SELECT
  year,
  month,
  COUNT(salesId) salesPerMonth,
  SUM(COUNT(salesId)) OVER (
    PARTITION BY
      year
    ORDER BY
      year ASC,
      month ASC
  ) AS annualRunningTotal
FROM
  monthAndYear
GROUP BY
  year,
  month;
