class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.text :description

      t.timestamps
    end
  end
end
