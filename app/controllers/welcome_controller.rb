class WelcomeController < ApplicationController
	def index
	  @cocktails = Cocktail.search(params[:term])
	end

  private

  def cocktail_params
	  params.require(:cocktail).permit(:term)
	end
end
