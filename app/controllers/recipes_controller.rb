class RecipesController < ApplicationController

  def index
    @recipes = Recipe.page(params[:page]).per(8)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @directions = @recipe.directions
  end

  def destroy
    @recipe = Recipe.destroy(params[:id])
    respond_to do |format|
        format.html { redirect_to recipes_path }
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :ingredients, :description, ingredients_attributes: [:id, :ingredient, :_destroy], directions_attributes: [:id, :description, :_destroy])
    end
end
