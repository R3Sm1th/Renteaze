class Property < ApplicationRecord
  belongs_to :user
  has_many :property_applications, dependent: :destroy
  has_one_attached :photo

  def address
    "#{number} #{street}, #{town} #{postcode}"
  end
end
