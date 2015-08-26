class Trip < ActiveRecord::Base
  validates :trip_cost, :name, :destination_id,
            :activity_id, presence: true
  validates :name, uniqueness: true
  validates :name, length: { maximum: 25 }
  belongs_to :destination
  belongs_to :activity
  belongs_to :user
  belongs_to :reservations



  if Rails.env.production?
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  else
    has_attached_file :image
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  end
end
