with src_product as 
(
    select 
        distinct *
    from
    {{ref('src_product')}}
)

select *
from src_product