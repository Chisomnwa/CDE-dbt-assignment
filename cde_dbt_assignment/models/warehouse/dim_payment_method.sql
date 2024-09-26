WITH source AS (
    select
    payment_method_id,
    name,
    provider,
    current_timestamp() as insertion_timestamp,
    from {{ ref('stg_payment_method')}}
),

unique_source AS (
    SELECT *,
            row_number() OVER(PARTITION BY payment_method_id) AS row_number
    FROM source
)

SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1