# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  message         :text
#  notifiable_type :string
#  status          :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint
#
require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
