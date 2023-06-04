class Public::KitchensController < ApplicationController
  def search
    @kitchens = Kitchen.search(params[:keyword])
    @kitchens = @kitchens.where(genre_id: params[:genre_id]) if params[:genre_id].present?
    @kitchens = @kitchens.where(maker_id: params[:maker_id]) if params[:maker_id].present?
    @keyword = params[:keyword]
    render "index"
  end

  def index
    @kitchens = Kitchen.all
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    if @kitchen.update(kitchen_params)
      redirect_to kitchen_index_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:keyword).permit(:genre_id, :maker_id)
  end

  def customer_params
    params.require(:kitchen).permit(:name, :introduction, :price, :post_id)
  end
end
