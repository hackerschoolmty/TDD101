class AddAttributesToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :title, :string, default: ""
    add_column :recipes, :description, :text, default: ""
    add_column :recipes, :instructions, :text, default: ""
  end
end
