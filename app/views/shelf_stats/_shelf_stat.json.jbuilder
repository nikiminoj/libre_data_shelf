json.extract! shelf_stat, :id, :weight, :weight_percent, :product_count, :product_count_real, :temperature_violation, :timedelta, :weight_increment, :weight_decrement, :shelf_id, :created_at, :updated_at
json.url shelf_stat_url(shelf_stat, format: :json)
