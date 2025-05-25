# == Schema Information
#
# Table name: cities
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#  region_id  :bigint
#
# Indexes
#
#  index_cities_on_company_id  (company_id)
#  index_cities_on_region_id   (region_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (region_id => regions.id)
#
require "test_helper"

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
