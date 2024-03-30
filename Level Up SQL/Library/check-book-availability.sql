-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.
SELECT
  (
    SELECT
      COUNT(*)
    FROM
      Books
    WHERE
      Title = 'Dracula'
  ) - (
    SELECT
      COUNT(*)
    FROM
      Loans AS L
      LEFT JOIN Books AS B ON L.BookID = B.BookID
    WHERE
      B.Title = 'Dracula'
      AND L.ReturnedDate IS NULL
  ) AS AvailableBooks;