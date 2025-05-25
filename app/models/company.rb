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
end
