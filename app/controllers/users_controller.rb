class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.new(user_params)
    if user.save
      token = JWT.encode({ user_id: user.id }, ENV['JWT_SECRET'], 'HS256')
      render json: { user:, token: }
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  def show
    render json: { user: @current_user }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
