SELECT
  LPAD(EmployeeID, 5, 0) AS ID,
  CONCAT(LastName, ', ', FirstName) AS Name,
  LOWER(CONCAT(SUBSTR(FirstName, 1, 1), SUBSTR(LastName, 1, 7))) AS Login,
  CONCAT(Username, '@nadias-garden.com') AS Email
FROM
  Employees
ORDER BY
  Name ASC;