class PropertyApplication < ApplicationRecord
  belongs_to :property
  belongs_to :user
  belongs_to :identification
  belongs_to :bank_references
  belongs_to :employment_documents
end
