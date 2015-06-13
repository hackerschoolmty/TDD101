FactoryGirl.define do
  factory :favorite do
    user { FactoryGirl.create :user }
    recipe { FactoryGirl.create :recipe }
  end

end
