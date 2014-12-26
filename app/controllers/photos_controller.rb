class PhotosController < ApplicationController
  def index
    render json: Photo.all
  end

  def show
    render json: { photo: Photo.find(params[:id]) }
  end

  def update
    photo = Photo.find(params['id'])
    photo.url = params['photo']['url']
    photo.shape = params['photo']['shape']
    photo.save!
    render json: photo
  end
end
