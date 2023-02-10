class HomeController < ApplicationController
	before_action -> { authenticate_user! }

	def index
		@profiles = Profile.where(user_id: current_user.id).to_a

		@online_profiles = Profile.where(user_id: current_user.id, availability: 'online').to_a
		render
	end
end