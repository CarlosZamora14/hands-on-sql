-- Enter a customer's delivery order into our database,
-- and provide the total cost of the items ordered.

-- Use this order information:
--  Customer: Loretta Hundey, at 6939 Elka Place
--  Items:
--    1 House Salad,
--    1 Mini Cheeseburgers, and
--    1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.
INSERT INTO Orders (CustomerID, OrderDate)
VALUES ((
  SELECT
    CustomerID
  FROM
    Customers
  WHERE
    Address = '6939 Elka Place'
    AND FirstName = 'Loretta'
    AND LastName = 'Hundey'
), '2022-09-20 14:00:00');

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES ((
  SELECT OrderID
  FROM Orders
  WHERE OrderDate = '2022-09-20 14:00:00'
), (
  SELECT DishID
  FROM Dishes
  WHERE Name = 'House Salad'
));

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES ((
  SELECT OrderID
  FROM Orders
  WHERE OrderDate = '2022-09-20 14:00:00'
), (
  SELECT DishID
  FROM Dishes
  WHERE Name = 'Mini Cheeseburgers'
));

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES ((
  SELECT OrderID
  FROM Orders
  WHERE OrderDate = '2022-09-20 14:00:00'
), (
  SELECT DishID
  FROM Dishes
  WHERE Name = 'Tropical Blue Smoothie'
));

SELECT
  SUM(Price)
FROM
  Orders AS O
  INNER JOIN OrdersDishes AS OD ON O.OrderID = OD.OrderID
  INNER JOIN Dishes AS D ON OD.DishID = D.DishID
WHERE O.OrderID = (
  SELECT OrderID
  FROM Orders
  WHERE OrderDate = '2022-09-20 14:00:00'
);
