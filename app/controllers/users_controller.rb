class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  def show
    # binding.pry
    @profile = @user.profile
  end

  def edit
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      redirect_to @user, notice: 'User was updated'
    else
      render :edit
    end
  end

  private

  def check_user
    @user = User.find(params[:id])
    # binding.pry
    redirect_to root_path, alert: '無効なアクセスです' unless current_user == @user
  end

  def user_params
    params.require(:user).permit(:birthday, :email, :password, :password_confirmation)
  end

  def needs_password?(_user, params)
    params[:password].present?
  end
end
