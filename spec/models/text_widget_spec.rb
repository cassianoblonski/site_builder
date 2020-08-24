require 'rails_helper'

RSpec.describe TextWidget, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:website_config) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:background_color) }
    it { is_expected.to validate_presence_of(:position) }
  end
end
