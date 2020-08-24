FactoryBot.define do
  factory :text_widget do
    title { "MyString" }
    content { "MyString" }
    background_color { "MyString" }
    position { 1 }
    website_config
  end
end
