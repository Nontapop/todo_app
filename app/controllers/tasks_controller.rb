class TasksController < ApplicationController
  before_action :set_task, only: [:destroy, :complete]

  def index
    @incomplete_tasks = Task.where(status: false)
    @complete_tasks = Task.where(status: true)
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.status = false  # Set the status to false (incomplete)
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :index
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully deleted.'
  end

  def complete
    @task.update(status: true)
    redirect_to tasks_path, notice: 'Task was successfully marked as complete.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
