class AlbumsController < ApplicationController
  def index
    render json: Album.where(user_id: params[:user_id])
  end

  def create
    return head :unauthorized unless logged_in?
    render json: Album.create!(name: params[:album][:name], user: current_user)
  end

  def show
    album = Album.find_by_token(params[:id])
    return head :not_found unless album
    render json: album
  end

  def destroy
    album = Album.find_by_token(params[:id])
    return head :bad_request unless album
    return head :unauthorized unless current_user == album.user

    album.destroy
    render json: {} # Ember blows up unless we return something.
  end
end
