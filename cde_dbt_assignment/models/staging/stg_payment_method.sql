with source as (

    select * from {{ source('fufu_republic', 'payment_method')}}
)
select
    *,
    current_timestamp() as insertion_timestamp
from source
