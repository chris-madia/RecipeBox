class AddDescriptionToDirections < ActiveRecord::Migration[5.1]
  def change
    add_column :directions, :description, :text
  end
end
