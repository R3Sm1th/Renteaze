class EmploymentDocument < ApplicationRecord
  belongs_to :property_application
  validates :company_name, presence: true
  validates :date, presence: true
  validates :pdf, presence: true
  has_one_attached :pdf
end
