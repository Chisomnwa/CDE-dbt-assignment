WITH source AS (
    select
    customer_id,
    name,
    phone_number,
    email,
    current_timestamp() as insertion_timestamp,
    from {{ ref('stg_customer')}}
),

unique_source AS (
    SELECT *,
            row_number() OVER(PARTITION BY customer_id) AS row_number
    FROM source
)

SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1