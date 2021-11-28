SELECT
LEFT(date,6) as month,
SAFE_DIVIDE(SUM(totals.totalTransactionRevenue),
COUNT(distinct visitId)) AS avg_revenue_per_user
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _table_suffix BETWEEN '20170701' AND '20170731'
    AND totals.transactions is not null
GROUP BY month
