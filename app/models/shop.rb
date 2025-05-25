# == Schema Information
#
# Table name: shops
#
#  id                 :bigint           not null, primary key
#  address            :string
#  close_at           :time
#  comment            :string
#  commercial_network :integer
#  contact_name       :string
#  contact_number     :string
#  open_at            :time
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  city_id            :bigint
#  company_id         :bigint           not null
#
# Indexes
#
#  index_shops_on_city_id     (city_id)
#  index_shops_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
class Shop < ApplicationRecord
end
