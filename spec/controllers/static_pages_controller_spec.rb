require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  context 'home action' do
    it 'should home page be the root page' do
      expect(get: root_url).to route_to(
        controller: 'static_pages',
        action: 'home'
      )
    end

    it 'should render template home' do
      get :home

      expect(response).to render_template('home')
    end
  end
end
