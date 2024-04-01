SELECT
  E.*
FROM
  employee AS E
  LEFT JOIN sales AS S ON E.employeeId = S.employeeId
WHERE
  title = 'Sales Person'
  AND S.salesId IS NULL;
