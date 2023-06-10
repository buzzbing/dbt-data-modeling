with src_user as 
(
    select 
    
        user_id,
        user_name
       
    from
    {{ref('src_user')}}
)

select 

*
from src_user