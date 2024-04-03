WITH
  UserClicks AS (
    SELECT
      UserID,
      COUNT(*) AS Clicks
    FROM
      FrontendEventLog
    WHERE
      EventID = 5
    GROUP BY
      UserID
  )
SELECT
  Clicks AS num_link_clicks,
  COUNT(*) AS num_users
FROM
  UserClicks
GROUP BY
  Clicks
ORDER BY
  Clicks ASC;
