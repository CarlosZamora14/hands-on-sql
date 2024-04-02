SELECT
  E.employeeId,
  E.firstName,
  E.lastName,
  I.modelId,
  COUNT(I.modelId) AS salesCount,
  RANK() OVER (
    PARTITION BY
      E.employeeId
    ORDER BY
      COUNT(I.modelId) DESC
  ) AS rank
FROM
  employee AS E
  INNER JOIN sales AS S ON E.employeeId = S.employeeId
  INNER JOIN inventory AS I ON S.inventoryId = I.inventoryId
GROUP BY
  E.employeeId,
  I.modelId;
