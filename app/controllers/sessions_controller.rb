class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: :create

  def create
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      token = JWT.encode({ user_id: user.id }, ENV["JWT_SECRET"])
      render json: { token:, user: }
    else
      render json: { error: 'Invalid credentials' }, status: 400
    end
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end
end
