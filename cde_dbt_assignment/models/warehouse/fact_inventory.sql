{{ config(
    partition_by={
        "field": "date",
        "data_type": "date"
    }
) }}
WITH source AS (
    select
    inventory_id,
    item_id,
    branch_id,
    stock_level,
    reorder_level,
    date,
    current_timestamp() as insertion_timestamp,
    from {{ ref('stg_inventory')}}
),

unique_source AS (
    SELECT *,
            row_number() OVER(PARTITION BY inventory_id) AS row_number
    FROM source
)

SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1