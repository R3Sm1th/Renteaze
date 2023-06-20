class AddPropertyApplicationReferenceToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :property_application, foreign_key: true
  end
end
