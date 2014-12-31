class LayoutsController < ApplicationController
  LAYOUTS = [{
    id: 1,
    num_photos: 2,
    num_quotes: 2
  }, {
    id: 2,
    num_photos: 1,
    num_quotes: 0
  }, {
    id: 3,
    num_photos: 4,
    num_quotes: 0
  }, {
    id: 4,
    num_photos: 4,
    num_quotes: 1
  }]

  def index
    render json: LAYOUTS
  end
end
