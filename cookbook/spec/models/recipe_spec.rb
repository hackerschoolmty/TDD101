require 'rails_helper'

RSpec.describe Recipe, :type => :model do

  let(:recipe) { FactoryGirl.create :recipe }

  subject { recipe }

  context "attributes" do
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:description) }
    it { is_expected.to respond_to(:instructions) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:instructions) }
    it { is_expected.to validate_presence_of(:user_id) }

    it { is_expected.to validate_length_of(:title).is_at_least(10).is_at_most(50) }
  end

  context "associations" do
    it { is_expected.to belong_to(:user) }
  end

  context "methods" do
    describe "#difficulty" do
      context "when instructions are short" do
        before do
          @short_recipe = FactoryGirl.build :short_recipe
        end

        it "returns 'Easy' for recipe shorter than 100 chars" do
          expect(@short_recipe.difficulty).to eql 'Easy'
        end
      end

      context "when instructions are long" do
        before do
          @long_recipe = FactoryGirl.build :long_recipe
        end

        it "returns 'Hard' for recipe longer than 399 chars" do
          expect(@long_recipe.difficulty).to eql 'Hard'
        end
      end
    end
  end
end
