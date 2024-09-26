with source as (

    select * from {{ source('fufu_republic', 'payment_method')}}
)
select
    *,
    current_timestamp() as ingestion_timestamp
from source
