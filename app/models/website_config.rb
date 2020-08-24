class WebsiteConfig < ApplicationRecord
  has_one  :title_widget,    dependent: :destroy
  has_one  :calendar_widget, dependent: :destroy
  has_one  :weather_widget,  dependent: :destroy
  has_many :text_widgets,    dependent: :destroy
  has_many :video_widgets,   dependent: :destroy

  validates :background_color, :title_color, presence: true

  accepts_nested_attributes_for :title_widget
  accepts_nested_attributes_for :calendar_widget
  accepts_nested_attributes_for :weather_widget
  accepts_nested_attributes_for :text_widgets
  accepts_nested_attributes_for :video_widgets
end
