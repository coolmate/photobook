class AlbumsController < ApplicationController
  def index
    if current_user
      render json: Album.where(user: current_user)
    else
      render json: []
    end
  end

  def show
    render json: Album.find(params[:id])
  end
end
