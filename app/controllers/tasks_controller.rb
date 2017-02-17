class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:done,:undone,:destroy]

  def index
    @tasks = current_user.tasks.where(done: false)
    @tasks_done = current_user.tasks.where(done: true)
    @task = Task.new
  end

  def done
    redirect_to tasks_path if @task.update(done: true)
  end

  def undone
    redirect_to tasks_path if @task.update(done: false)
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path
    end
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
