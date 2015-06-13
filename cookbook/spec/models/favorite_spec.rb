require 'rails_helper'

RSpec.describe Favorite, :type => :model do
  let(:favorite) { FactoryGirl.create :favorite }

  subject { favorite }

  context "attributes" do
    it { is_expected.to respond_to(:user_id) }
    it { is_expected.to respond_to(:recipe_id) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:recipe_id) }
  end

  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:recipe) }
  end

  context "callbacks" do
    describe "#update_recipe_favorite_count" do

      context "when recipe has not been favorited" do
        before do
          @recipe = FactoryGirl.create :recipe
          3.times { FactoryGirl.create :favorite }
          3.times { FactoryGirl.create :favorite, recipe: @recipe }
        end

        it { expect(@recipe.favorite_count).to eql 3 }
      end

      context "when removing a recipe from favorites" do
        before do
          @recipe = FactoryGirl.create :recipe
          favorite = FactoryGirl.create :favorite, recipe: @recipe

          favorite.destroy
        end

        it { expect(@recipe.favorite_count).to eql 0 }
      end
    end
  end
end
