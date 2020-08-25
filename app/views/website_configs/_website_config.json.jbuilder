json.extract! website_config, :id, :title_color, :background_color, :created_at, :updated_at
json.url website_config_url(website_config, format: :json)

json.title_widget website_config.title_widget, :site_name, :icon_slug, :background_color if website_config.title_widget.present?
json.calendar_widget website_config.calendar_widget, :title, :day, :position if website_config.calendar_widget.present?
json.weather_widget website_config.weather_widget, :lat, :long, :position if website_config.weather_widget.present?
json.text_widgets website_config.text_widgets, :title, :content, :background_color, :position if website_config.text_widgets.present?
json.video_widgets website_config.video_widgets, :url, :title, :position if website_config.video_widgets.present?
