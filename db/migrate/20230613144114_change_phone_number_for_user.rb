class ChangePhoneNumberForUser < ActiveRecord::Migration[7.0]
  def change
    change_column(:users, :contact_number, :string)
  end
end
