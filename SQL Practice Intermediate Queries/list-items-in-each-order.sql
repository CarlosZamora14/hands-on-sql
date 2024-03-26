SELECT
  O.OrderID,
  GROUP_CONCAT(
    D.Name
    ORDER BY
      D.Name ASC SEPARATOR ','
  ) AS Items
FROM
  Orders AS O
  INNER JOIN OrdersDishes AS OD ON O.OrderID = OD.OrderID
  INNER JOIN Dishes AS D ON OD.DishID = D.DishID
WHERE
  O.OrderDate > '2022-05-01'
GROUP BY
  O.OrderID;