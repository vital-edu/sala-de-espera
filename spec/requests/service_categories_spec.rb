require 'rails_helper'

RSpec.describe 'ServiceCategories', type: :request do
  before(:each) do
    allow_any_instance_of(CanCan::ControllerResource).to receive(
      :load_and_authorize_resource
    ) { nil }
  end

  describe 'GET /service_categories' do
    it 'works! (now write some real specs)' do
      get service_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
