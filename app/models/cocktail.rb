class Cocktail < ApplicationRecord
  	validates :title, :ingredients, :method, presence: true
  	has_many :cocktail_ingredients
  	has_many :ingredients, :through => :cocktail_ingredients


	def self.search(term)
	  if term
	    CocktailIngredient.where(ingredient_id: term).map(&:cocktail).uniq
	  else
    	all
	  end
	end

end
