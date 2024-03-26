SELECT
  C.CustomerID,
  C.FirstName,
  C.LastName,
  SUM(D.Price) AS TotalSpend
FROM
  Customers AS C
  INNER JOIN Orders AS O ON C.CustomerID = O.CUSTOMERID
  INNER JOIN OrdersDishes AS OD ON O.OrderID = OD.OrderID
  INNER JOIN Dishes AS D ON OD.DishID = D.DishID
GROUP BY
  C.CustomerID
HAVING
  TotalSpend > 450
ORDER BY
  TotalSpend DESC;