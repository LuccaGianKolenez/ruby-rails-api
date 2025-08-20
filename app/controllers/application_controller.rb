class ApplicationController < ActionController::API
  def auth_payload
    header = request.headers["Authorization"].to_s
    token = header.split(" ").last
    return nil if token.blank?
    decoded = JWT.decode(token, ENV.fetch("JWT_SECRET"), true, { algorithm: "HS256" })
    decoded.first
  rescue
    nil
  end

  def current_user
    payload = auth_payload
    return nil unless payload
    User.find_by(id: payload["sub"])
  end

  def authenticate!
    render json: { error: "unauthorized" }, status: :unauthorized unless current_user
  end
end
