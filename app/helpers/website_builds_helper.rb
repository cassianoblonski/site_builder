# frozen_string_literal: true

module WebsiteBuildsHelper
  def render_widget(widget)
    send("render_#{widget.class.model_name.param_key}", widget)
  end

  def render_title_banner(website_config)
    content_tag :div, id: 'title_banner', style: "background-color: #{website_config.banner_background_color};" do
      content_tag(:h1,
        image_tag(website_config.icon_url, size: "30x30", alt: "Website Icon") +
        website_config.site_name)
    end
  end

  private

    def render_calendar_widget(widget)
      content_tag(:div, id: 'calendar-widget')do
        content_tag(:h3, widget.title) +
        content_tag(:div, widget.day, data: { day: widget.day})
      end
    end

    def render_weather_widget(widget)
      content_tag(:div, nil, id: 'weather-widget', data: { latitude: widget.lat ,longitude: widget.long })
    end

    def render_text_widget(widget)
      content_tag :div, id: 'text-widget', style: "background-color: #{widget.background_color};" do
        content_tag(:h3, widget.title) +
        content_tag(:span, widget.content)
      end
    end

    def render_video_widget(widget)
      content_tag(:div, id: 'video-widget') do
        content_tag(:h3, widget.title) +
        video_tag(widget.url, controls: true, )
      end
    end
end
