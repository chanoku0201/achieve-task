class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def index

  end

  def new

  end

  def show
    @nickname = current_user.nickname
  end

  def create

  end

  def edit
  end

  def update
    if current_user.update(update_user)
      redirect_to "/users/#{current_user.id}"
    else
      render :edit
    end
  end

  def destroy

  end

  def logout

  end

  private

  def update_user
      params.require(:user).permit(:email, :nickname, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
