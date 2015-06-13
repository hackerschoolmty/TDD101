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
  end
end
