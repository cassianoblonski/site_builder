require 'rails_helper'

RSpec.describe WeatherWidget, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:website_config) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:lat) }
    it { is_expected.to validate_presence_of(:long) }
    it { is_expected.to validate_presence_of(:position) }
  end
end
