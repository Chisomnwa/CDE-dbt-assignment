WITH source AS (
    select
    item_id,
    name,
    category,
    price,
    current_timestamp() as insertion_timestamp,
    from {{ ref('stg_item')}}
),

unique_source AS (
    SELECT *,
            row_number() OVER(PARTITION BY item_id) AS row_number
    FROM source
)

SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1