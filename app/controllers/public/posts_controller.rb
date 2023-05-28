class Public::PostsController < ApplicationController
    before_action :authenticate_customer!
  def new
    @kitchen = Kitchen.find(params[:kitchen_id])
    @post = @kitchen.posts.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.star = params[:score]
    @post.save
    redirect_to kitchen_path(params[:kitchen_id])
  end

  def index
    @kitchen = Kitchen.find(params[:kitchen_id])
    @posts = @kitchen.posts

  end

  def show
    @kitchen = Kitchen.find(params[:kitchen_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
       @post = Post.find(params[:id])
    if @post.customer != current_customer
      redirect_to kitchen_post_path
    end
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to kitchen_path(@post.kitchen_id)
    else
      render :edit
    end
  end

  def destroy
    @kitchen = Kitchen.find(params[:kitchen_id])
    @post = Post.find(params[:id])
    if @post.customer_id == current_customer.id
       @post.destroy
    end
    redirect_to kitchen_path(@kitchen.id)
  end




  private
  def post_params
    params.require(:post).permit(:image, :review, :kitchen_id, :name, :profile_image, :costomer_id )
  end
end
# あと評価