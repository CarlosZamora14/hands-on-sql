SELECT
  R.Date,
  R.PartySize,
  C.FirstName,
  C.LastName,
  C.Email
FROM
  Reservations AS R
  JOIN Customers AS C USING(CustomerID)
ORDER BY
  R.Date DESC
LIMIT
  2;