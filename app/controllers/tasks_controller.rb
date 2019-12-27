class TasksController < ApplicationController

  before_action :task_set, only: [:show, :edit, :update, :destroy, :change_status, :change_completed]

  def index
    # @todays_tasks
    # @tommorows_tasks
    @all_tasks = Task.all.where(user_id: current_user.id).order('limit_date').where.not(status:2).includes(:genre).limit(7)
    @complete_tasks = Task.all.where(user_id: current_user.id).where(status: 2).includes(:genre).limit(7)

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
  end

  def change_status
    @task.change_status!

    redirect_to root_path, notice: 'successfully updated.'
  end

  def change_completed
    @task.change_completed!
    redirect_to root_path, notice: 'successfully updated.'
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit

  end

  def update
    @status = params[:status]
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, notice: 'task deleted'
  end

  private

    def task_set
      @task = Task.find(params[:id] || params[:task_id])
    end

    def task_params
      params.require(:task).permit(:name, :text, :limit_date, :status, :level, :priority, :genre_id)
    end
end
