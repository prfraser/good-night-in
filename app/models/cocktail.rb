class Cocktail < ApplicationRecord
  validates :title, :ingredients, :method, presence: true
end
