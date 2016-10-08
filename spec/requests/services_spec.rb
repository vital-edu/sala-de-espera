require 'rails_helper'

RSpec.describe "Services", type: :request do

  before(:each) do
    allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource){ nil }
  end

  describe "GET /services" do
    it "works! (now write some real specs)" do
      allow_any_instance_of(ServicesController). to receive(:current_user) { build(:employee) }
      get services_path
      expect(response).to have_http_status(200)
    end
  end
end
