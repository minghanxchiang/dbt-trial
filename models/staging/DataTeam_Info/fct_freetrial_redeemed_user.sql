{{
  config(
    materialized = "ephemeral"
  )
}}
SELECT 
    UserId, max(DateCreate)
FROM 
     {{ ref('stg_DateTeam_Info_ReceiptMerged') }}
WHERE 
    SubscriptionType = "First"
    AND ProductPrice = 0
    AND (ProductId = "com.kalavision.alfred.premium_New1m_4.99" OR ProductId = "premium_1m_hw_free_trial:1m-hw-free-trial")
    AND (CancelReason <> "Refund" or CancelReason is null)
GROUP BY 
    UserId