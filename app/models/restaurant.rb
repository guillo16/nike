class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average
    return self.reviews.map { |r| r.rating }.sum / self.reviews.count if self.reviews.count > 0
    0
  end
end
