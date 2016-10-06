require 'rails_helper'

RSpec.describe EmployeesController, type: :controller do

  describe "GET #index" do
    it "assigns all employees as @employees" do
      employee = create(:employee)
      get :index
      expect(assigns(:employees)).to eq([employee])
    end
  end

  describe "GET #show" do
    it "assigns the requested employee as @employee" do
      employee = create(:employee)
      get :show, params: {id: employee.to_param}
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "GET #new" do
    it "assigns a new employee as @employee" do
      get :new, params: {}
        expect(assigns(:employee)).to be_a_new(User)
    end
  end

  describe "GET #edit" do
    it "assigns the requested employee as @employee" do
      employee = create(:employee)
      get :edit, params: {id: employee.id}
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Employee" do
        expect {
          post :create, params: {user: attributes_for(:employee)}
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created employee as @employee" do
        post :create, params: {user: attributes_for(:employee)}
        expect(assigns(:employee)).to be_a(User)
        expect(assigns(:employee)).to be_persisted
      end

      it "redirects to the employee index" do
        post :create, params: {user: attributes_for(:employee)}
        expect(response).to redirect_to(employees_url)
      end
    end

    context "with invalid params" do
      before(:each) do
        @invalid_attributes = attributes_for(:employee)
        @invalid_attributes[:name] = ""
      end

      it "assigns a newly created but unsaved employee as @employee" do
        post :create, params: {user: @invalid_attributes}
        expect(assigns(:employee)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, params: {user: @invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the requested employee" do
        employee = create(:employee)
        new_attributes = attributes_for(:employee)
        new_attributes[:name] = "Oshua"
        put :update, params: {id: employee.id, user: new_attributes}
        expect(User.find(employee.id).email).to eq(new_attributes[:email])
      end

      it "assigns the requested employee as @employee" do
        employee = create(:employee)
        put :update, params: {id: employee.id, user: attributes_for(:employee)}
        expect(assigns(:employee)).to eq(employee)
      end

      it "redirects to the employee index" do
        employee = create(:employee)
        put :update, params: {id: employee.id, user: attributes_for(:employee)}
        expect(response).to redirect_to(employees_url)
      end
    end

    context "with invalid params" do
      before(:each) do
        @invalid_attributes = attributes_for(:employee)
        @invalid_attributes[:name] = ""
      end

      it "assigns the employee as @employee" do
        employee = create(:employee)
        put :update, params: {id: employee.id, user: @invalid_attributes}
        expect(assigns(:employee)).to eq(employee)
      end

      it "re-renders the 'edit' template" do
        employee = create(:employee)
        put :update, params: {id: employee.id, user: @invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested employee" do
      employee = create(:employee)
      expect {
        delete :destroy, params: {id: employee.id}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = create(:employee)
      delete :destroy, params: {id: employee.id}
      expect(response).to redirect_to(employees_url)
    end
  end
end
