class AddColumnToBankReferences < ActiveRecord::Migration[7.0]
  def change
    add_column :bank_references, :surname, :string
    add_column :bank_references, :issue_date, :date
    add_column :bank_references, :expiration_date, :date
  end
end
