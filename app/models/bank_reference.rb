class BankReference < ApplicationRecord
  belongs_to :property_application
  has_one_attached :pdf
end
