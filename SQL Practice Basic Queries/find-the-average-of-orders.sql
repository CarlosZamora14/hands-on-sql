SELECT
  AVG(OrderTotal) AS OrderAverage
FROM (
  SELECT
    SUM(D.Price) AS OrderTotal
  FROM
    Orders AS O
    INNER JOIN OrdersDishes AS OD ON O.OrderID = OD.OrderID
    INNER JOIN Dishes AS D ON OD.DishID = D.DishID
  GROUP BY
    O.OrderID
) AS T;