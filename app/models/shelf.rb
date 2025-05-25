# == Schema Information
#
# Table name: shelves
#
#  id                :bigint           not null, primary key
#  comment           :string
#  grap_shelf_stat   :integer
#  last_shelf_stat   :integer
#  mac_address       :string
#  mac_weight        :integer
#  refill_shelf_stat :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :bigint           not null
#  product_id        :bigint
#
# Indexes
#
#  index_shelves_on_company_id  (company_id)
#  index_shelves_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (product_id => products.id)
#
class Shelf < ApplicationRecord
end
