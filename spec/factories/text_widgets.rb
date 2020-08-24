FactoryBot.define do
  factory :text_widget do
    title { Faker::Lorem.sentence(word_count: 3) }
    content { Faker::Lorem.paragraph }
    background_color { "#008000" }
    position { generate(:position) }
    website_config
  end
end
