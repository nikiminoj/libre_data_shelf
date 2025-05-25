# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint
#
# Indexes
#
#  index_countries_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require "test_helper"

class CountryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
