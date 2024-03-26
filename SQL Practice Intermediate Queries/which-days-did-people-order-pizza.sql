SELECT
  COUNT(*) AS NumSold,
  CAST(O.OrderDate AS DATE) AS Day
FROM
  Orders AS O
  INNER JOIN OrdersDishes AS OD ON O.OrderID = OD.OrderID
  INNER JOIN Dishes AS D ON OD.DishID = D.DishID
WHERE
  D.name = 'Handcrafted Pizza'
GROUP BY
  Day
ORDER BY
  Day ASC;