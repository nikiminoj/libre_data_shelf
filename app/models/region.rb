# == Schema Information
#
# Table name: regions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  country_id :bigint
#
# Indexes
#
#  index_regions_on_company_id  (company_id)
#  index_regions_on_country_id  (country_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (country_id => countries.id)
#
class Region < ApplicationRecord
  belongs_to :company
  belongs_to :country

  has_many :cities
end
