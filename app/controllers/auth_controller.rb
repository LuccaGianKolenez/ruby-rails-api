class AuthController < ApplicationController
  def sign_in
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JWT.encode({ sub: user.id, exp: 24.hours.from_now.to_i }, ENV.fetch("JWT_SECRET"), "HS256")
      render json: { token: token, user: { id: user.id, email: user.email } }
    else
      render json: { error: "invalid_credentials" }, status: :unauthorized
    end
  end
end
