with source as (
  select *
  from {{ source('raw', 'ship') }}
),

renamed as (
  select
    orders_id,                                    -- ← use orders_id here
    shipping_fee,                                 -- keep one column
    cast(ship_cost as FLOAT64) as ship_cost,      -- cast to FLOAT64
    cast(logCost as FLOAT64) as log_cost         -- cast to FLOAT64
  from source
)

select * from renamed
