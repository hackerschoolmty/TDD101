require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryGirl.create :user }

  subject { user }

  context "attributes" do
    it { is_expected.to respond_to(:full_name) }
    it { is_expected.to respond_to(:username) }
    it { is_expected.to respond_to(:bio) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:full_name) }
 
    it { is_expected.to validate_length_of(:bio).is_at_most(300) }
 
    it { is_expected.to allow_value('Jesuslerma3').for(:username) }
    it { is_expected.to_not allow_value('jesuslerma').for(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
  end

  context "associations" do
    it { is_expected.to have_many(:recipes) }
    it { is_expected.to have_many(:favorites) }
    it { is_expected.to have_many(:favorite_recipes) }
  end

  context "scopes" do
    describe "recipes" do
      before do
        3.times { FactoryGirl.create :recipe, user: user }
        3.times { FactoryGirl.create :recipe }
      end

      it "returns the user's recipes" do
        expect(user.recipes.count).to eql 3
      end
    end

    describe "favorite_recipes" do
      before do
        3.times { FactoryGirl.create :favorite, user: user }
        3.times { FactoryGirl.create :recipe }
      end

      it "returns the user's recipes" do
        expect(user.favorite_recipes.count).to eql 3
      end
    end
  end
end
