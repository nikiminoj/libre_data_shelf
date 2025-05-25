json.extract! product_group, :id, :company_id, :name, :comment, :created_at, :updated_at
json.url product_group_url(product_group, format: :json)
