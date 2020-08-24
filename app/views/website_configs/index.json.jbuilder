json.cache! [@website_configs], expires_in: 10.minutes do
  json.array! @website_configs, partial: "website_configs/website_config", as: :website_config
end

