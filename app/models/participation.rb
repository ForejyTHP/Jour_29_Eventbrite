class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  after_create :welcome_send

  def welcome_send
    UserMailer.inform_admin_for_new_guest(self).deliver_now
  end
end
