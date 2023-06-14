class AddPropertyApplicationToEmploymentDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :employment_documents, :property_application, null: false, foreign_key: true
  end
end
