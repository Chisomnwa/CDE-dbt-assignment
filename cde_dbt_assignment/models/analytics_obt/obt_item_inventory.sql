WITH source AS (
    SELECT
        it.item_id,
        it.name,
        it.category,
        it.price,
        fi.inventory_id,
        fi.branch_id,
        fi.stock_level,
        fi.reorder_level,
        fi.date,
        current_timestamp() AS insertion_timestamp,
FROM {{ ref('dim_item') }} it
LEFT JOIN {{ ref('fact_inventory') }} fi
ON it.item_id = fi.item_id
)

SELECT *
FROM source