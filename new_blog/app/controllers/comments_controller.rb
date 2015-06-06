class CommentsController < ApplicationController


	def create
		@post = Post.find(params[:post_id])


		if session[:user_id]
			@comment = @post.comments.create(comment_params)


			#binding.pry
			# puts '-'*20
			# puts comment_params
			# puts '-'*20
			redirect_to post_path(@post)

		else
			flash[:notice] = "You need to be logged in to comment on posts"
			redirect_to post_path(@post)

  	end
	end


	private
	def comment_params
		params.require(:comment).permit(:commenter, :text)
	end

end