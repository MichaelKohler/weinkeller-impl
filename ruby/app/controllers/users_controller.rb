class UsersController < ApplicationController
  def create
    if User.check_if_user_exists(params[:user])
      if user = User.authenticate(params[:user])
        session[:user_id] = user.id
        redirect_to weinkeller_path(user)
      else
        redirect_to '/'
      end
    else
      # create user since it does not yet exist
      @user = User.create_new(params[:user][:name], params[:user][:password])
      if @user
        session[:user_id] = @user.id
        redirect_to weinkeller_path(@user)
      else
        redirect_to '/'
      end
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
end