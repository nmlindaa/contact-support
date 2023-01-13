class HomeController < ApplicationController
	def index
		@profile = Profile.where(user_id: current_user.id).last if current_user.present?
    render
	end
end