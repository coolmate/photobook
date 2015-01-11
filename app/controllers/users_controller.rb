class UsersController < ApplicationController
  def create
    user = User.create!(user_params)
    log_in user
    render json: user
  end

  def current
    render json: current_user || {}
  end

  def update
    user = User.find(params[:id])
    return head :bad_request unless user
    return head :unauthorized unless current_user.id == user.id

    user.update!(update_params)
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def update_params
    params.require(:user).permit(:id, :name, :email, :password)
  end
end
