class BuildWebsiteHtmlJob < ApplicationJob
  queue_as :default

  def perform(website_config)
    website_config.update(job_status: 'JOB Inicializou')

    website_build = WebsiteBuild.last
    website_build.update(html: render_website(website_config))

    website_config.update(job_status: 'JOB Terminou')
  end

  def render_website(website_config)
    view = ActionView::Base.new(ActionController::Base.view_paths, {})
    view.class_eval {include WebsiteBuildsHelper}
    view.render(
      file: 'website_builds/website_template.html.erb',
      layout: false,
      locals: { website_config: website_config }
    )
  end
end
