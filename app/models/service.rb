class Service < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  has_many :traveler_reviews


geocoded_by :city
after_validation :geocode, if: :city_changed?


  validates :gender, presence:true
  validates :language, presence:true


  def cover_photo(size)
    if self.photos.length > 0
      self.photos[0].image.url(size)
    else
      "blank.jpg"
    end
  end

  def average_rating
    traveler_reviews.count == 0 ? 0 : traveler_reviews.average(:star).round(2).to_i


  end
end
