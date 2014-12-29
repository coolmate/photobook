class AlbumsController < ApplicationController
  def index
    if current_user
      render json: Album.where(user: current_user)
    else
      render json: []
    end
  end

  def create
    return head :unauthorized unless logged_in?
    render json: Album.create(name: params[:album][:name], user: current_user)
  end

  def show
    render json: Album.find(params[:id])
  end

  def destroy
    album = Album.find(params[:id])
    return head :bad_request unless album
    return head :unauthorized unless current_user == album.user

    album.destroy
    render json: {} # Ember blows up unless we return something.
  end
end
