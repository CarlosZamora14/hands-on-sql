WITH
  CancelationReasons (SubscriptionID, CancelationReason) AS (
    SELECT
      SubscriptionID,
      CancelationReason1
    FROM
      Cancelations
    UNION ALL
    SELECT
      SubscriptionID,
      CancelationReason2
    FROM
      Cancelations
    UNION ALL
    SELECT
      SubscriptionID,
      CancelationReason3
    FROM
      Cancelations
  )
SELECT
  CAST(
    COUNT(
      CASE
        WHEN CancelationReason = 'Expensive' THEN 1
      END
    ) AS FLOAT
  ) / COUNT(DISTINCT SubscriptionID) AS percent_expensive
FROM
  CancelationReasons;
