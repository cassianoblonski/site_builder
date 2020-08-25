class WebsiteConfig < ApplicationRecord
  extend Enumerize

  has_one  :calendar_widget, dependent: :destroy
  has_one  :weather_widget,  dependent: :destroy
  has_many :text_widgets,    dependent: :destroy
  has_many :video_widgets,   dependent: :destroy

  validates :site_name, :title_color, :background_color, :banner_background_color, :icon_url, presence: true

  enumerize :job_status, in: %w[queued working complete failed], scope: :shallow

  accepts_nested_attributes_for :calendar_widget
  accepts_nested_attributes_for :weather_widget
  accepts_nested_attributes_for :text_widgets
  accepts_nested_attributes_for :video_widgets

  def widgets
    associations = []
    WebsiteConfig.reflect_on_all_associations.map(&:name).each do |assoc|
      association = send assoc
      associations << association if association.present?
    end
    associations.flatten.sort_by(&:position)
  end
end
