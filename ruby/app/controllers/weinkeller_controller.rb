class WeinkellerController < ApplicationController
  def index
    @user = User.new
    render 'index'
  end

  def show
    @user = User.find(session[:user_id])
    render 'overview'
  end
end
