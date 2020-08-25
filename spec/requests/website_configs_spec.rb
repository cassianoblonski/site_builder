require 'rails_helper'

RSpec.describe "/website_configs", type: :request do
  let(:valid_attributes) {
    attributes_for(:website_config)
  }

  let(:invalid_attributes) {
    attributes_for(:website_config, site_name: nil)
  }

  describe "GET /index" do
    let!(:website_config) { create :website_config }

    it "renders a successful response" do
      get website_configs_url, as: :json
      expect(response).to be_successful
    end

    context 'with queued status' do
      let!(:website_config) { create :website_config, job_status: 'queued'}

      it 'returns website_config job status' do
        get website_configs_url, as: :json
        expect(response.body).to eq("{\"job_status\":\"queued\"}")
      end
    end

    context 'with working status' do
      let!(:website_config) { create :website_config, job_status: 'working'}

      it 'returns website_config job status' do
        get website_configs_url, as: :json
        expect(response.body).to eq("{\"job_status\":\"working\"}")
      end
    end

    context 'with complete status' do
      let!(:website_config) { create :website_config, job_status: 'complete'}

      it 'returns website_config job status' do
        get website_configs_url, as: :json
        expect(response.body).to eq("{\"job_status\":\"complete\"}")
      end
    end

    context 'with failed status' do
      let!(:website_config) { create :website_config, job_status: 'failed'}

      it 'returns website_config job status' do
        get website_configs_url, as: :json
        expect(response.body).to eq("{\"job_status\":\"failed\"}")
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      subject(:post_website_config) { post website_configs_url, params: { website_config: valid_attributes }, as: :json }

      it "creates a new WebsiteConfig" do
        expect{ post_website_config }.to change(WebsiteConfig, :count).by(1)
      end

      it "has have_http_status unprocessable_entity" do
        post_website_config
        expect(response).to have_http_status(:created)
      end

      it "renders a JSON response with the new website_config" do
        post_website_config

        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      subject(:post_website_config) { post website_configs_url, params: { website_config: invalid_attributes }, as: :json }
      it "does not create a new WebsiteConfig" do
        expect { post_website_config }.to change(WebsiteConfig, :count).by(0)
      end

      it "has have_http_status unprocessable_entity" do
        post_website_config
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "renders a JSON response with errors for the new website_config" do
        post_website_config
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end
end
