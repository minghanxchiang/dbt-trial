with google_play as  (
    select * from {{ ref('fct_google_play_orders') }}
)

select
    date,
    platform,
    sku,
    sum(safe_multiply(safe_multiply(exchange_rate, price), orders)) as revenue
from
    google_play
group by 
    1,2,3