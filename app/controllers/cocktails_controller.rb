class CocktailsController < ApplicationController
	def new
		
	end

	def index
		@cocktails = Cocktail.all
	end

	def show
		@cocktail = Cocktail.find(params[:id])
	end
	
	def create
		@cocktail = Cocktail.new(cocktail_params)

		if @cocktail.save
	    redirect_to @cocktail
	  else
	    render 'new'
	  end
	end

	private
	  def cocktail_params
	    params.require(:cocktail).permit(:title, :ingredients, :method)
	  end

end
