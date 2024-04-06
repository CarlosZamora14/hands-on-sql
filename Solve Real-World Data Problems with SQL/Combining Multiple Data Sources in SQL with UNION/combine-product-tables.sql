With
  AllSubscriptions as (
    SELECT
      SubscriptionID,
      ExpirationDate
    FROM
      SubscriptionsProduct1
    WHERE
      Active = 1
    UNION
    SELECT
      SubscriptionID,
      ExpirationDate
    FROM
      SubscriptionsProduct2
    WHERE
      Active = 1
  )
SELECT
  DATE_TRUNC ('year', ExpirationDate) AS exp_year,
  COUNT(*) AS Subscriptions
FROM
  AllSubscriptions
GROUP BY
  DATE_TRUNC ('year', ExpirationDate)
