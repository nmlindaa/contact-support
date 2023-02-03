class ProfileController < ApplicationController
  before_action :get_profile, except: [:new, :create]

  def index
    @profiles = Profile.where(user_id: params[:id]).to_a
	end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(profile_params)
    if @profile.save
      @profile.update_attribute(:user_id, current_user.id)
      redirect_to root_path, notice: "Successfully update profile"
    else
      render :new, alert: 'Failed to create new profile'
    end
  end

	def edit
    render
	end

  def update
    if @profile.update(profile_params)
      redirect_to root_path, notice: "Successfully update profile"
    else
      redirect_to edit_profile_path(@profile.id), alert: "Failed update profile"
    end
  end

  def destroy
    if @profile.destroy
      redirect_to root_path, notice: "Successfully destroy profile"
    else
      render root_path, alert: "Failed to destroy profile"
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