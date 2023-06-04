class Admin::KitchensController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      all_kitchens = @genre.kitchens
    else
      all_kitchens = Kitchen.includes(:genre)
    end

    if params[:maker_id]
      @maker = Maker.find(params[:maker_id])
      all_kitchens = @maker.kitchens
    else
      all_kitchens = Kitchen.includes(:maker)
    end
    @kitchens = Kitchen.all
    @all_kitchens_count = all_kitchens.count
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  # kitchenこれなんで？
  def new
    @kitchen = Kitchen.new
  end

  def edit
    @kitchen = Kitchen.find(params[:id])
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    @kitchen.save ? (redirect_to admin_kitchen_path(@kitchen)) : (render :new)
  end

  def update
    @kitchen = Kitchen.find(params[:id])
    @kitchen.update(kitchen_params)
    redirect_to admin_kitchen_path(@kitchen.id)
  end

  def destroy
    kitchen = Kitchen.find(params[:id])
    kitchen.destroy
    redirect_to admin_kitchens_path
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:genre_id, :name, :introduction, :image, :price, :maker_id)
  end

  def ensure_kitchen
    @kitchen = Kitchen.find(params[:id])
  end
end
