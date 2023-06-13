class PropertyApplication < ApplicationRecord
  belongs_to :property
  belongs_to :user
  belongs_to :identification, optional: true
  belongs_to :bank_reference, optional: true
  belongs_to :employment_document, optional: true
end
