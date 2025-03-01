with 

source as (

    select * from {{ source('airbyte_shopify_global', 'orders') }}

),

renamed as (

    select
        _airbyte_raw_id,
        _airbyte_extracted_at,
        _airbyte_meta,
        cancelled_at,
        confirmation_number,
        deleted_message,
        fulfillment_status,
        original_total_additional_fees_set,
        total_price_usd,
        current_total_discounts_set,
        billing_address,
        line_items,
        total_discounts_set,
        presentment_currency,
        original_total_duties_set,
        source_url,
        location_id,
        landing_site,
        source_identifier,
        reference,
        number,
        checkout_id,
        tax_lines,
        checkout_token,
        current_total_discounts,
        merchant_of_record_app_id,
        customer_locale,
        current_total_additional_fees_set,
        id,
        app_id,
        subtotal_price,
        closed_at,
        order_status_url,
        test,
        device_id,
        current_total_price_set,
        total_shipping_price_set,
        tax_exempt,
        subtotal_price_set,
        payment_gateway_names,
        total_tax,
        discount_allocations,
        deleted_at,
        tags,
        current_subtotal_price_set,
        shipping_lines,
        current_total_tax,
        phone,
        user_id,
        note_attributes,
        name,
        cart_token,
        total_tax_set,
        landing_site_ref,
        discount_codes,
        note,
        estimated_taxes,
        current_total_tax_set,
        current_subtotal_price,
        total_outstanding,
        order_number,
        discount_applications,
        created_at,
        total_line_items_price_set,
        taxes_included,
        payment_terms,
        buyer_accepts_marketing,
        confirmed,
        total_weight,
        refunds,
        contact_email,
        total_discounts,
        fulfillments,
        po_number,
        client_details,
        updated_at as date,
        referring_site,
        shop_url,
        processed_at,
        deleted_description,
        company,
        currency,
        shipping_address,
        email,
        browser_ip,
        source_name,
        total_price_set,
        total_price as price,
        current_total_duties_set,
        total_line_items_price,
        total_tip_received,
        token,
        cancel_reason,
        current_total_price,
        financial_status,
        admin_graphql_api_id,
        customer

    from source
    where updated_at >= "2023-01-01"

)

select * from renamed
