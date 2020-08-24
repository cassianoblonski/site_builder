FactoryBot.define do
  factory :website_config do
    site_name               { "MyString" }
    title_color             { "#000" }
    background_color        { "#fff" }
    banner_background_color { "#f00" }
    icon_url                { "https://icon-library.com/images/icon-favicon/icon-favicon-4.jpg" }

    transient do
      text_widget_count { 10 }
      video_widget_count { 2 }
    end

    after(:build) do |website_config, evaluator|
      website_config.calendar_widget ||= build(:calendar_widget, website_config: website_config)
      website_config.weather_widget  ||= build(:weather_widget, website_config: website_config)
      website_config.text_widgets    <<  build_list(:text_widget, evaluator.text_widget_count, website_config: website_config)
      website_config.video_widgets   <<  build_list(:video_widget, evaluator.video_widget_count, website_config: website_config)
    end

    after(:create) do
      FactoryBot.rewind_sequences
    end
  end
end

FactoryBot.define do
  sequence :position do |n|
    n
  end
end
