class TasksController < ApplicationController
  def index
    # @todays_tasks
    # @tommorows_tasks
    @all_tasks = Task.all.order('limit_date').where.not(status: "COMPLETE").includes(:genre)
    @complete_tasks = Task.all.where(status: "COMPLETE")
    # @status = ['START', 'DOING', 'COMPLETE']
  end

  def new
    @task = Task.new
  end

  def create

  end

  def done
    @task.update(status: "COMPLETE")
    @tasks = Task.all
    render :index
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
  end

  def destroy

  end
end
