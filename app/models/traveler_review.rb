class TravelerReview < Review
  belongs_to :traveler, class_name: "User"

end
