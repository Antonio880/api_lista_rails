module AuthenticationHelper
    def authenticate_user(user)
      token = JwtHelper.encode(user_id: user.id)
      request.headers['Authorization'] = "Bearer #{token}"
    end
  end