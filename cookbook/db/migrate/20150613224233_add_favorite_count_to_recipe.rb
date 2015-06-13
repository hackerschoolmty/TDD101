class AddFavoriteCountToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :favorite_count, :integer
  end
end
