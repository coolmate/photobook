class QuotesController < ApplicationController
  def index
    render json: Quote.all
  end

  def show
    render json: Quote.find(params[:id])
  end

  def update
    quote = Quote.find(params['id'])
    return head :bad_request unless quote
    return head :unauthorized unless current_user == quote.page.album.user

    quote.content = params['quote']['content']
    quote.save!
    render json: quote
  end
end
