class PhotosController < ApplicationController
  def index
    render json: Photo.all
  end

  def show
    render json: { photo: Photo.find(params[:id]) }
  end
end
