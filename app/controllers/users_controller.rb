class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.new(user_params)
    if user.save
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials[:jwt_token_secret], 'HS256')
      render json: { user:, token: }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def show
    render json: { user: @current_user }
  end

  private

  def user_params
    params.permit(:email, :password, :name)
  end
end
