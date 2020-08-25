json.extract! website_config, :id, :site_name, :title_color, :background_color, :banner_background_color, :icon_url, :created_at, :updated_at

json.calendar_widget website_config.calendar_widget, :title, :day, :position if website_config.calendar_widget.present?
json.weather_widget website_config.weather_widget, :lat, :long, :position if website_config.weather_widget.present?
json.text_widgets website_config.text_widgets, :title, :content, :background_color, :position if website_config.text_widgets.present?
json.video_widgets website_config.video_widgets, :url, :title, :position if website_config.video_widgets.present?
