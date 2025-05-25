# == Schema Information
#
# Table name: shelf_stats
#
#  id                    :bigint           not null, primary key
#  product_count         :integer
#  product_count_real    :integer
#  temperature_violation :boolean
#  timedelta             :integer
#  weight                :decimal(8, 2)
#  weight_decrement      :integer
#  weight_increment      :integer
#  weight_percent        :decimal(6, 2)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  shelf_id              :bigint           not null
#
# Indexes
#
#  index_shelf_stats_on_shelf_id  (shelf_id)
#
# Foreign Keys
#
#  fk_rails_...  (shelf_id => shelves.id)
#
require "test_helper"

class ShelfStatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
