class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :ingredient
      t.string :amount
      t.integer :recipe_id

      t.timestamps
    end
  end
end
