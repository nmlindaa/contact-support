class ProfileController < ApplicationController
  before_action :get_profile
	def edit
    render
	end

  def update
    if @profile.update(profile_params)
      redirect_to edit_profile_path(@profile.id), notice: "Successfully update profile"
    else
      redirect_to edit_profile_path(@profile.id), alert: "Failed update profile"
    end
  end

  protected

  def get_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params
      .require(:profile)
      .permit(
        :role,
        :phone,
        :availability
      )
  end
end