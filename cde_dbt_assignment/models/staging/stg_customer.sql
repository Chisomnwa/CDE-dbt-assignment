with source as (

    select * from {{ source('fufu_republic', 'customer')}}
)
select
    *,
    current_timestamp() as insertion_timestamp
from source
