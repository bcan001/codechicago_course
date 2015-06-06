class UsersController < ApplicationController

	def profile_page
		@user = User.find(session[:user_id])
		@posts = @user.posts
		#@comments = @user.posts.comments

		# friend requests you have sent
		@user_friend_requests_pending = Friendship.where({user_id: session[:user_id], :status => true})

		# freind requests you have accepted (your current friends)
		@user_friend_requests_pending_from = Friendship.where({friend_id: session[:user_id], :status => true})


	end

	def index
		@users = User.where.not(id: session[:user_id])
	end

	def show
		# template to show users posts
		@user = User.find(params[:id])
		@posts = @user.posts
	end



	def new
		@user = User.new
	end


	def create
		@user = User.new(user_params)

		if @user.save
			# What we've done is assign the user's id to the key :user_id. We could assign the whole user, but you need to be careful about what you store in the session. Although encrypted, any data stored to the session variable is simply being saved the user's cookie in their browser. If we saved all the user's info, someone could potentially decrypt that cookie and get access to that information.
			session[:user_id] = @user.id


			redirect_to root_path
		else

			render 'new'
		end
	end




	

	private
	# whitelisted parameters
	def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end