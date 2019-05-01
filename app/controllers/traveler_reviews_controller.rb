class TravelerReviewsController < ApplicationController

  def create
    #Step 1: check if the reservation exists (service_id, guide_id, guide_id)

    #Step 2: Check if the current guide has already reviewed the current traveler_reviews

    @reservation = Reservation.where(
                    id: traveler_review_params[:reservation_id],
                    service_id: traveler_review_params[:service_id]
                   ).first

                   @reservation = Reservation.where(
                                       id: traveler_review_params[:reservation_id],
                                       service_id: traveler_review_params[:service_id]
                                      ).first

                   if !@reservation.nil? && @reservation.service.user.id == traveler_review_params[:guide_id].to_i

                     @has_reviewed = TravelerReview.where(
                                       reservation_id: @reservation.id,
                                       guide_id: traveler_review_params[:guide_id]
                                     ).first

                     if @has_reviewed.nil?
                         # Allow to review
                         @traveler_review = current_user.traveler_reviews.create(traveler_review_params)
                         flash[:success] = "Review created..."
                     else
                         # Already reviewed
                         flash[:success] = "You already reviewed this Reservation"
                     end
                   else
                     flash[:alert] = "Not found this reservation"
                   end

                   redirect_back(fallback_location: request.referer)
                 end


  def destroy
    @traveler_review = Review.find(params[:id])
    @traveler_review.destroy
    redirect_back(fallback_location: request.referer, notice: "Removed...!")
  end


  private
    def traveler_review_params
      params.require(:traveler_review).permit(:comment, :star, :service_id, :reservation_id, :guide_id)
    end
end
