{{
  config(
    materialized = "incremental",
    partition_by={
      "field": "date",
      "data_type": "DATE",
      "granularity": "day"
    }
  )
}}
with orders as  (
    select 
        date,
        "IOS" as platform,
        price,
        sku,
        1 as orders,
        currency
    from {{ ref('stg_airbyte_app_store__sales_report') }}
), 
exchange_rate as  (
    select * from {{ ref('stg_airbyte_google_sheets__Exchange_Rate') }}
)

select
    orders.* EXCEPT(currency),
    exchange_rate.exchange_rate
from orders
left join exchange_rate using (currency)
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses > to include records whose timestamp occurred since the last run of this model)
  where date > (select max(date) from {{ this }})

{% endif %}