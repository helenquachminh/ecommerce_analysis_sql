WITH temp_purchaser AS (
SELECT
    LEFT(date,6) AS time,
    SAFE_DIVIDE(SUM(totals.pageviews),
    COUNT(DISTINCT fullVisitorId)) AS avg_pageviews_purchase
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _table_suffix BETWEEN '20170601' AND '20170731'
    AND totals.transactions >= 1
GROUP BY time
),
temp_non_purchaser AS (
SELECT
    LEFT(date,6) AS time,
    SAFE_DIVIDE(SUM(totals.pageviews),
    COUNT(DISTINCT fullVisitorId)) AS avg_pageviews_non_purchase
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _table_suffix BETWEEN '20170601' AND '20170731'
    AND totals.transactions is null
GROUP BY time
)
select temp_purchaser.time, 
avg_pageviews_purchase, 
avg_pageviews_non_purchase from temp_purchaser
join temp_non_purchaser
on temp_purchaser.time = temp_non_purchaser.time
