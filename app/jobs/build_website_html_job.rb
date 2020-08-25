class BuildWebsiteHtmlJob < ApplicationJob
  queue_as :default

  def perform(website_config)
    website_build = WebsiteBuild.last
    website_build.update(html: render_website(website_config))
  end

  def render_website(website_config)
    rendered_string = ApplicationController.render(
      template: 'website_builds/website_template.html.erb',
      assigns: { website_config: website_config }
    )
  end
end
