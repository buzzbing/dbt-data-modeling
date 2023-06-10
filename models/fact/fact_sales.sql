
{{
    config(
        materialized = 'incremental',
        on_schema_changes = 'fail'
    )
}}

with
    cat_cte as (
        select *
        from
        {{ref("src_category")}}
        ),
    prod_cte as (
        select *
        from {{ref("dim_product")}}
    ),
    src as (
        select 
        product_id,
        user_id,
        review_id,
        actual_price,
        discount_percentage,
        discounted_price
        from 
        {{ref("amazon")}}
    ),
    rate_cte as(
        select *
        from {{ref("src_ratings")}}),
 
    T1 as 
        (
            select category_id, prod_cte.product_id
            from
            cat_cte
            inner join prod_cte
            on cat_cte.product_id = prod_cte.product_id) 
    
    select
        distinct
        {{dbt_utils.generate_surrogate_key(
        ['src.product_id','user_id','review_id']
        )}} as FactId,
        category_id,
        src.product_id,
        user_id,
        review_id,
        actual_price,
        discount_percentage,
        discounted_price
    from
    (   
        (
        select T1.category_id,
        T1.product_id,    
        rating_id from
        T1
        inner join 
        rate_cte 
        on T1.product_id = rate_cte.product_id)
         T2
    inner join
    src
    on src.product_id = T2.product_id)







