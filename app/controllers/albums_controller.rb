class AlbumsController < ApplicationController
  def index
    render json: Album.all
  end

  def show
    render json: { album: Album.find(params[:id]) }
  end
end
