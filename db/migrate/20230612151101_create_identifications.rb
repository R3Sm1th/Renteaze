class CreateIdentifications < ActiveRecord::Migration[7.0]
  def change
    create_table :identifications do |t|
      t.string :name
      t.datetime :issue_date
      t.datetime :expiration_date
      t.string :status

      t.timestamps
    end
  end
end
