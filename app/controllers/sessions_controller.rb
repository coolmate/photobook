class SessionsController < ApplicationController
  def new
    render json: { logged_in: logged_in? }
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      head :ok
    else
      head :unauthorized
    end
  end

  def destroy
    log_out if logged_in?
    head :ok
  end
end
