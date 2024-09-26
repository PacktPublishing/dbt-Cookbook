{% snapshot orders_snapshot_timestamp %}

{{ 
  config( 
    target_schema='snapshots', 
    strategy='timestamp', 
    unique_key='order_number', 
    updated_at='_etl_loaded_at', 
  ) 
}} 

SELECT *  
  FROM {{ source('retail_sales', 'orders') }} 

{% endsnapshot %}
