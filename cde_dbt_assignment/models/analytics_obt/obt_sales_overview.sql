WITH source AS (
    SELECT
    c.customer_id,
    c.name as customer_name,
    c.phone_number,
    c.email,
    b.branch_id,
    b.branch_name,
    b.city,
    b.manager,
    i.item_id,
    i.name,
    i.category,
    i.price,
    pa.payment_method_id,
    pa.name as payment_method_name,
    pa.provider,
    pr.promotion_id,
    pr.name as promotion_name,
    pr.discount_amount as promotion_discount,
    pr.validity_period,
    fs.order_id,
    fs.order_item_id,
    fs.inventory_id,
    fs.discount_amount as sales_discount,
    fs.dining_option,
    current_timestamp() as insertion_timestamp,
FROM {{ ref('fact_sales')}} fs
LEFT JOIN {{ ref('dim_customer')}} c
on fs.customer_id = c.customer_id
LEFT JOIN {{ ref('dim_branch')}} b
on fs.branch_id = b.branch_id
LEFT JOIN {{ ref('dim_item')}} i
on fs.item_id = i.item_id
LEFT JOIN {{ ref('dim_payment_method')}} pa
on fs.payment_method_id = pa.payment_method_id
LEFT JOIN {{ ref('dim_promotions')}} pr
on fs.promotion_id = pr.promotion_id
)

SELECT * FROM source
