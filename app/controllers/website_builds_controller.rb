class WebsiteBuildsController < ApplicationController
  include WebsiteBuildsHelper


  def index
    @website_build = WebsiteBuild.last
  end
end
