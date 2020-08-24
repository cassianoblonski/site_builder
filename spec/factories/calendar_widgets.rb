FactoryBot.define do
  factory :calendar_widget do
    title { "My Calendar" }
    day { Date.today }
    position { 1 }
    website_config
  end
end
