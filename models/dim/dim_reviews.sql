

with src_reviews as 
(
    select 
        distinct
        review_id,
        review_title,
        review_content
        
    from
    {{ref('src_reviews')}}
)

select 

*
from src_reviews