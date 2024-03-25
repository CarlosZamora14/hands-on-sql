SELECT TOP 3
  C.CustomerID,
  C.FirstName,
  C.LastName,
  COUNT(*) AS CustomerOrderCount
FROM
  Customers AS C
  INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
  C.CustomerID
ORDER BY
  CustomerOrderCount DESC;