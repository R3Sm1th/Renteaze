class AddApplicationToIdenitifcation < ActiveRecord::Migration[7.0]
  def change
    add_reference :identifications, :property_application, null: false, foreign_key: true
  end
end
