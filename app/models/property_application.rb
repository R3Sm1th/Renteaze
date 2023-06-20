class PropertyApplication < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :identifications, dependent: :destroy
  has_many :bank_references, dependent: :destroy
  has_many :employment_documents, dependent: :destroy
  has_one :chatroom, dependent: :destroy
end
