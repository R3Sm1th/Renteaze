class BankReference < ApplicationRecord
  belongs_to :property_application
  has_one_attached :pdf
  validates :name, presence: true
  validates :issue_date, presence: true
  validates :pdf, presence: true
end
