class CalendarWidget < ApplicationRecord
  belongs_to :website_config

  validates :title, :day, :position, presence: true
end
