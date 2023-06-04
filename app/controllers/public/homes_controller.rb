class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @maker = Maker.all
  end
end
