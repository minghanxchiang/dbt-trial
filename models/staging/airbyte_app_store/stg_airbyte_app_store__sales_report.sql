{{
  config(
    materialized = "ephemeral"
  )
}}
with 

source as (

    select * from {{ source('airbyte_app_store', 'sales_report') }}

),

renamed as (

    select
        _airbyte_raw_id,
        _airbyte_extracted_at,
        _airbyte_meta,
        end_date,
        safe_cast(customer_price as float64) as price,
        product_type_identifier,
        begin_date,
        _api_report_date as date,
        promo_code,
        safe_cast(units as int64) as orders,
        subscription,
        developer_proceeds,
        title,
        currency_of_proceeds,
        provider,
        client,
        sku,
        _line_id,
        order_type,
        parent_identifier,
        apple_identifier,
        period,
        provider_country,
        customer_currency as currency,
        version,
        proceeds_reason,
        country_code,
        preserved_pricing,
        supported_platforms,
        cmb,
        developer,
        _time_extracted,
        category,
        device

    from source
    inner join(
        select
            _api_report_date,
            max(_time_extracted) as _time_extracted
        from `api-project-317780763450.airbyte_app_store.sales_report` as info
        where info.product_type_identifier in ("IAY", "1F")
              and subscription <> ""
        group by 1
    ) as app_store_index using (_api_report_date, _time_extracted)
)

select * from renamed
