-- Add a customer to the restaurant's loyalty program.

INSERT INTO Customers (
  FirstName,
  LastName,
  Email,
  Address,
  City,
  State,
  Phone,
  Birthday
) VALUES (
  'John',
  'Doe',
  'johndoe@gmail.com',
  '1428 Elm Street',
  'Springwood',
  'OH',
  '555-123-4567',
  '1986-04-17'
);

SELECT * FROM Customers ORDER BY CustomerID DESC;