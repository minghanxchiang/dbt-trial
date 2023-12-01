{{
  config(
    materialized = "ephemeral"
  )
}}
with 

source as (

    select * from {{ source('airbyte_google_sheets', 'Exchange_Rate') }}

),

renamed as (

    select
        update_time,
        safe_cast(exchange_rate as float64) as exchange_rate,
        currency

    from source

)

select * from renamed
