FactoryBot.define do
  factory :website_config do
    title_color { "MyString" }
    background_color { "MyString" }

    transient do
      text_widget_count { 10 }
      video_widget_count { 2 }
    end

    after(:build) do |website_config, evaluator|
      website_config.title_widget ||= build(:title_widget, website_config: website_config)
      website_config.calendar_widget ||= build(:calendar_widget, website_config: website_config)
      website_config.weather_widget ||= build(:weather_widget, website_config: website_config)
      website_config.text_widgets << build_list(:text_widget, evaluator.text_widget_count, website_config: website_config)
      website_config.video_widgets << build_list(:video_widget, evaluator.video_widget_count, website_config: website_config)
    end
  end
end
