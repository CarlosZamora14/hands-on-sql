-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't be able to keep his Friday reservation.
-- Today is July 24, 2022.
DELETE FROM Reservations
WHERE ReservationID = (
  SELECT
    R.ReservationID
  FROM
    Reservations AS R
    INNER JOIN Customers AS C ON R.CustomerID = C.CustomerID
  WHERE
    C.FirstName = 'Norby'
    AND strftime ('%w', R.Date) = '5'
    AND R.Date >= '2022-06-24'
  ORDER BY
    R.Date
  LIMIT
    1
);