FactoryGirl.define do
  factory :recipe do
    title "My first recipe"
    description { FFaker::Lorem.paragraph }
    instructions { FFaker::Lorem.paragraphs }
    user { FactoryGirl.create :user }

    factory :short_recipe do
      instructions FFaker::Lorem.characters(99)
    end

    factory :long_recipe do
      instructions FFaker::Lorem.characters(400)
    end
  end
end
