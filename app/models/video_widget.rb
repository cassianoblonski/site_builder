class VideoWidget < ApplicationRecord
  belongs_to :website_config

  validates :url, :title, :position, presence: true
  validate :video_widgets_count_within_limit, on: :create

  def video_widgets_count_within_limit
    if website_config && website_config.video_widgets.count >= 2
      errors.add(:website_config, "Exceeded video widgets limit of 2")
    end
  end
end
