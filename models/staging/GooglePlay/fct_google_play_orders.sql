{{
  config(
    materialized = "ephemeral"
  )
}}
with orders as  (
    select 
        date,
        "ANDROID" as platform,
        price,
        sku,
        1 as orders,
        pt,
        currency
    from {{ ref('stg_GooglePlay_p_Sales_ts') }}
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
  where pt > (select max(pt) from {{ this }})

{% endif %}