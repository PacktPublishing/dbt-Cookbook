{% snapshot customers_snapshot_check %}

{{ 
  config( 
    target_schema='snapshots', 
    strategy='check', 
    unique_key='customer_id', 
    check_cols=['customer_first_name', 'customer_last_name'], 
  ) 
}} 

SELECT *
  FROM {{ source('retail_sales', 'customers') }}

{% endsnapshot %}
