class GuideReviewsController < ApplicationController

  def create
    #Step 1: check if the reservation exists (service_id, traveler_id, guide_id)

    #Step 2: Check if the current guide has already reviewed the current traveler_reviews

    @reservation = Reservation.where(
                    id: guide_review_params[:reservation_id],
                    service_id: guide_review_params[:service_id],
                    user_id: guide_review_params[:traveler_id]
                   ).first

    if !@reservation.nil?

      @has_reviewed = GuideReview.where(
                        reservation_id: @reservation.id,
                        guest_id: guide_review_params[:guest_id]
                      ).first

      if @has_reviewed.nil?
        @guide_review = current_user.traveler_reviews.create(guide_review_params)
        flash[:succes] = "Review has been posted"
      else
        #already reviewed
        flash[:succes] = "You have already reviewed this booking"
      end

    else
      flash[:alert] = "There is no such reservation"
    end



    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @guide_review = Review.find(params[:id])
    @guide_review.destroy
    redirect_back(fallback_location: request.referer, notice: "Removed...!")
  end


  private
    def guide_review_params
      params.require(:guide_review).permit(:comment, :star, :service_id, :reservation_id, :traveler_id)
    end
end
