with source as (

    select * from {{ source('fufu_republic', 'order_items')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from source
