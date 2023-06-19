class Property < ApplicationRecord
  belongs_to :user
  has_many :property_applications, dependent: :destroy
  has_one_attached :photo

  def address
    "#{number}, #{street}, #{town}, #{postcode}"
  end
  # GEOCODE SECTION ============================================================
  # tells gem that column that needs to be geocoded is the address, NOTHING else will be geocoded
  geocoded_by :address
  # tells gem to save the changes if it is applied to the following column
  after_validation :geocode, if: :will_save_change_to_address?
end
