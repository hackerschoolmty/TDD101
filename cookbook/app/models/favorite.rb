class Favorite < ActiveRecord::Base
  validates :user_id, :recipe_id, presence: true

  belongs_to :user
  belongs_to :recipe

  after_create :update_recipe_favorite_count
  after_destroy :update_recipe_favorite_count

  def update_recipe_favorite_count
    self.recipe.favorite_count = self.recipe.favorites.count
    self.recipe.save
  end
end
