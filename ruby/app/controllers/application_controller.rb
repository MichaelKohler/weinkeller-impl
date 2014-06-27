class ApplicationController < ActionController::Base
  def current_user
    begin
      @current_user = User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      nil
    end
  end
  helper_method :current_user

  def index
    @user = User.new
    render 'index'
  end
end
