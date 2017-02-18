class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:done,:undone,:destroy]

  def index
    @tasks = current_user.tasks.order(id: :desc)
    @task = Task.new
  end

  def done
    redirect_to tasks_path if @task.done!
  end

  def undone
    redirect_to tasks_path if @task.undone!
  end

  def create
    @task = current_user.tasks.new(task_params)
    redirect_to tasks_path  if @task.save
  end

  def destroy
    redirect_to tasks_path if @task.destroy
  end

  private

  def set_task
    @task = current_user.tasks.find( params[:id] ||params[:task_id])
  end


  def task_params
    params.require(:task).permit(:description)
  end
end
