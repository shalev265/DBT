{{
  config(
    tag = 'shalev'
    )
}}

with source as (

select *
from {{ source('TPCH_SF1','NATION') }}

)

    select  N_NATIONKEY,
            N_NAME,
            N_REGIONKEY,
            N_COMMENT
    from source