with orders as  (
    select * from {{ ref('stg_GooglePlay_p_Sales_ts') }}
), 
exchange_rate as  (
    select * from {{ ref('stg_airbyte_google_sheets__Exchange_Rate') }}
)

select
    date,
    "ANDROID" as platform,
    exchange_rate.exchange_rate,
    price,
    sku,
    1 as orders,
    orders.pt as pt
from orders
left join exchange_rate using (currency)
{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses > to include records whose timestamp occurred since the last run of this model)
  where pt > (select max(pt) from {{ this }})

{% endif %}