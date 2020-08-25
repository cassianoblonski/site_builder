require 'rails_helper'

RSpec.describe WebsiteConfig, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:weather_widget) }
    it { is_expected.to have_one(:calendar_widget) }
    it { is_expected.to have_many(:text_widgets) }
    it { is_expected.to have_many(:video_widgets) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:site_name) }
    it { is_expected.to validate_presence_of(:title_color) }
    it { is_expected.to validate_presence_of(:background_color) }
    it { is_expected.to validate_presence_of(:banner_background_color) }
    it { is_expected.to validate_presence_of(:icon_url) }

    describe 'job_status enum' do
      it { is_expected.to enumerize(:job_status).in(%w[queued working complete failed]) }
    end

    describe 'limit of text widgets' do
      let!(:website_config) { create :website_config, text_widget_count: 10 }
      subject(:eleventh_text_widget) { build :text_widget, website_config: website_config }

      context 'when trying to create a eleventh text widget' do
        it 'returns invalid' do
          eleventh_text_widget.valid?

          expect(eleventh_text_widget).to be_invalid
        end

        it 'returns message Exceeded text widgets limit' do
          eleventh_text_widget.valid?

          expect(eleventh_text_widget.errors[:website_config]).to eq(['Exceeded text widgets limit of 10'])
        end
      end
    end

    describe 'limit of video widgets' do
      let!(:website_config)    { create :website_config, video_widget_count: 2 }
      let(:third_video_widget) { build :video_widget, website_config: website_config }

      context 'when trying to create a third video widget' do
        it 'returns invalid' do
          third_video_widget.valid?

          expect(third_video_widget).to be_invalid
        end

        it 'returns message Exceeded video widgets limit' do
          third_video_widget.valid?

          expect(third_video_widget.errors[:website_config]).to eq(['Exceeded video widgets limit of 2'])
        end
      end
    end
  end
end
