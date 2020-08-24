class TextWidget < ApplicationRecord
  belongs_to :website_config

  validates :title, :content, :background_color, :position, presence: true
  validate :text_widgets_count_within_limit, on: :create

  def text_widgets_count_within_limit
    if website_config && website_config.text_widgets.count >= 10
      errors.add(:website_config, "Exceeded text widgets limit of 10")
    end
  end
end
