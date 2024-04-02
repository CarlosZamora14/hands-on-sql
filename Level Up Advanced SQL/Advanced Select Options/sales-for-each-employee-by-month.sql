WITH
  employeeSales AS (
    SELECT
      E.employeeId,
      E.firstName,
      E.lastName,
      S.salesAmount,
      strftime ('%m', S.soldDate) AS month
    FROM
      employee AS E
      INNER JOIN sales AS S ON E.employeeId = S.employeeId
    WHERE
      strftime ('%Y', S.soldDate) = '2021'
  )
SELECT
  employeeId,
  firstName,
  lastName,
  SUM(IIF (month = '01', salesAmount, 0)) AS janSales,
  SUM(IIF (month = '02', salesAmount, 0)) AS febSales,
  SUM(IIF (month = '03', salesAmount, 0)) AS marSales,
  SUM(IIF (month = '04', salesAmount, 0)) AS aprSales,
  SUM(IIF (month = '05', salesAmount, 0)) AS maySales,
  SUM(IIF (month = '06', salesAmount, 0)) AS junSales,
  SUM(IIF (month = '07', salesAmount, 0)) AS julSales,
  SUM(IIF (month = '08', salesAmount, 0)) AS augSales,
  SUM(IIF (month = '09', salesAmount, 0)) AS sepSales,
  SUM(IIF (month = '10', salesAmount, 0)) AS octSales,
  SUM(IIF (month = '11', salesAmount, 0)) AS novSales,
  SUM(IIF (month = '12', salesAmount, 0)) AS decSales
FROM
  employeeSales
GROUP BY
  employeeId;
