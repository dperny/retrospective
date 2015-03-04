require 'rails_helper'

RSpec.describe "Locations", :type => :request do
  describe "GET /locations" do
    context "API" do

      before :each do
        4.times do FactoryGirl.create :location end
        get "/locations", {}, { "Accept" => "application/json" }
      end

      it "works!" do
        expect(response).to have_http_status(200)
      end

      it "should have a top-level key named data" do
        body = JSON.parse(response.body)
        expect(body.data).to exist
      end

      it "should return a list of locations" do
        get "/locations", {}, { "Accept" => "application/json" }

        body = JSON.parse(response.body)
        expect(body.data.locations.count).to eq 4
      end
    end
  end

  describe "GET /locations/:id" do

  end

  describe "GET /locations/:id/stories" do
    context "the location exists" do
      
    end

    context "the location does not exist" do
      it "should return a 404" do
        get "/locations/1/stories", {}, { "Accept" => "application/json" }

        expect(response).to have_http_status(404)
      end
    end
  end
end
