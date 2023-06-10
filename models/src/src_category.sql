{{
  config(
    materialized = 'view',
    )
}}

with src as 
(
    select 
      product_id,
       category
        
    from
    {{ref('amazon')}}
)

select 
product_id,
{{dbt_utils.generate_surrogate_key(
    ['product_id','category']
)}} as category_id,
split(category,'|')[0]::text as CategoryName,
split(category,'|')[1]::text as SubCategory,
split(category,'|')[2]::text as ItemCategory,
split(category,'|')[3]::text as ItemSubCategory,
split(category,'|')[4]::text as Item
from src