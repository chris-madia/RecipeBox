class DirectionsController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.find_by(id: params[:recipe_id])
      unless @recipe
        redirect_to directions_path
        return
      end
    @direction = Direction.new(recipe_id: @recipe.id)
  end

  private

    def ingredient_params
      params.require(:direction).permit(:description)
    end

end
