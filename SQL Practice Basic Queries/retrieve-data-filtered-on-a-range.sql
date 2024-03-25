SELECT
  DishID,
  Name,
  Price
FROM
  Dishes
WHERE
  Price BETWEEN 8.00 AND 9.00
ORDER BY
  name ASC;