class AuthenticationController < ApplicationController
  include JwtHelper
  
  # Skip the authentication requirement for the login action
  skip_before_action :authenticate_request, only: [:login]

  def login
    user = Usuario.find_by(email: login_params[:email])

    if user&.authenticate(login_params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { token: token, user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.require(:auth).permit(:email, :password)
  end
end
