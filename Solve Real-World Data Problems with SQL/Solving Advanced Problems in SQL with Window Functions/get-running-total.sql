SELECT
  E.EmployeeID AS SalesEmployeeID,
  S.SaleDate,
  S.SaleAmount,
  SUM(S.SaleAmount) OVER (
    PARTITION BY
      E.EmployeeID
    ORDER BY
      S.SaleDate ASC
  ) AS running_total,
  CAST(
    SUM(S.SaleAmount) OVER (
      PARTITION BY
        E.EmployeeID
      ORDER BY
        S.SaleDate ASC
    ) AS FLOAT
  ) / E.Quota AS percent_quota
FROM
  Employees AS E
  INNER JOIN Sales AS S ON E.EmployeeID = S.SalesEmployeeID
WHERE
  E.Department = 'Sales';
