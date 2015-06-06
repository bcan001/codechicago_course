class SessionsController < ApplicationController
	
	def new

	end

	def create
		@user = User.find_by(:username => session_params[:username]).try(:authenticate, session_params[:password])

		#binding.pry

		if @user
			# store our user in a session variable
			session[:user_id] = @user.id


			redirect_to root_path
		else	
			@error = 'Incorrect username, email or password'
			render 'sessions/new'
		end
	end

	def destroy
		session.clear
		redirect_to root_path
	end

	private
	def session_params
		params.require(:session).permit(:username, :password, :email)


		#session_params => {:username: "keith", :password: "passwordstring", :email: "kbryant@gmail.com"}

	end

end