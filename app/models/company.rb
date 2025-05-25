# == Schema Information
#
# Table name: companies
#
#  id                              :bigint           not null, primary key
#  capacity_red                    :integer
#  capacity_yellow                 :integer
#  name                            :string
#  notification_period_red         :integer
#  notification_period_temperature :integer
#  notification_period_yellow      :integer
#  notification_period_zen         :integer
#  shelf_offline_timeout           :integer
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#
class Company < ApplicationRecord
  has_many :product_groups
  has_many :shelves
  has_many :products
  has_many :cities
  has_many :regions
  has_many :countries
  has_many :shops
  has_many :commercial_networks
  has_many :model_logs
end
