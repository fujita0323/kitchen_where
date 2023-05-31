class Public::CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.customer_id = current_customer.id
    @comment.post_id = @post.id
    @comment.save!
    redirect_to kitchen_post_path(kitchen_id: @post.kitchen_id, id: @post.id)
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.customer_id == current_customer.id
       @comment.destroy
    end
    redirect_to kitchen_post_path(params[:kitchen_id],params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:reaction, :customer_id, :image, :post_id, )
  end
end

