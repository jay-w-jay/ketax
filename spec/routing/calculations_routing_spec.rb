require "rails_helper"

RSpec.describe CalculationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/calculations").to route_to("calculations#index")
    end

    it "routes to #new" do
      expect(get: "/calculations/new").to route_to("calculations#new")
    end

    it "routes to #show" do
      expect(get: "/calculations/1").to route_to("calculations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/calculations/1/edit").to route_to("calculations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/calculations").to route_to("calculations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/calculations/1").to route_to("calculations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/calculations/1").to route_to("calculations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/calculations/1").to route_to("calculations#destroy", id: "1")
    end
  end
end
