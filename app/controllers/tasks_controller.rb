class TasksController < ApplicationController
  before_action :set_task, only: %i[show destroy update]

  def index
    tasks = @current_user.tasks
    render json: { tasks: }
  end

  def create
    task = Task.new(task_params, user: @current_user)

    if task.save
      render json: { task: }
    else
      render json: { errors: task.errors.full_messages }
    end
  end

  def show
    if @task
      render json: { task: @task }
    else
      render json: { errors: 'Could not find the task' }, status: :not_found
    end
  end

  def update
    if @task.update(task_params)
      render json: { task: @task }
    else
      render json: { errors: @task.errors.full_messages }
    end
  end

  def destroy
    if @task.destroy
      render json: { taks: @current_user.tasks }
    else
      render json: { errors: 'Could not delete the task' }
    end
  end

  private

  def set_task
    @task = @current_user.tasks.find(params[:id])

    render json: { errors: 'Could not find the task' }, status: :not_found unless @task
  end

  def task_params
    params.permit(:description, :status)
  end
end
