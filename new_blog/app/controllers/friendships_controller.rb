class FriendshipsController < ApplicationController
	def create
		@friendship = User.find(session[:user_id]).friendships.build(:friend_id => params[:friend_id])
		
		#flash[:notice] = "Successfully Created Friendship"

		# make your request a pending status
		# @friendship.status = true
		# # create an identical friendship for the other person to accept
		# @friendship_request = Friendship.create(:user_id => params[:friend_id], :friend_id => session[:user_id])
		# @friendship_request.save


		if @friendship.save
			flash[:notice] = "Friend Request Sent"
			redirect_to root_path
		else
			flash[:notice] = "Unable to add friend"
			render 'new'
		end
	end


	def destroy
		@friendship = User.find(session[:user_id]).friendships.find(params[:friend_id])

		# destroy the other friendship created
		#@friendship_request = User.find(params[:friend_id]).friendships.find(session[:user_id])
		# @friendship_request = Friendship.find({:user_id => params[:friend_id], :friend_id => session[:user_id]})
		# @friendship_request.destroy



		@friendship.destroy
		flash[:notice] = "Successfully destroyed friendship"
		redirect_to root_path
	end





	# when the button is clicked, the status of the friendship where the session[:user_id], contained in the :friend_id, is set to true
	def accept_friend
		binding.pry

		@friendship = Friendship.where({:user_id => session[:user_id], :friend_id => params[:friend_id]}).first
		
		@friendship.status = true


		if @friendship.save

			redirect_to root_path

		else

			redirect_to profile_path_path
		end
	end





end