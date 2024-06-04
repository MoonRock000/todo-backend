class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.create(user_params)
    if user.valid?
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials[:jwt_token_secret], 'HS256')
      render json: { user: user, token: token }
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :name)
  end
end
