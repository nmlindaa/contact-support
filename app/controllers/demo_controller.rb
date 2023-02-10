class DemoController < ApplicationController
  before_action -> { authenticate_user! }

	def show
    render
	end

	def get_profiles
		@profiles = Profile.where(user_id: current_user.id, availability: 'online').to_a
		render :json => { profiles: @profiles }
	end
end