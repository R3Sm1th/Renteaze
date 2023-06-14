class AddPropertyApplicationToBankReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :bank_references, :property_application, null: false, foreign_key: true
  end
end
