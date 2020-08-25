Rails.application.routes.draw do
  resources :website_builds
  resources :calendar_widgets
  resources :video_widgets
  resources :weather_widgets
  resources :text_widgets
  resources :website_configs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
