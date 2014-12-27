class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    log_in user
    render json: { user: user }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
