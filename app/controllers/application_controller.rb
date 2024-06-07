class ApplicationController < ActionController::API
  before_action :authenticate_request

  def authenticate_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header
    begin
      decoded = JWT.decode(token, ENV['JWT_SECRET'], true, { algorithm: 'HS256' })
      @current_user = User.find(decoded[0]['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Please login first to proceed' }, status: :unauthorized
    end
  end
end
