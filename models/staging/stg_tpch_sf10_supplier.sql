{{
  config(
    tag = 'shalev'
    )
}}

with source as (

select *
from {{source('TPCH_SF10','SUPPLIER')}}


)

select  S_SUPPKEY,
        S_NAME,
        S_ADDRESS,
        S_NATIONKEY,
        S_PHONE,
        S_ACCTBAL,
        S_COMMENT
from source