class UsersController < ApplicationController
  before_action :authenticate!, only: [:index, :show]

  def create
    user = User.new(user_params)
    if user.save
      render json: { id: user.id, email: user.email }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    render json: User.select(:id, :email).all
  end

  def show
    user = User.find(params[:id])
    render json: { id: user.id, email: user.email }
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
