class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :message
      t.references :user, null: false, foreign_key: true
      t.references :property_application, foreign_key: true

      t.timestamps
    end
  end
end
