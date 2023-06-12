class CreatePropertyApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :property_applications do |t|
      t.string :status
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :identification, null: false, foreign_key: true
      t.references :bank_references, null: false, foreign_key: true
      t.references :employment_documents, null: false, foreign_key: true

      t.timestamps
    end
  end
end
