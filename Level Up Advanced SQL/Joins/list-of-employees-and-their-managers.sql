SELECT
  E.firstName AS EmployeeFirstName,
  E.lastName AS EmployeeLastName,
  M.firstName AS ManagerFirstName,
  M.lastName AS ManagerLastName
FROM
  employee AS E
  INNER JOIN employee AS M ON E.managerId = M.employeeId;
