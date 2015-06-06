class PostsController < ApplicationController


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all


  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    #@micropost = current_user.microposts.build(micropost_params)

    @post = User.find(session[:user_id]).posts.build(post_params)

    #@post = Post.new(post_params)
    #@post.creator = current_user

    @post.save
    redirect_to @post

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to @post

  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @post
    
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
