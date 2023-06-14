class PropertyApplication < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_many :identifications
  has_many :bank_references
  has_many :employment_documents
end
