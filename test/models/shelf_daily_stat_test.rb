# == Schema Information
#
# Table name: shelf_daily_stats
#
#  id                               :bigint           not null, primary key
#  date                             :date
#  max_temperature                  :decimal(6, 2)
#  min_temperature                  :decimal(6, 2)
#  product_count_decrement          :integer
#  product_count_violation_count    :integer          default(0)
#  product_count_violation_duration :integer
#  temperature_violation_count      :integer          default(0)
#  temperature_violation_duration   :integer
#  weight                           :decimal(8, 2)
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  shelf_id                         :bigint           not null
#
# Indexes
#
#  index_shelf_daily_stats_on_shelf_id  (shelf_id)
#
# Foreign Keys
#
#  fk_rails_...  (shelf_id => shelves.id)
#
require "test_helper"

class ShelfDailyStatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
