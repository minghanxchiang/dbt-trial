{{
  config(
    materialized = "ephemeral"
  )
}}
select
    user_id as UserId,
    events,
    approx_devices,
    approx_days,
    time_first_active,
    time_last_active
from {{ source('DataTeam_Index', 'hardware_camera_active_user_list') }}