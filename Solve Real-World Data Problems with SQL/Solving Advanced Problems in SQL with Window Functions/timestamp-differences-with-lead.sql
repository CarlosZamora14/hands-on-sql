SELECT
  *,
  LEAD (MovementDate) OVER (
    ORDER BY
      MovementDate
  ) AS NextStatusMovementDate,
  LEAD (MovementDate) OVER (
    ORDER BY
      MovementDate
  ) - MovementDate AS TimeInStatus
FROM
  PaymentStatusLog
WHERE
  SubscriptionID = '38844';
