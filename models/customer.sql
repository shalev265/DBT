{{
  config(
    materialized = 'table',
    tag = 'exercise'
    )
}}
with sf1_customer as (

select *
from {{ ref('stg_tpch_sf1_customer') }}
)

, sf1_nation as (

select *
from {{ ref('stg_tpch_sf1_nation') }}

)

, final as (
    select sf1_customer.c_nationkey,
             sf1_customer.c_custkey,
             sf1_nation.n_regionkey 
    from sf1_customer 
    inner join sf1_nation
        on sf1_customer.c_nationkey = sf1_nation.n_nationkey
    group by sf1_customer.c_nationkey,
             sf1_customer.c_custkey,
             sf1_nation.n_regionkey
    limit 1000
)

select *
from final