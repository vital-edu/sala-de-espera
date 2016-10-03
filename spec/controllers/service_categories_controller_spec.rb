require 'rails_helper'

RSpec.describe ServiceCategoriesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ServiceCategory. As you add validations to ServiceCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip({ :name, :description, :price, :image })
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ServiceCategoriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all service_categories as @service_categories" do
      service_category = ServiceCategory.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:service_categories)).to eq([service_category])
    end
  end

  describe "GET #show" do
    it "assigns the requested service_category as @service_category" do
      service_category = ServiceCategory.create! valid_attributes
      get :show, params: {id: service_category.to_param}, session: valid_session
      expect(assigns(:service_category)).to eq(service_category)
    end
  end

  describe "GET #new" do
    it "assigns a new service_category as @service_category" do
      get :new, params: {}, session: valid_session
      expect(assigns(:service_category)).to be_a_new(ServiceCategory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested service_category as @service_category" do
      service_category = ServiceCategory.create! valid_attributes
      get :edit, params: {id: service_category.to_param}, session: valid_session
      expect(assigns(:service_category)).to eq(service_category)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ServiceCategory" do
        expect {
          post :create, params: {service_category: valid_attributes}, session: valid_session
        }.to change(ServiceCategory, :count).by(1)
      end

      it "assigns a newly created service_category as @service_category" do
        post :create, params: {service_category: valid_attributes}, session: valid_session
        expect(assigns(:service_category)).to be_a(ServiceCategory)
        expect(assigns(:service_category)).to be_persisted
      end

      it "redirects to the created service_category" do
        post :create, params: {service_category: valid_attributes}, session: valid_session
        expect(response).to redirect_to(ServiceCategory.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved service_category as @service_category" do
        post :create, params: {service_category: invalid_attributes}, session: valid_session
        expect(assigns(:service_category)).to be_a_new(ServiceCategory)
      end

      it "re-renders the 'new' template" do
        post :create, params: {service_category: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested service_category" do
        service_category = ServiceCategory.create! valid_attributes
        put :update, params: {id: service_category.to_param, service_category: new_attributes}, session: valid_session
        service_category.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested service_category as @service_category" do
        service_category = ServiceCategory.create! valid_attributes
        put :update, params: {id: service_category.to_param, service_category: valid_attributes}, session: valid_session
        expect(assigns(:service_category)).to eq(service_category)
      end

      it "redirects to the service_category" do
        service_category = ServiceCategory.create! valid_attributes
        put :update, params: {id: service_category.to_param, service_category: valid_attributes}, session: valid_session
        expect(response).to redirect_to(service_category)
      end
    end

    context "with invalid params" do
      it "assigns the service_category as @service_category" do
        service_category = ServiceCategory.create! valid_attributes
        put :update, params: {id: service_category.to_param, service_category: invalid_attributes}, session: valid_session
        expect(assigns(:service_category)).to eq(service_category)
      end

      it "re-renders the 'edit' template" do
        service_category = ServiceCategory.create! valid_attributes
        put :update, params: {id: service_category.to_param, service_category: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested service_category" do
      service_category = ServiceCategory.create! valid_attributes
      expect {
        delete :destroy, params: {id: service_category.to_param}, session: valid_session
      }.to change(ServiceCategory, :count).by(-1)
    end

    it "redirects to the service_categories list" do
      service_category = ServiceCategory.create! valid_attributes
      delete :destroy, params: {id: service_category.to_param}, session: valid_session
      expect(response).to redirect_to(service_categories_url)
    end
  end

end
