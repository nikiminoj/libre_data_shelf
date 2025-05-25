# == Schema Information
#
# Table name: product_groups
#
#  id         :bigint           not null, primary key
#  comment    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_product_groups_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class ProductGroup < ApplicationRecord
  belongs_to :company

  has_many :products
end
