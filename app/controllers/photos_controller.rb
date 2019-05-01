class PhotosController < ApplicationController

  def create
    @service = Service.find(params[:service_id])

    if params[:images]
      params[:images].each do |img|
        @service.photos.create(image: img)
      end

      @photos = @service.photos
      redirect_back(fallback_location: request.referer, notice: "Saved...")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @service = @photo.service

    @photo.destroy
    @photos = Photo.where(service_id: @service.id)

    respond_to :js
  end
end
