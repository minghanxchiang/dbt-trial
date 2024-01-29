{{
  config(
    materialized = "ephemeral"
  )
}}
select
    Id,
    ObjectId,
    OrderId,
    TransactionId,
    UserId,
    Country,
    Platform,
    SpecificVersion,
    Version,
    SubscriptionType,
    ProductType,
    ProductId,
    ProductPlan,
    ProductPrice,
    CancelReason,
    CancelReasonUserInput,
    CancelReasonOnHold,
    TokenPurchase,
    GracePeriod,
    MissingiTunesInfo,
    SurveyResult,
    TimeStart,
    TimeExpiry,
    TimeCancel,
    TimeCancelRestart,
    TimeOnholdStart,
    TimeOnholdExpiry,
    TimeOnholdCancel,
    TimeCreate,
    TimeUpdate,
    DateCreate
from {{ source('DataTeam_Info', 'ReceiptMerged') }}
where DateCreate >= "2023-01-01"