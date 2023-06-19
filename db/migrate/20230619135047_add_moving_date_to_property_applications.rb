class AddMovingDateToPropertyApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :property_applications, :move_in_date, :date
  end
end
