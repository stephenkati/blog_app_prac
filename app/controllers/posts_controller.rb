class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = Post.includes(:author).find_by(author_id: params[:user_id], id: params[:id])
    @user = @post.author
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(post_params)
    @post.author_id = @user.id
    if @post.save
      redirect_to user_posts_path(@user), flash: { notice: 'Post created successfully!' }
    else
      puts @user
      puts @post.errors.full_messages
      flash.now[:alert] = 'Failed to create the post.'
      render :new
    end
  end

  def destroy
    @post = Post.includes(:author).find_by(author_id: params[:user_id], id: params[:id])
    authorize! :destroy, @post

    if @post.destroy
      flash[:notice] = 'Post deleted successfully!'
      redirect_to user_posts_path(@post.author)
    else
      flash[:alert] = 'Failed to delete the post.'
      redirect_to user_post_path(@post.author, @post)
    end

  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
