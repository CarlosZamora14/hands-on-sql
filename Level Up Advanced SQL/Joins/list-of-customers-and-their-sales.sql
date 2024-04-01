SELECT
  C.customerId,
  C.firstName,
  C.lastName,
  S.salesId,
  S.salesAmount,
  S.soldDate
FROM
  customer AS C
  LEFT OUTER JOIN sales AS S ON C.customerId = S.customerId
UNION
SELECT
  C.customerId,
  C.firstName,
  C.lastName,
  S.salesId,
  S.salesAmount,
  S.soldDate
FROM
  sales AS S
  LEFT OUTER JOIN customer AS C ON C.customerId = S.customerId;
