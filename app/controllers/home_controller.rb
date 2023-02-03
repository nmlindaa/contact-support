class HomeController < ApplicationController
	def index
		@profiles = Profile.where(user_id: current_user.id).to_a if current_user.present?
    render
	end
end