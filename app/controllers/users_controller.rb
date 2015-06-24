class UsersController < ApplicationController
  before_action :getUser, only: [:edit, :update, :show]

  def index
    @users = User.paginate page: params[:page],
                           per_page: Settings.user.users_number_per_page
  end

  def show
    @team = @user.teams.last
  end

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit :name, :password, :password_confirmation, :email
  end

  def getUser
    @user = User.find params[:id]
  end
end
