require 'rails_helper'

RSpec.describe TitleWidget, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:website_config) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:site_name) }
    it { is_expected.to validate_presence_of(:icon_slug) }
    it { is_expected.to validate_presence_of(:background_color) }
  end
end
