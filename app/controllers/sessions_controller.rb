class SessionsController < ApplicationController
	def new
  	end

	def create
		#check if user exists
    	user = User.find_by(email: params[:session][:email].downcase)
    	if user && user.authenticate(params[:session][:password])
    	  # Log the user in and redirect to the user's show page
    	  log_in(user)
    	  redirect_to user_url(user)
    	else
      	# Create an error message
      	flash[:danger] = 'Invalid email/password combination'
      	render 'new'
    end
end

	def destroy
		#method in sessions_helper
		log_out
		#return home
		redirect_to root_url
  	end
end
