class TasksController < ApplicationController
  before_action :set_task, only: %i[show destroy update]

  def index
    tasks = @current_user.tasks
    render json: { tasks: }
  end

  def create
    task = @current_user.tasks.new(task_params)

    if task.save
      render json: { tasks: @current_user.tasks }
    else
      render json: { errors: task.errors.full_messages }, status: 400
    end
  end

  def show
    render json: { task: @task }
  end

  def update
    if @task.update(task_params)
      render json: { tasks: @current_user.tasks }
    else
      render json: { errors: @task.errors.full_messages }
    end
  end

  def destroy
    if @task.destroy
      render json: { tasks: @current_user.tasks }
    else
      render json: { errors: 'Could not delete the task' }, status: 401
    end
  end

  private

  def set_task
    @task = @current_user.tasks.find_by(id: params[:id])

    render json: { errors: 'Could not find the task' }, status: :not_found unless @task
  end

  def task_params
    params.require(:task).permit(:description, :status)
  end
end
