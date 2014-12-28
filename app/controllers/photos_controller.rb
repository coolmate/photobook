class PhotosController < ApplicationController
  def index
    render json: Photo.all
  end

  def show
    render json: Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params['id'])
    return head :bad_request unless photo
    return head :unauthorized unless current_user == photo.page.album.user

    photo.url = params['photo']['url']
    photo.shape = params['photo']['shape']
    photo.save!
    render json: photo
  end
end
