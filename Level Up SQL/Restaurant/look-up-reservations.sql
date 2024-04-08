-- Find the reservation information for a customer whose
-- name we aren't quite sure how to spell.

-- Variations of the name include:
-- Stevensen, Stephensen, Stevenson, Stephenson, Stuyvesant
-- There are four people in the party. Today is June 14th.
SELECT
  *
FROM
  Reservations AS R
  INNER JOIN Customers AS C ON R.CustomerID = C.CustomerID
WHERE
  strftime ('%m', R.Date) = '06'
  AND strftime ('%d', R.Date) = '14'
  AND R.PartySize = 4
  AND (
    FirstName LIKE 'St%'
    OR LastName LIKE 'St%'
  );
