-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899
-- which are not currently checked out.
SELECT
  Title,
  Author,
  Barcode
FROM
  Books
WHERE
  BookID NOT IN(
    SELECT
      B.BookID
    FROM
      Books AS B
      INNER JOIN Loans AS L ON B.BookID = L.BookID
    WHERE
      L.ReturnedDate IS NULL
  )
  AND Published BETWEEN 1890 AND 1899
ORDER BY
  Title ASC;

-- Alternative solution using JOIN
SELECT
  B.Title,
  B.Author,
  B.Barcode
FROM
  Books AS B
  LEFT JOIN Loans AS L ON B.BookID = L.BookID
WHERE
  B.Published BETWEEN 1890 AND 1899
GROUP BY
  B.BookID
HAVING
  COUNT(LoanDate) = SUM(IIF (L.ReturnedDate IS NOT NULL, 1, 0))
ORDER BY
  B.Title ASC;