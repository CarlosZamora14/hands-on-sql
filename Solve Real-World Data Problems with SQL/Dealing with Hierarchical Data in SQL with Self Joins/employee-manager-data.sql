SELECT
  E.EmployeeID,
  E.Name AS employee_name,
  M.Name AS manager_name,
  CASE
    WHEN M.Email IS NOT NULL THEN M.Email
    ELSE E.Email
  END AS contact_email
FROM
  Employees AS E
  LEFT JOIN Employees AS M ON E.ManagerID = M.EmployeeID
WHERE
  E.Department = 'Sales';
