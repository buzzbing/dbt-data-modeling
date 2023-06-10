{{
  config(
    materialized = 'view',
    )
}}

with src as 
(
    select 
        product_id,
        review_id,
        review_title,
        review_content
        
    from
    {{ref('amazon')}}
)

select *
from src