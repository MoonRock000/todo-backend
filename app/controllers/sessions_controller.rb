class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      jwt = JWT.encode({ user_id: user.id }, Rails.application.credentials[:jwt_token_secret])
      render json: { jwt: jwt }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end