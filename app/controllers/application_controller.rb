class ApplicationController < ActionController::API
  before_action :authenticate_request

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JWT.decode(token, Rails.application.secrets[], true, algorithm: 'HS256')
      @current_user_id = decoded[0]['user_id']
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
