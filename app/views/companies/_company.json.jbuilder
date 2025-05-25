json.extract! company, :id, :name, :capacity_yellow, :capacity_red, :notification_period_yellow, :notification_period_red, :notification_period_zen, :notification_period_temperature, :shelf_offline_timeout, :created_at, :updated_at
json.url company_url(company, format: :json)
