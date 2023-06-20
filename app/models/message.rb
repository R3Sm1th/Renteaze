class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
  # find out whether a current user is the message's sender
  def sender?(a_user)
    user.id == a_user.id
  end
end
