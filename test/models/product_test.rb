# == Schema Information
#
# Table name: products
#
#  id                      :bigint           not null, primary key
#  capacity_red            :integer
#  capacity_yellow         :integer
#  max_storage_temperature :integer
#  min_storage_temperature :integer
#  name                    :string
#  unit_weight             :integer
#  vendor_code             :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  company_id              :bigint
#  product_group_id        :bigint
#
# Indexes
#
#  index_products_on_company_id        (company_id)
#  index_products_on_product_group_id  (product_group_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
