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

    quote.update_attributes!(update_params)
    render json: quote
  end

  private

  def update_params
    params.require(:quote).permit(:content, :justify, :size)
  end
end
