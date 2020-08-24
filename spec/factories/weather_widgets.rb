FactoryBot.define do
  factory :weather_widget do
    lat { Faker::Address.latitude }
    long { Faker::Address.longitude }
    position { generate(:position) }
    website_config
  end
end
