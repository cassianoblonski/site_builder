class WebsiteConfigsController < ApplicationController
  before_action :set_website_config, only: [:show, :update, :destroy]

  def index
    @website_configs = WebsiteConfig.all
  end

  def show
  end

  def create
    @website_config = WebsiteConfig.new(website_config_params)

    if @website_config.save
      job = BuildWebsiteHtmlJob.set(wait: 5.seconds).perform_later(@website_config)
      jid = job.provider_job_id

      render json: jid, status: :created
    else
      render json: @website_config.errors, status: :unprocessable_entity
    end
  end

  def update
    if @website_config.update(website_config_params)
      render :show, status: :ok, location: @website_config
    else
      render json: @website_config.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @website_config.destroy
  end

  private
    def set_website_config
      @website_config = WebsiteConfig.find(params[:id])
    end

    def website_config_params
      params.require(:website_config).permit(:title_color, :background_color,
        title_widget_attributes:    [ :site_name, :icon_slug, :background_color ],
        calendar_widget_attributes: [ :title, :day, :position ],
        weather_widget_attributes:  [ :lat, :long, :position ],
        text_widgets_attributes:    [ :title, :content, :background_color, :position ],
        video_widgets_attributes:   [ :url, :title, :position ]
      )
    end
end
