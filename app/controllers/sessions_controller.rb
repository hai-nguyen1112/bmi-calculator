class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to controller: 'welcome', action: 'home'
      else
        flash.notice = 'Password Incorrect'
        render :new
      end
    else
      flash.notice = 'No User Found With That Username'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to controller: 'welcome', action: 'home'
  end

end
