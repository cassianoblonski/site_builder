require 'rails_helper'

RSpec.describe "/website_builds", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      WebsiteBuild.create! valid_attributes
      get website_builds_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      website_build = WebsiteBuild.create! valid_attributes
      get website_build_url(website_build), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new WebsiteBuild" do
        expect {
          post website_builds_url,
               params: { website_build: valid_attributes }, headers: valid_headers, as: :json
        }.to change(WebsiteBuild, :count).by(1)
      end

      it "renders a JSON response with the new website_build" do
        post website_builds_url,
             params: { website_build: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new WebsiteBuild" do
        expect {
          post website_builds_url,
               params: { website_build: invalid_attributes }, as: :json
        }.to change(WebsiteBuild, :count).by(0)
      end

      it "renders a JSON response with errors for the new website_build" do
        post website_builds_url,
             params: { website_build: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested website_build" do
        website_build = WebsiteBuild.create! valid_attributes
        patch website_build_url(website_build),
              params: { website_build: invalid_attributes }, headers: valid_headers, as: :json
        website_build.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the website_build" do
        website_build = WebsiteBuild.create! valid_attributes
        patch website_build_url(website_build),
              params: { website_build: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq("application/json")
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the website_build" do
        website_build = WebsiteBuild.create! valid_attributes
        patch website_build_url(website_build),
              params: { website_build: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested website_build" do
      website_build = WebsiteBuild.create! valid_attributes
      expect {
        delete website_build_url(website_build), headers: valid_headers, as: :json
      }.to change(WebsiteBuild, :count).by(-1)
    end
  end
end
