WITH HW_user AS  (
    SELECT     
        DISTINCT UserId
    FROM {{ ref('stg_DataTeam_Index_hardware_camera_active_user_list') }}
),
fru AS (
    SELECT
        *
    FROM
         {{ ref('fct_freetrial_redeemed_user') }}
)
SELECT
    HW_user.UserId
FROM
    HW_user
LEFT JOIN 
    fru
on HW_user.UserId = fru.UserId
WHERE fru.UserId IS NULL