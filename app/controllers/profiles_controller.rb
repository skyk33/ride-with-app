class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  before_action :check_user, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_path(current_user.id), notice: 'Profile was successfully updated'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def profile_params
    params.require(:profile).permit(
      :nickname,
      :current_motorcycle,
      :motorcycle_history,
      :dream_motorcycle,
      :fav_touring_routes,
      :other_hobbies,
      :message,
      :image
    )
  end

  def check_user
    redirect_to root_path if current_user.id != @profile.user_id
  end
end
