class IngredientsController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.new
    @ingredient.recipe = @recipe

    respond_to do |format|
      if @answer.save
        format.html { redirect_to recipes_url }
        format.json { render :show, status: :created, title: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def destroy
    @ingredient.destroy
    respond_to do |format|
        format.html { redirect_to questions_url, notice: 'Ingredient was successfully destroyed.' }
        format.json { head :no_content }
  end

  private

    def ingredient_params
      params.require(:ingredient).permit(:description, :amount)
    end

end
