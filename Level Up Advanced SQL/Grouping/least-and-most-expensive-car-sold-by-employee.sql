SELECT
  E.employeeId,
  E.firstName,
  E.lastName,
  MIN(S.salesAmount) AS leastExpensive,
  MAX(S.salesAmount) AS mostExpensive
FROM
  employee AS E
  INNER JOIN sales AS S ON E.employeeId = S.employeeID
WHERE
  strftime ('%Y', S.soldDate) = '2022'
GROUP BY
  E.employeeId;
