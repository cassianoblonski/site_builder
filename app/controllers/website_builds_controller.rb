class WebsiteBuildsController < ActionController::Base
  def index
    @website_build = WebsiteBuild.last
  end
end
