class ReservationsController < ApplicationController

  before_action :authenticate_user!

  def create
    service = Service.find(params[:service_id])

    if current_user == service.user
      flash[:alert] = "You cannot book yourself as a tour guide"
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.service = service
      @reservation.price = service.price
      @reservation.total = service.price * days
      @reservation.save

      flash[:notice] = "Your Booking Request Has Been Submitted. You will receive a response within 24 hrs."

    end


    redirect_to service


  end

  def your_bookings
    @bookings = current_user.reservations.order(start_date: :asc)
  end

  def your_reservations
    @services = current_user.services
  end




  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date)
    end

end
