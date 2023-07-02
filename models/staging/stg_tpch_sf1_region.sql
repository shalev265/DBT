{{
  config(
    tag = 'shalev'
    )
}} 


with source as (

    select *
    from {{ source('TPCH_SF1', 'REGION') }}

)

select  R_REGIONKEY,
        R_NAME,
        R_COMMENT
from source