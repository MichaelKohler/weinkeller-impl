class CellarsController < ApplicationController
  def show
    @cellar = Cellar.new
    @user = User.find(session[:user_id])
    #@allCellars = Cellar.where(user: current_user.name)
    render 'overview'
  end

  def create
    @cellar = Cellar.init(params[:name])
    @cellar.save!
    redirect_to cellar_path(current_user)
  end
end
