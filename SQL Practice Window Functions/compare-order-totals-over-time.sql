SELECT
  O.OrderID,
  SUM(D.Price) AS ThisOrderPrice,
  SUM(D.Price) - LAG(SUM(D.Price)) OVER (
    ORDER BY O.OrderID
  ) AS DiffFromPrev
FROM
  Orders AS O
  INNER JOIN OrdersDishes AS OD ON O.OrderID = OD.OrderID
  INNER JOIN Dishes AS D ON OD.DishID = D.DishID
WHERE
  YEAR(O.OrderDate) >= 2022
GROUP BY
  O.OrderID
ORDER BY
  O.OrderID;