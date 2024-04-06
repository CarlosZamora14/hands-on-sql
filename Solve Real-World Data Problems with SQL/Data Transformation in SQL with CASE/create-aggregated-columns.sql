SELECT
  EL.UserID,
  SUM(
    CASE
      WHEN ED.EventID = 1 THEN 1
      ELSE 0
    END
  ) AS ViewedHelpCenterPage,
  SUM(
    CASE
      WHEN ED.EventID = 2 THEN 1
      ELSE 0
    END
  ) AS ClickedFAQS,
  SUM(
    CASE
      WHEN ED.EventID = 3 THEN 1
      ELSE 0
    END
  ) AS ClickedContactSupport,
  SUM(
    CASE
      WHEN ED.EventID = 4 THEN 1
      ELSE 0
    END
  ) AS SubmittedTicket
FROM
  FrontendEventLog AS EL
  INNER JOIN FrontendEventDefinitions AS ED ON EL.EventID = ED.EventID
WHERE
  ED.EventType = 'Customer Support'
GROUP BY
  EL.UserID;
