class Listing < ActiveRecord::Base
  validates   :cost, :name, :location_id, presence: true
  validates   :name, uniqueness: true
  validates   :name, length: { maximum: 25 }
  belongs_to  :location
  has_many    :reservations
end