class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :number
      t.string :street
      t.string :town
      t.string :postcode
      t.integer :price_per_month
      t.datetime :availability_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
