class WelcomeController < ApplicationController
	def index
	  @cocktails = Cocktail.search(params[:term])
	  Cocktail.joins(:cocktail_ingredients).where(cocktail_ingredients: { ingredient_id: 1, cocktail_id: CocktailIngredient.where(ingredient_id: 4).select(:cocktail_id) })
	end

  private

  def cocktail_params
	  params.require(:cocktail).permit(:term)
	end
end
