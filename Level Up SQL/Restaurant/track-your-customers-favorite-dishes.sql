-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to the Quinoa Salmon Salad.
UPDATE Customers
SET FavoriteDish = (
  SELECT DishID
  FROM Dishes
  WHERE Name = 'Quinoa Salmon Salad'
)
WHERE
  FirstName = 'Cleo'
  AND LastName = 'Goldwater';

SELECT
  Name
FROM
  Customers AS C
  INNER JOIN Dishes AS D ON C.FavoriteDish = D.DishID
WHERE
  FirstName = 'Cleo';
