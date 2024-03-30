-- Create two reports about book statistics.

-- Report 1: Show how many titles were published in each year.
SELECT
  Published AS Year,
  COUNT(DISTINCT Title) AS BooksPublished,
  GROUP_CONCAT(DISTINCT Title) AS 'Books'
FROM
  Books
GROUP BY
  Published
ORDER BY
  BooksPublished DESC;

-- Report 2: Show the five books that have been checked out the most.
SELECT
  B.Title,
  B.Author,
  COUNT(*) AS LoanCount
FROM
  Loans AS L
  INNER JOIN Books AS B ON L.BookID = B.BookID
GROUP BY
  B.Title
ORDER BY
  LoanCount DESC
LIMIT
  5;