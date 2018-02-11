require "rails_helper"

RSpec.describe Portal::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/portal/users").to route_to("portal/users#index")
    end

    it "routes to #new" do
      expect(:get => "/portal/users/new").to route_to("portal/users#new")
    end

    it "routes to #show" do
      expect(:get => "/portal/users/1").to route_to("portal/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portal/users/1/edit").to route_to("portal/users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/portal/users").to route_to("portal/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portal/users/1").to route_to("portal/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portal/users/1").to route_to("portal/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portal/users/1").to route_to("portal/users#destroy", :id => "1")
    end

  end
end
