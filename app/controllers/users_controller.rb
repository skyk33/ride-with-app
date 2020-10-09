class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def show
    # binding.pry
    @profile = @user.profile
  end

  private

  def check_user
    @user = User.find(params[:id])
    # binding.pry
    redirect_to root_path, alert: '無効なアクセスです' unless current_user == @user
  end
end
