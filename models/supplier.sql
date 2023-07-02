{{
  config(
    materialized = 'table',
    tag = 'exercise'
) }}

with final as (

    select s_suppkey,
        s_name,
        s_address,
        s_nationkey,
        s_phone,
        s_acctbal,
        s_comment
    from {{ ref('stg_tpch_sf1_supplier') }}

union 

    select s_suppkey,
        s_name,
        s_address,
        s_nationkey,
        s_phone,
        s_acctbal,
        s_comment
    from {{ ref('stg_tpch_sf10_supplier') }}
)

select *
from final
WHERE s_acctbal between -100 AND  100