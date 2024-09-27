with source as (

    select * from {{ source('fufu_republic', 'item')}}
)
select
    *,
    current_timestamp() as insertion_timestamp
from source
