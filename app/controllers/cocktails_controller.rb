class CocktailsController < ApplicationController
  def new
  end
  def create
    @cocktail = Cocktail.new(params[:cocktail])

    @cocktail.save
    redirect_to @cocktail
  end
end
