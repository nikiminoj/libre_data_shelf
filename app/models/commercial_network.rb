# == Schema Information
#
# Table name: commercial_networks
#
#  id             :bigint           not null, primary key
#  comment        :string
#  contact_name   :string
#  contact_number :string
#  name           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  company_id     :bigint           not null
#
# Indexes
#
#  index_commercial_networks_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class CommercialNetwork < ApplicationRecord
  belongs_to :company
end
