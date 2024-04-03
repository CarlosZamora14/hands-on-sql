WITH
  MonthlyRev AS (
    SELECT
      P.ProductName,
      SUM(S.Revenue) AS Revenue
    FROM
      Subscriptions AS S
      INNER JOIN Products AS P ON S.ProductID = P.ProductID
    WHERE
      YEAR (S.OrderDate) = 2022
    GROUP BY
      P.ProductName,
      MONTH (S.OrderDate)
  )
SELECT
  ProductName,
  MIN(Revenue) AS min_rev,
  MAX(Revenue) AS max_rev,
  AVG(Revenue) AS avg_rev,
  STDDEV (Revenue) AS std_dev_rev
FROM
  MonthlyRev
GROUP BY
  ProductName;
