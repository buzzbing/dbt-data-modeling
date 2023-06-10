{{
  config(
    materialized = 'view',
    )
}}

with src as 
(
    select 
        review_id,
        user_id,
        user_name
       
    from
    {{ref('amazon')}}
)

select *
from src