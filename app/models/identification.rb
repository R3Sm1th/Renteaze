class Identification < ApplicationRecord
  belongs_to :property_application
  validates :name, presence: true
  validates :expiration_date, presence: true
  validates :pdf, presence: true
  has_one_attached :pdf, dependent: :destroy
end
