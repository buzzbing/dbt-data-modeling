with src_ratings as 
(
    select 
        distinct
        rating_id,
        rating,
        rating_count
        
    from
    {{ref('src_ratings')}}
)

select

*

from
src_ratings
