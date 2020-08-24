class TitleWidget < ApplicationRecord
  belongs_to :website_config

  validates :site_name, :icon_slug, :background_color, presence: true
end
