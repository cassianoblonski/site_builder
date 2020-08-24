json.cache! [@website_config], expires_in: 10.minutes do
  json.partial! "website_configs/website_config", website_config: @website_config
end
