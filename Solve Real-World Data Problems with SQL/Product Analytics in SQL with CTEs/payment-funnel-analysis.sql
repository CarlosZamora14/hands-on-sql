WITH
  MaxStatusReached AS (
    SELECT
      MAX(StatusID) AS MaxStatus,
      SubscriptionID
    FROM
      PaymentStatusLog
    GROUP BY
      SubscriptionID
  )
SELECT
  CASE
    WHEN M.MaxStatus = 1 THEN 'PaymentWidgetOpened'
    WHEN M.MaxStatus = 2 THEN 'PaymentEntered'
    WHEN M.MaxStatus = 3 AND S.CurrentStatus = 0 THEN 'User Error with Payment Submission'
    WHEN M.MaxStatus = 3 AND S.CurrentStatus != 0 THEN 'Payment Submitted'
    WHEN M.MaxStatus = 4 AND S.CurrentStatus = 0 THEN 'Payment Processing Error with Vendor'
    WHEN M.MaxStatus = 4 AND S.CurrentStatus != 0 THEN 'Payment Success'
    WHEN M.MaxStatus = 5 THEN 'Complete'
    WHEN M.MaxStatus IS NULL THEN 'User did not start payment process'
  END AS PaymentFunnelStage,
  COUNT(*) As Subscriptions
FROM
  Subscriptions AS S
  LEFT JOIN MaxStatusReached AS M ON S.SubscriptionID = M.SubscriptionID
GROUP BY
  PaymentFunnelStage;
