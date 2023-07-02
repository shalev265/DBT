    {{
      config(
        materialized = 'table',
        tag = 'exercise'
        )
    }}
    
    with customer as (
    
    select *
    from {{ ref('stg_tpch_sf1_customer') }}
    
    )
    
    , supplier as(
    
    select *
    from {{ ref('stg_tpch_sf1_supplier') }}
    
    )
    
    , region as (
    
    select *
    from {{ ref('region') }}
    
    )
    
    , final as (
    
    
    select 
        customer.C_NATIONKEY,
        customer.c_custkey,
        supplier.s_suppkey,
        supplier.s_name,
        supplier.s_address,
        supplier.s_phone,
        supplier.s_acctbal,
        supplier.s_comment,
        region.r_name,
        region.r_regionkey      
    from customer 
    inner join supplier 
        on customer.c_nationkey = supplier.s_nationkey
    inner join region
        on customer.n_regionkey = region.r_regionkey
    
    )

select *
from final