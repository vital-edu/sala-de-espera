require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  before(:each) do
    allow_any_instance_of(
      CanCan::ControllerResource
    ).to receive(:load_and_authorize_resource) { nil }
  end

  describe 'GET #index' do
    it 'assigns all services as @services' do
      service = create(:service)
      allow_any_instance_of(ServicesController).to receive(:current_user) {
        service.employee
      }
      get :index
      expect(assigns(:services)).to eq([service])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested service as @service' do
      service = create(:service)
      get :show, params: { id: service.to_param }
      expect(assigns(:service)).to eq(service)
    end
  end

  describe 'GET #new' do
    it 'assigns a new service as @service' do
      get :new
      expect(assigns(:service)).to be_a_new(Service)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested service as @service' do
      service = create(:service)
      get :edit, params: { id: service.to_param }
      expect(assigns(:service)).to eq(service)
    end
  end

  describe 'POST #create' do
    before(:each) do
      @service = build(:service)
      allow_any_instance_of(ServicesController).to receive(:current_user) {
        @service.employee
      }
    end

    context 'with valid params' do
      it 'creates a new Service' do
        expect do
          post :create, params: { service: @service.attributes }
        end.to change(Service, :count).by(1)
      end

      it 'assigns a newly created service as @service' do
        post :create, params: { service: @service.attributes }
        expect(assigns(:service)).to be_a(Service)
        expect(assigns(:service)).to be_persisted
      end

      it 'redirects to the created service' do
        post :create, params: { service: @service.attributes }
        expect(response).to redirect_to(Service.last)
      end
    end

    context 'with invalid params' do
      before(:each) do
        @invalid_attributes = @service.attributes
        @invalid_attributes['scheduled_time'] = Time.current
      end

      it 'assigns a newly created but unsaved service as @service' do
        post :create, params: { service: @invalid_attributes }
        expect(assigns(:service)).to be_a_new(Service)
      end

      it "re-renders the 'new' template" do
        post :create, params: { service: @invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      before(:each) do
        @service = create(:service)
        allow_any_instance_of(ServicesController).to receive(:current_user) {
          @service.employee
        }
        @new_attributes = @service.attributes
        @new_attributes['client_id'] = nil
      end

      it 'updates the requested service' do
        put :update, params: {
          id: @service.to_param,
          service: @new_attributes
        }
        expect(assigns(:service).client_id).to eq(@new_attributes['client_id'])
      end

      it 'assigns the requested service as @service' do
        put :update, params: {
          id: @service.to_param,
          service: @new_attributes
        }
        expect(assigns(:service)).to eq(@service)
      end

      it 'redirects to the service' do
        put :update, params: {
          id: @service.to_param,
          service: @new_attributes
        }
        expect(response).to redirect_to(@service)
      end
    end

    context 'with invalid params' do
      before(:each) do
        @service = create(:service)
        allow_any_instance_of(ServicesController).to receive(:current_user) {
          @service.employee
        }
        @invalid_attributes = @service.attributes
        @invalid_attributes['scheduled_time'] = Time.current
      end

      it 'assigns the service as @service' do
        put :update, params: {
          id: @service.to_param,
          service: @invalid_attributes
        }
        expect(assigns(:service)).to eq(@service)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {
          id: @service.to_param,
          service: @invalid_attributes
        }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested service' do
      service = create(:service)
      expect do
        delete :destroy, params: { id: service.to_param }
      end.to change(Service, :count).by(-1)
    end

    it 'redirects to the services list' do
      service = create(:service)
      delete :destroy, params: { id: service.to_param }
      expect(response).to redirect_to(services_url)
    end
  end
end
