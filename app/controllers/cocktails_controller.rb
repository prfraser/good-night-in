class CocktailsController < ApplicationController
	def new
		@cocktail = Cocktail.new
	end

	def edit
  	@cocktail = Cocktail.find(params[:id])
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

	def destroy
	  @cocktail = Cocktail.find(params[:id])
	  @cocktail.destroy
	 
	  redirect_to cocktails_path
	end

	def update
	  @cocktail = Cocktail.find(params[:id])
	 
	  if @cocktail.update(cocktail_params)
	    redirect_to @cocktail
	  else
	    render 'edit'
	  end
	end

	private
	  def cocktail_params
	    params.require(:cocktail).permit(:title, :ingredients, :method)
	  end

end
