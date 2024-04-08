-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.
SELECT
  FirstName,
  LastName,
  Email,
  COUNT(*) AS NumberOrders
FROM
  Customers AS C
  INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY
  C.CustomerID
ORDER BY
  NumberOrders DESC
LIMIT
  10;
