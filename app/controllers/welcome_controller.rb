class WelcomeController < ApplicationController
	def index
		# Old search function
	  @cocktails = Cocktail.search(params[:term])

	  # New search function. Still need to split search params into id's in an array.
	  cocktail_ingredients = [1, 4]
		cocktail_ingredients = CocktailIngredient.where(ingredient_id: ingredient_ids).select(:cocktail_id)
		cocktail_ingredients = cocktail_ingredients.group(:cocktail_id).having('COUNT(ingredient_id) >= ?', ingredient_ids.count)
		@cocktails = Cocktail.where(id: cocktail_ingredients.select(:cocktail_id))
	end

  private

  def cocktail_params
	  params.require(:cocktail).permit(:term)
	end
end
