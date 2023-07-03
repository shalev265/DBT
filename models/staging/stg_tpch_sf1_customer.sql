    {{
      config(
        tag = 'shalev'
        )
    }}

    with source as (

    select *
    from {{ source('TPCH_SF1','CUSTOMER') }}

    )

select  C_CUSTKEY,
        C_NAME,
        C_ADDRESS,
        C_NATIONKEY,
        C_PHONE,
        C_ACCTBAL,
        C_MKTSEGMENT,
        C_COMMENT
        
from source