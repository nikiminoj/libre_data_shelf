# == Schema Information
#
# Table name: model_logs
#
#  id          :bigint           not null, primary key
#  action      :string
#  entity_name :string
#  entity_type :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_model_logs_on_action       (action)
#  index_model_logs_on_company_id   (company_id)
#  index_model_logs_on_entity_name  (entity_name)
#  index_model_logs_on_entity_type  (entity_type)
#  index_model_logs_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ModelLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
