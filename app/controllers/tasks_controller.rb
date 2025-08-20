class TasksController < ApplicationController
  before_action :authenticate!

  def index
    render json: current_user.tasks.order(created_at: :desc)
  end

  def create
    task = current_user.tasks.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    task = current_user.tasks.find(params[:id])
    render json: task
  end

  def update
    task = current_user.tasks.find(params[:id])
    if task.update(task_params)
      render json: task
    else
      render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy!
    head :no_content
  end

  private
  def task_params
    params.require(:task).permit(:title, :done)
  end
end
