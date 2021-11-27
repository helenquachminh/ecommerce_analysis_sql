#calculate total visit, pageview, transaction and revenue for Jan, Feb and March 2017 order by month

select
    month,
    sum(totals.visits) as total_visits,
    sum(totals.pageviews) as total_pageviews,
    sum(totals.transactions) as total_transactions,
    sum(totals.transactionRevenue) as total_transaction_revenue
from
    (
    select *, left(date, 6) as month
    from `bigquery-public-data.google_analytics_sample.ga_sessions_*`
    where date >= '20170101' and date < '20170401'
    ) as tbl
group by month
order by month
