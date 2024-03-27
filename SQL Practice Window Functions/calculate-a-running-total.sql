SELECT
  Date,
  PartySize,
  SUM(PartySize) OVER (
    ORDER BY Date
    ROWS UNBOUNDED PRECEDING
  ) AS Total
FROM
  Reservations
WHERE
  YEAR(Date) >= 2022;