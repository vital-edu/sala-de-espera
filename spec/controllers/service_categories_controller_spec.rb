require 'rails_helper'

RSpec.describe ServiceCategoriesController, type: :controller do
  before(:each) do
    allow_any_instance_of(CanCan::ControllerResource).to receive(:load_and_authorize_resource) { nil }
  end

  describe 'GET #index' do
    it 'assigns all service_categories as @service_categories' do
      service_category = create(:service_category)
      get :index
      expect(assigns(:service_categories)).to eq([service_category])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested service_category as @service_category' do
      service_category = create(:service_category)
      get :show, params: { id: service_category.id }
      expect(assigns(:service_category)).to eq(service_category)
    end
  end

  describe 'GET #new' do
    it 'assigns a new service_category as @service_category' do
      get :new
      expect(assigns(:service_category)).to be_a_new(ServiceCategory)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested service_category as @service_category' do
      service_category = create(:service_category)
      get :edit, params: { id: service_category.id }
      expect(assigns(:service_category)).to eq(service_category)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new ServiceCategory' do
        expect do
          post :create, params: { service_category: attributes_for(:service_category) }
        end.to change(ServiceCategory, :count).by(1)
      end

      it 'assigns a newly created service_category as @service_category' do
        post :create, params: { service_category: attributes_for(:service_category) }
        expect(assigns(:service_category)).to be_a(ServiceCategory)
        expect(assigns(:service_category)).to be_persisted
      end

      it 'redirects to the created service_category' do
        post :create, params: { service_category: attributes_for(:service_category) }
        expect(response).to redirect_to(ServiceCategory.last)
      end
    end

    context 'with invalid params' do
      before(:each) do
        @invalid_attributes = attributes_for(:service_category)
        @invalid_attributes[:name] = ''
      end

      it 'assigns a newly created but unsaved service_category as @service_category' do
        post :create, params: { service_category: @invalid_attributes }
        expect(assigns(:service_category)).to be_a_new(ServiceCategory)
      end

      it "re-renders the 'new' template" do
        post :create, params: { service_category: @invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested service_category' do
        service_category = create(:service_category)
        new_attributes = attributes_for(:service_category)
        new_attributes[:description] = 'Nova descrição do serviço'
        put :update, params: { id: service_category.id, service_category: new_attributes }
        expect(ServiceCategory.find(service_category.id).description).to eq(new_attributes[:description])
      end

      it 'assigns the requested service_category as @service_category' do
        service_category = create(:service_category)
        put :update, params: {
          id: service_category.id,
          service_category: attributes_for(:service_category)
        }
        expect(assigns(:service_category)).to eq(service_category)
      end

      it 'redirects to the service_category' do
        service_category = create(:service_category)
        put :update, params: {
          id: service_category.id,
          service_category: attributes_for(:service_category)
        }
        expect(response).to redirect_to(service_category)
      end
    end

    context 'with invalid params' do
      before(:each) do
        @invalid_attributes = attributes_for(:service_category)
        @invalid_attributes[:name] = ''
      end

      it 'assigns the service_category as @service_category' do
        service_category = create(:service_category)
        put :update, params: { id: service_category.id, service_category: @invalid_attributes }
        expect(assigns(:service_category)).to eq(service_category)
      end

      it "re-renders the 'edit' template" do
        service_category = create(:service_category)
        put :update, params: { id: service_category.id, service_category: @invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested service_category' do
      service_category = create(:service_category)
      expect do
        delete :destroy, params: { id: service_category.id }
      end.to change(ServiceCategory, :count).by(-1)
    end

    it 'redirects to the service_categories list' do
      service_category = create(:service_category)
      delete :destroy, params: { id: service_category.id }
      expect(response).to redirect_to(service_categories_url)
    end
  end
end
