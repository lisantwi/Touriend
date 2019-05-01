class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @services = @user.services

    # Display all the traveler reviews to guide (if this user is a guide)
    @traveler_reviews = Review.where(type: "TravelerReview", guide_id: @user.id)

    # Display all the guide reviews to guide (if this user is a traveler)
    @guide_reviews = Review.where(type: "GuideReview", traveler_id: @user.id)
  end
end
