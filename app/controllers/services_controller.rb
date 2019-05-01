class ServicesController < ApplicationController
  before_action :set_service, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:listing, :pricing, :description, :photo_upload, :expertise_area, :location, :update]

  def index
    @service = current_user.services
    @services = @service.all
  end

  def new
    @service = current_user.services.build
  end

  def create
    @service = current_user.services.build(service_params)
    if @service.save
      redirect_to listing_service_path(@service), notice: "Saved..."
    else
      flash[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show
    @photos= @service.photos
    @traveler_reviews = @service.traveler_reviews
  end

  def listing
    set_service
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @service.photos

  end

  def expertise_area
  end

  def location
  end

  def update

    new_params= service_params
    new_params = service_params.merge(active: true) if is_ready_service

    if @service.update(new_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = "Something went wrong..."
    end
    redirect_back(fallback_location: request.referer)
  end

  # -------RESERVATIONS ------------

  def preload
    today = Date.today
    reservations = @service.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date, @service)
    }

    render json: output
  end




  private

    def is_conflict(start_date, end_date, service)
      check = service.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
      check.size > 0? true : false
    end

    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:gender,:city, :language, :price, :guide_name, :summary, :has_outdoors,:has_shopping,:has_museum,:has_monuments, :has_food,:has_night, :time_spent,:active)
    end

    def  is_authorised
      redirect_to root_path, alert: "You don't have permission" unless current_user.id == @service.user_id
    end

    def is_ready_service
      !@service.active && !@service.price.blank? && !@service.guide_name.blank? && !@service.photos.blank? && !@service.city.blank?
    end


end
