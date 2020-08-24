FactoryBot.define do
  factory :video_widget do
    title { Faker::Lorem.sentence(word_count: 3) }
    url { Faker::Internet.url }
    position { generate(:position) }
    website_config
  end
end
