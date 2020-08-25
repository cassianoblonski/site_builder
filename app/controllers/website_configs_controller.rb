class WebsiteConfigsController < ApplicationController
  def index
    @website_configs = WebsiteConfig.all
  end

  def show
    @website_config = WebsiteConfig.find(params[:id])

    render json: {
        website_config_id: @website_config.id,
        job_status: @website_config.job_status,
      }, status: :ok
  end

  def create
    @website_config = WebsiteConfig.new(website_config_params)
    @website_config.job_status = 'Na Fila'

    if @website_config.save
      job = BuildWebsiteHtmlJob.set(wait: 0.seconds).perform_later(@website_config)
      jid = job.provider_job_id

      render json: {
        website_config_id: @website_config.id,
        job_status: @website_config.job_status,
        job_id: jid
      }, status: :created
    else
      render json: @website_config.errors, status: :unprocessable_entity
    end
  end

  private
    def website_config_params
      params.require(:website_config).permit(:title_color, :background_color, :site_name, :icon_url, :banner_background_color,
        calendar_widget_attributes: [ :title, :day, :position ],
        weather_widget_attributes:  [ :lat, :long, :position ],
        text_widgets_attributes:    [ :title, :content, :background_color, :position ],
        video_widgets_attributes:   [ :url, :title, :position ]
      )
    end
end
