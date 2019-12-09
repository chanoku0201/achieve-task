class TasksController < ApplicationController
  def index
    # @todays_tasks
    # @tommorows_tasks
    # @completed_tasks
    @all_tasks = Task.all.order('limit_date')
    @status = ['START', 'DOING', 'COMPLETE']
  end

  def new

  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
