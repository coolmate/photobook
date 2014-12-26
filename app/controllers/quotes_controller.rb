class QuotesController < ApplicationController
  def index
    render json: Quote.all
  end

  def show
    render json: { quote: Quote.find(params[:id]) }
  end

  def update
    quote = Quote.find(params['id'])
    quote.content = params['quote']['content']
    quote.save!
    render json: quote
  end
end
