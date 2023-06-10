{{
  config(
    materialized = 'view',
    )
}}

with src as 
(
    select 
        product_id,
        product_name,
        about_product,
        product_link,
        img_link
    from
    {{ref('amazon')}}
)

select *
from src