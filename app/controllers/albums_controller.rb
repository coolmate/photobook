class AlbumsController < ApplicationController
  def index
    render json: Album.all
  end

  def show
    render json: Album.find(params[:id])
  end
end
