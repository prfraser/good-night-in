class Cocktail < ApplicationRecord
  	validates :title, :ingredients, :method, presence: true
  	has_many :cocktail_ingredients
  	has_many :ingredients, :through => :cocktail_ingredients
end
