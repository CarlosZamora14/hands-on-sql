-- Prepare a report of books due to be returned
-- to the library on July 13, 2022.
-- Provide the due date, the book title, and
-- the borrower's first name and email address.
SELECT
  P.FirstName,
  P.LastName,
  P.Email,
  B.Title,
  L.DueDate
FROM
  Patrons AS P
  INNER JOIN Loans AS L ON P.PatronID = L.PatronID
  INNER JOIN Books AS B ON L.BookID = B.BookID
WHERE
  L.DueDate = '2022-07-13'
  AND L.ReturnedDate IS NULL;