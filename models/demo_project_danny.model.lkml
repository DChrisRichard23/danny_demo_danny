connection: "the_tile_shop_poc"

# include all the views
include: "/views/**/*.view"

datagroup: demo_project_danny_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: demo_project_danny_default_datagroup

explore: fact_orders {
  join: dim_customer {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fact_orders.customer_id} = ${dim_customer.customer_id} ;;
  }
}
