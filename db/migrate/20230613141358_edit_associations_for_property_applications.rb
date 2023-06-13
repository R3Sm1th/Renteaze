class EditAssociationsForPropertyApplications < ActiveRecord::Migration[7.0]
  def change
    remove_column :property_applications, :identification_id, :integer
    add_reference :property_applications, :identification, index: true, foreign_key: true

    remove_column :property_applications, :employment_documents_id, :integer
    add_reference :property_applications, :employment_document, index: true, foreign_key: true

    remove_column :property_applications, :bank_references_id, :integer
    add_reference :property_applications, :bank_reference, index: true, foreign_key: true
  end
end
