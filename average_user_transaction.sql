SELECT
LEFT(date,6) AS month,
SAFE_DIVIDE(SUM(totals.transactions),
COUNT(DISTINCT fullVisitorId)) AS avg_total_transaction_per_user
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _table_suffix BETWEEN '20170701' AND '20170731'
    AND totals.transactions >= 1
GROUP BY month
