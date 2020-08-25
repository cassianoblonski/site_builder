namespace :build do
  desc "Build an older WebsiteConfig"
  task :older_website_config, [:website_config_id] => [:environment] do |task, args|
    puts 'Build for Website Config id:27 is running'
    website_config = WebsiteConfig.find(args[:website_config_id])
    BuildWebsiteHtmlJob.perform_now(website_config)
  end
end
