require 'rails_helper'

RSpec.describe VideoWidget, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:website_config) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:position) }
  end
end
