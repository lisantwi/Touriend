class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable

  validates :fullname, presence: true, length: {maximum: 50}

  has_many :services
  has_many :reservations

  has_many :traveler_reviews, class_name: "TravelerReview", foreign_key: "traveler_id"
  has_many :guide_reviews, class_name: "GuideReview", foreign_key: "guide_id"

end
