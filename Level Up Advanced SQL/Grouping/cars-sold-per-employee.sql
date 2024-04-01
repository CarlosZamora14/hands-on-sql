SELECT
  E.employeeId,
  E.firstName,
  E.lastName,
  COUNT(S.salesId) AS salesCount
FROM
  employee AS E
  INNER JOIN sales AS S ON E.employeeId = S.employeeId
GROUP BY
  E.employeeId
ORDER BY
  salesCount DESC;
