class UsersController < ApplicationController

  before_action :get_user, :require_login, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'welcome', action: 'home'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to controller: 'welcome', action: 'home'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session.clear
    redirect_to controller: 'welcome', action: 'home'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email)
  end

  def get_user
    @user = User.find(params[:id])
  end

end
