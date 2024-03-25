SELECT
  O.OrderID,
  C.FirstName,
  C.LastName,
  SUM(D.Price) AS OrderTotal
FROM
  Customers AS C
  INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
  INNER JOIN OrdersDishes AS OD ON O.OrderID = OD.OrderID
  INNER JOIN Dishes AS D ON OD.DishID = D.DishID
GROUP BY
  O.OrderID
ORDER BY
  OrderTotal DESC
LIMIT
  1;