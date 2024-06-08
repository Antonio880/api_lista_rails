module Authenticable
    extend ActiveSupport::Concern
    include JwtHelper
  
    included do
      before_action :authenticate_request
    end
  
    private
  
    def authenticate_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = jwt_decode(header)
        @current_user = Usuario.find(@decoded[:user_id])
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
  end
  