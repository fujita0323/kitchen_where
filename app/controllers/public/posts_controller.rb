class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  before_action :kitchen_find, only: [:index, :show, :new, :edit, :destroy]
  def index
    # @kitchen = Kitchen.find(params[:kitchen_id])
    @posts = @kitchen.posts
  end

  def show
    # @kitchen = Kitchen.find(params[:kitchen_id])
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    # @kitchen = Kitchen.find(params[:kitchen_id])
    @post = @kitchen.posts.new
  end

  def edit
    # @kitchen = Kitchen.find(params[:kitchen_id])
    @post = Post.find(params[:id])
    redirect_to kitchen_post_path if @post.customer != current_customer
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    # @post.star = params[:score]
    @post.save
    redirect_to kitchen_path(params[:kitchen_id])
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
    # @kitchen = Kitchen.find(params[:kitchen_id])
    @post = Post.find(params[:id])
    @post.destroy if @post.customer_id == current_customer.id
    redirect_to kitchen_path(@kitchen.id)
  end

  private

  def post_params
    params.require(:post).permit(:image, :review, :kitchen_id, :name, :profile_image, :costomer_id, :star)
  end

  def kitchen_find
    @kitchen = Kitchen.find(params[:kitchen_id])
  end
end
# あと評価
