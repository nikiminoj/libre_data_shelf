# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  message         :text
#  notifiable_type :string
#  read_at         :datetime
#  status          :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  notifiable_id   :bigint
#
# Indexes
#
#  index_notifications_on_created_at                         (created_at)
#  index_notifications_on_deleted_at                         (deleted_at)
#  index_notifications_on_notifiable_id_and_notifiable_type  (notifiable_id,notifiable_type)
#  index_notifications_on_read_at                            (read_at)
#  index_notifications_on_updated_at                         (updated_at)
#
class Notification < ApplicationRecord
  belongs_to :notifiable, polymorphic: true
end
