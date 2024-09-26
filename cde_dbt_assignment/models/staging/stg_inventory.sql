with source as (

    select * from {{ source('fufu_republic', 'inventory')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from source
