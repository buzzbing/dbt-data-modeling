with src_category as
(select distinct 
category_id,
categoryName,
subcategory,
itemCategory,
itemSubCategory,
item
 from 
{{ref("src_category")}})

select
* from
src_category