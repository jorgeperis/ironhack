class SandwichesController < ApplicationController
	def index
	  sandwiches = Sandwich.all
	  render json: sandwiches
	end

	def create
	  sandwich = Sandwich.create(sandwich_params)
	  render json: sandwich
	end

	def show
	  @sandwich = Sandwich.find_by(id: params[:id])
	  unless @sandwich
	    render json: {error: "sandwich not found"},
	    status: 404
	    return
	  end
		@ingredients = Ingredient.all
		@totalcalories = 0
		@sandwich.ingredients.each do |ingredient|
		@totalcalories += ingredient.calories
		end


	end


	def add_ingredient
		# sandwich = Sandwich.find_by(id: params[:id])
		# ingredient = Ingredient.find_by(id: params[:ingredientid])
		# sandwich.ingredients.push(ingredient)
		# redirect_to("/sandwiches/#{sandwich.id}")


	end

	def update
	  sandwich = Sandwich.find_by(id: params[:id])
	  unless sandwich
	    render json: {error: "sandwich not found"},
	    status: 404
	    return
	  end
	  sandwich.update(sandwich_params)
	  render json: sandwich
	end

	def destroy
	  sandwich = Sandwich.find_by(id: params[:id])
	  unless sandwich
	    render json: {error: "sandwich not found"},
	    status: 404
	    return
	  end
	  sandwich.destroy
	  render json: sandwich
	end


	private

	def sandwich_params
	  params.require(:sandwich)
	    .permit(:name, :bread_type)
	end
end
