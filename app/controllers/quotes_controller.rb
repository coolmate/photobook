class QuotesController < ApplicationController
  def index
    render json: Quote.all
  end

  def show
    render json: { quote: Quote.find(params[:id]) }
  end
end
