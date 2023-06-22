class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.author = current_user
    if @comment.save
      redirect_to user_posts_path(@user), notice: 'Comment created successfully!'
    else
      redirect_to user_posts_path(@user), notice: 'Failed to create comment!'
    end
  end

  def destroy
    @commentdel = Comment.includes(:post).find(params[:id])
    @post = @commentdel.post
  
    if @commentdel.destroy
      redirect_to user_post_path(@post.author, @post), notice: 'Comment deleted successfully!'
    else
      redirect_to user_post_path(@post.author, @post), alert: 'Failed to delete comment!'
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end