class HomeController < ApplicationController
	def index
		if current_user.present?
			@profiles = Profile.where(user_id: current_user.id).to_a

			@online_profiles = Profile.where(user_id: current_user.id, availability: 'online').to_a
			render
		else
			redirect_to new_user_session_path
		end
	end
end