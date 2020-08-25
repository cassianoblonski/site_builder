require 'rails_helper'

RSpec.describe "/website_builds", type: :request do
  let(:valid_attributes) {
    attributes_for(:website_build)
  }

  let(:invalid_attributes) {
    attributes_for(:website_build, site_name: nil)
  }

  describe "GET /index" do
    let!(:website_build) { create :website_build }
    let!(:website_config) { create :website_config, site_name: 'Site Builder 42', text_widget_count: 2 }

    it "renders a successful response" do
      get website_builds_url
      expect(response).to be_successful
    end

    it "returns html" do
      BuildWebsiteHtmlJob.perform_now(website_config)
      get website_builds_url

      expect(response.body).to include("<title>website_config.site_name</title>") &
                               include("<link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"#{website_config.icon_url}\" />") &
                               include("<div style=\"background-color:#{website_config.background_color}\">") &
                               include("<div id=\"title_banner\" style=\"background-color: #{website_config.banner_background_color};\">") &
                               include("<img alt=\"Website Icon\" src=\"https://icon-library.com/images/icon-favicon/icon-favicon-4.jpg\" width=\"30\" height=\"30\" />") &
                               include("Site Builder 42") &
                               include("<div id=\"calendar-widget\">") &
                               include("<h3>#{website_config.calendar_widget.title}</h3>") &
                               include("<div data-day=\"&quot;#{website_config.calendar_widget.day}&quot;\">#{website_config.calendar_widget.day}") &
                               include("<div id=\"weather-widget\" data-latitude=\"#{website_config.weather_widget.lat}\" data-longitude=\"#{website_config.weather_widget.long}\">") &
                               include("<div id=\"video-widget\"><h3>#{website_config.video_widgets.first.title}") &
                               include("<video controls=\"controls\" src=\"#{website_config.video_widgets.first.url}\">") &
                               include("<div id=\"video-widget\"><h3>#{website_config.video_widgets.second.title}") &
                               include("<video controls=\"controls\" src=\"#{website_config.video_widgets.second.url}\">")&
                               include("<div id=\"text-widget\" style=\"background-color: #{website_config.text_widgets.first.background_color};\"><h3>#{website_config.text_widgets.first.title}") &
                               include("<span>#{website_config.text_widgets.first.content}</span>")
                               include("<div id=\"text-widget\" style=\"background-color: #{website_config.text_widgets.second.background_color};\"><h3>#{website_config.text_widgets.second.title}") &
                               include("<span>#{website_config.text_widgets.second.content}</span>")
    end

    it "returns content type html" do
      get website_builds_url
      expect(response.content_type).to include("text/html; charset=utf-8")
    end
  end
end
