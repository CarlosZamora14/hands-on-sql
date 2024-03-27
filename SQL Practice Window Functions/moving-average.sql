SELECT
  *,
  ROUND(AVG(OrderTotal) OVER (
    PARTITION BY CustomerID
    ORDER BY OrderID ASC
    ROWS BETWEEN 2 PRECEDING AND 0 FOLLOWING
  ), 2) AS MovingAvg
FROM (
  SELECT
    O.CustomerID,
    O.OrderID,
    SUM(D.Price) AS OrderTotal
  FROM
    Orders AS O
    INNER JOIN OrdersDishes AS OD ON O.OrderID = OD.OrderID
    INNER JOIN Dishes AS D ON OD.DishID = D.DishID
  GROUP BY
    O.OrderID
)
ORDER BY
  CustomerID ASC,
  OrderID ASC;