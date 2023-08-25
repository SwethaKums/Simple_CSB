class ApplicationController < ActionController::Base

	private
	def logged_in_restriction
		unless session[:user_id]
			flash[:notice]="you must log in before this action"
			redirect_to(access_login_path)
		end
	end
end
