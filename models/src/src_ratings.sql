{{
  config(
    materialized = 'view',
    )
}}

with src as 
(
    select 
    {{dbt_utils.generate_surrogate_key([
        'rating','rating_count'
    ])}} as rating_id,
        product_id,
        rating,
        rating_count
        
    from
    {{ref('amazon')}}
)

select *
from src