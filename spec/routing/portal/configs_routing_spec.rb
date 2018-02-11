require "rails_helper"

RSpec.describe Portal::ConfigsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/portal/configs").to route_to("portal/configs#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/configs/new").to route_to("portal/configs#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/configs/1").to route_to("portal/configs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/configs/1/edit").to route_to("portal/configs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/portal/configs").to route_to("portal/configs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/configs/1").to route_to("portal/configs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/configs/1").to route_to("portal/configs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/configs/1").to route_to("portal/configs#destroy", :id => "1")
    end

  end
end
