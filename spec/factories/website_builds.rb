FactoryBot.define do
  factory :website_build do
    html {
      "<!DOCTYPE html>\n\n<html>\n  <head>\n    <title>website_config.site_name</title>\n\n    <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"https://icon-library.com/images/icon-favicon/icon-favicon-4.jpg\" />\n  </head>\n\n  <body>\n    <div id=\"title_banner\" style=\"background-color: #f00;\"><h1><img alt=\"Website Icon\" src=\"https://icon-library.com/images/icon-favicon/icon-favicon-4.jpg\" width=\"30\" height=\"30\" />My Site Builder</h1></div>\n\n  </body>\n</html>\n"
    }
  end
end
