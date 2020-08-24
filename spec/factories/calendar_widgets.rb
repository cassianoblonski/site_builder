FactoryBot.define do
  factory :calendar_widget do
    title { Faker::Lorem.sentence(word_count: 3) }
    day { Date.today }
    position { generate(:position) }
    website_config
  end
end
