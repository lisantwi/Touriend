class GuideReview < Review
  belongs_to :guide, class_name: "User"
end
