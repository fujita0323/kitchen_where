class Admin::MakersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @maker = Maker.new
    @makers = Maker.all
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def create
    @maker = Maker.new(maker_params)
    if @maker.save
      redirect_to admin_makers_path
    else
      @makers = Maker.all
      render :index
    end
  end

  def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
      redirect_to admin_makers_path
    else
      render :edit
    end
  end

  def destroy
    maker = Maker.find(params[:id])
    maker.destroy
    redirect_to admin_makers_path
  end

  private

  def maker_params
    params.require(:maker).permit(:name)
  end

  def ensure_maker
    @maker = Maker.find(params[:id])
  end
end
