class CreateBankReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_references do |t|
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
