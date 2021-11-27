# Bounce rate per traffic source in July 2017
select
    left(date, 6) as month
    sum(totals.visits) as total_visits,
    sum(totals.pageviews) as total_pageviews,
    sum(totals.transactions) as total_transactions,
    sum(totals.transactionRevenue) as total_transaction_revenue
from `bigquery-public-data.google_analytics_sample.ga_sessions_*`
where date >= '20170101' and date < '20170401'
group by month
order by month
