class WeatherWidget < ApplicationRecord
  belongs_to :website_config

  validates :lat, :long, :position, presence: true
end
