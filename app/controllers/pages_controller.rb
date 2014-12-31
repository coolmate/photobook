LAYOUTS = {
  1 => {
    num_photos: 2,
    num_quotes: 2
  },
  2 => {
    num_photos: 1,
    num_quotes: 0
  },
  3 => {
    num_photos: 4,
    num_quotes: 0
  }
}

class PagesController < ApplicationController
  def index
    render json: Page.all
  end

  def show
    render json: Page.find(params[:id])
  end

  def create
    album = Album.find(params[:page][:album])
    return head :bad_request unless album
    return head :unauthorized unless current_user == album.user

    page = Page.create(
      album: album,
      layout: params[:page][:layout]
    )
    (1..LayoutsController::LAYOUTS[page.layout-1][:num_photos]).each { Photo.create(page: page) }
    (1..LayoutsController::LAYOUTS[page.layout-1][:num_quotes]).each { Quote.create(page: page) }
    render json: { page: page }
  end

  def destroy
    page = Page.find(params[:id])
    return head :bad_request unless page
    return head :unauthorized unless current_user == page.album.user

    page.destroy
    render json: {} # Ember blows up unless we return something.
  end
end
