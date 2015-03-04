require 'rails_helper'

RSpec.describe "Locations", :type => :request do
  describe "GET /locations" do
    
    context "API" do
      before :each do
        get "/locations", {}, { "Accept" => "application/json" }
      end
      
      let(:body) { JSON.parse(response.body) }

      it "works!" do
        expect(response).to have_http_status(200)
      end
      
      it "should have a top-level key named locations" do
        expect(body["locations"]).not_to be_nil
      end

      it "should return an array of locations" do
        expect(body["locations"]).to be_an Array
      end
        
      context "when locations exist" do
        before :all do 
          4.times { FactoryGirl.create :location }
        end
      
        it "should have four locations" do
          expect(body["locations"].count).to eq 4
        end
        
        it "should have the necessary data in the entries" do
          expect(body["locations"][0]).to include("id", "name", "latitude", "longitude", "created_at", "updated_at")
        end
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
