class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :property_application, optional: true
end
