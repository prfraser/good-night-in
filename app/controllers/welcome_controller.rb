class WelcomeController < ApplicationController
	def index
	  if params[:term].present?
		  @ingredients = params[:term].split(' ')
		  @ingredients.map! do |ingredient|
		  	Ingredient.where(name: ingredient).ids[0]
		  end
			cocktail_ingredients = CocktailIngredient.where(ingredient_id: @ingredients).select(:cocktail_id)
			cocktail_ingredients = cocktail_ingredients.group(:cocktail_id).having('COUNT(ingredient_id) >= ?', @ingredients.count)
			@cocktails = Cocktail.where(id: cocktail_ingredients.select(:cocktail_id))
		end
	end

  private

  def cocktail_params
	  params.require(:cocktail).permit(:term)
	end
end
