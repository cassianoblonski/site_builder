FactoryBot.define do
  factory :weather_widget do
    lat { Faker::Address.latitude }
    long { Faker::Address.longitude }
    position { 1 }
    website_config
  end
end
