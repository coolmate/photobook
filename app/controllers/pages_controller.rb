LAYOUTS = {
  1 => {
    num_photos: 2,
    num_quotes: 2
  },
  2 => {
    num_photos: 1,
    num_quotes: 0
  }
}

class PagesController < ApplicationController
  def index
    render json: Page.all
  end

  def show
    render json: { page: Page.find(params[:id]) }
  end

  def create
    page = Page.create(
      album_id: params[:page][:album],
      layout: params[:page][:layout]
    )
    (1..LAYOUTS[page.layout][:num_photos]).each do
      Photo.create(page: page)
    end
    (1..LAYOUTS[page.layout][:num_quotes]).each do
      Quote.create(page: page)
    end
    render json: { page: page }
  end

  def destroy
    Page.find(params[:id]).destroy
    render json: {} # Ember blows up unless we return something.
  end
end
