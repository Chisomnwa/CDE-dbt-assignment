WITH source AS (
    select
    branch_id,
    branch_name,
    city,
    manager,
    current_timestamp() as insertion_timestamp,
    from {{ ref('stg_branch')}}
),

unique_source AS (
    SELECT *,
            row_number() OVER(PARTITION BY branch_id) AS row_number
    FROM source
)

SELECT *
EXCEPT (row_number)
FROM unique_source
WHERE row_number = 1