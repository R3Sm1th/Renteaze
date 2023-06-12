class CreateEmploymentDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_documents do |t|
      t.string :company_name
      t.datetime :date
      t.string :status

      t.timestamps
    end
  end
end
