with source as (

    select * from {{ source('fufu_republic', 'order_header')}}
)
select
    *,
    current_timestamp() as insertion_timestamp
from source
