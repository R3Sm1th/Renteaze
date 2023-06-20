class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :property_application, optional: true
end
