class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :task_set, only: [:show, :edit, :update, :destroy, :change_status, :change_completed]

  def index
    # @search = Task.ransack(params[:search])
    # @tasks = @search.result(distinct: true)

    @todays_tasks = Task.all.where(user_id: current_user.id,).where("limit_date = ?", Date.today).where.not(status:2).includes(:user, :genre).limit(5)
    @tomorrows_tasks = Task.all.where(user_id: current_user.id,).where("limit_date = ?", Date.tomorrow).where.not(status:2).includes(:user, :genre).limit(5)
    @all_tasks = Task.all.where(user_id: current_user.id).order('limit_date').where.not(status:2).includes(:user, :genre).limit(5)
    @complete_tasks = Task.all.where(user_id: current_user.id).where(status: 2).includes(:user, :genre).limit(5)

  end

  def new
    @task = Task.new
  end

  def create

    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path, notice: 'Task was succesfully added!'
    else
      render :new
    end

  end


  def change_status
    @task.change_status!
    redirect_to :back, notice: 'successfully changed.'
  end

  def change_completed
    @task.change_completed!
    redirect_to :back, notice: 'This task was completed.'
  end

  def todays_task
    @todays_task = Task.all.where(user_id: current_user.id,).where("limit_date = ?", Date.today).where.not(status:2).includes(:user, :genre).page(params[:page]).per(10)
  end

  def tomorrows_task
    @tomorrows_task = Task.all.where(user_id: current_user.id,).where("limit_date = ?", Date.tomorrow).where.not(status:2).includes(:user, :genre).page(params[:page]).per(10)
  end

  def all_task
    @all_task = Task.all.where(user_id: current_user.id).order('limit_date').where.not(status:2).includes(:user, :genre).page(params[:page]).per(10)
  end

  def complete_task
    @complete_task = Task.all.where(user_id: current_user.id).where(status: 2).includes(:user, :genre).page(params[:page]).per(10)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to "/tasks/#{@task.id}", notice: 'Task was updated!'
    else
      rendr :edit
    end
    @status = params[:status]
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, notice: 'Task was deleted'
  end

  def search
    @search_tasks = Task.where('name LIKE(?)', "%#{params[:name]}%").page(params[:page]).per(10).order("created_at DESC")
    @search_name = params[:name]
    # @search = Task.ransack(search_params)
    # @tasks = @search.result(distinct: true)
  end

  private

    def task_set
      @task = Task.find(params[:id] || params[:task_id])
    end

    def task_params
      params.require(:task).permit(:name, :text, :limit_date, :status, :level, :priority, :genre_id).merge(user_id: current_user.id)
    end

    # def search_params
    #   params.require(:search).permit!
    # end

    # def help_index
    #   redirect_to action: :index unless user_signed_in?
    # end

end
