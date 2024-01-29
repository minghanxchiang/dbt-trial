{{
  config(
    materialized = "view",
    partition_by={
      "field": "date",
      "data_type": "DATE",
      "granularity": "day"
      }
  )
}}
with google_play as  (
    select     
        date,
        platform,
        sku,
        sum(safe_multiply(safe_multiply(exchange_rate, price), orders)) as revenue 
    from {{ ref('fct_google_play_orders') }}
    group by 1,2,3
),
app_store as (
    select     
        date,
        platform,
        sku,
        sum(safe_multiply(safe_multiply(exchange_rate, price), orders)) as revenue 
    from {{ ref('fct_app_store_orders') }}
    group by 1,2,3
)

select * from google_play
union all
select * from app_store