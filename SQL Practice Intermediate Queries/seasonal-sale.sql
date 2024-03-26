SELECT
  Name,
  Price AS OriginalPrice,
  CONCAT(ROUND(Discount * 100, 0), '%') AS DiscountPercent,
  ROUND(Price * (1 - Discount), 2) AS DiscountedPrice
FROM (
  SELECT
    *,
    CASE
      WHEN Price > 10 THEN 0.15
      WHEN Price >= 7 THEN 0.1
      ELSE 0.05
    END AS Discount
  FROM
    Dishes
)
ORDER BY
  Name ASC;