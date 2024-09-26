WITH source AS (
    select
    promotion_id,
    name,
    discount_amount,
    validity_period,
    current_timestamp() as insertion_timestamp,
    from {{ ref('stg_promotion')}}
),

unique_source AS (
    SELECT *,
            row_number() OVER(PARTITION BY promotion_id) AS row_number
    FROM source
)

SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1