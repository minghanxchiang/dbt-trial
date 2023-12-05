{{
  config(
    materialized = "ephemeral"
  )
}}
select
    order_number,
    order_charged_date as date,
    order_charged_timestamp,
    financial_status,
    device_model,
    product_title,
    product_id,
    product_type,
    sku_id as sku,
    currency_of_sale as currency,
    item_price,
    taxes_collected,
    charged_amount as price,
    city_of_buyer,
    state_of_buyer,
    postal_code_of_buyer,
    country_of_buyer as country_code,
    base_plan_id as plan_catagory,
    offer_id,
    group_id,
    first_usd_1m_eligible,
    promotion_id,
    coupon_value,
    discount_rate,
    featured_product_id,
    _PARTITIONTIME as pt

from {{ source('GooglePlay', 'p_Sales_ts') }}
where _PARTITIONTIME >= "2023-01-01"