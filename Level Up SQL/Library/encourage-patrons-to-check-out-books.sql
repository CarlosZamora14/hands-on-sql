-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT
  COUNT(*) AS TotalLoans,
  P.*
FROM
  Patrons AS P
  INNER JOIN Loans AS L ON P.PatronID = L.PatronID
GROUP BY
  P.PatronID
ORDER BY
  TotalLoans ASC
LIMIT
  15;