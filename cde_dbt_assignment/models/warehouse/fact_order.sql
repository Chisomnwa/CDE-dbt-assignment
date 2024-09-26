{{ config(
    partition_by={
        "field": "order_date",
        "data_type": "date"
    }
) }}
with source as (
    select
    oh.order_id,
    oh.item_id,
    oi.order_item_id,
    oh.branch_id,
    oh.customer_id,
    oh.payment_method_id,
    oh.promotion_id,
    oh.inventory_id,
    oh.discount_amount,
    oh.dining_option,
    oh.order_time,
    oh.order_date,
    oi.quantity,
    current_timestamp() as insertion_timestamp,
from {{ ref('stg_order_header')}} oh
join {{ ref('stg_order_items')}} oi
on oh.order_id = oi.order_id
where oh.order_id is not null
),
unique_source AS (
    SELECT *,
            row_number() OVER(PARTITION BY order_id, item_id, order_item_id, branch_id, customer_id, payment_method_id, promotion_id, inventory_id, order_date) AS row_number
    FROM source
)
SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1