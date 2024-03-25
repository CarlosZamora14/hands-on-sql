SELECT
  FirstName,
  LastName,
  City
FROM
  Customers
WHERE
  City LIKE 'R%'
ORDER BY
  City ASC;