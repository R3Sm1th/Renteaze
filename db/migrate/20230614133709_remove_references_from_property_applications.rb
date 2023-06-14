class RemoveReferencesFromPropertyApplications < ActiveRecord::Migration[7.0]
  def change
    remove_reference :property_applications, :identification, null: false, foreign_key: true
    remove_reference :property_applications, :bank_reference, null: false, foreign_key: true
    remove_reference :property_applications, :employment_document, null: false, foreign_key: true
  end
end
