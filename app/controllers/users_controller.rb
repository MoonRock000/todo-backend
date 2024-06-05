class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.create(user_params)
    if user.valid?
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials[:jwt_token_secret], 'HS256')
      render json: { user:, token: }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def show
    user = User.find(@current_user_id)
    render json: { user: }
  end

  private

  def user_params
    params.permit(:email, :password, :name)
  end
end
