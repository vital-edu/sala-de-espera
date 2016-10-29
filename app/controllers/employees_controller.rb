class EmployeesController < ApplicationController
  before_action :set_employee, only: %i(show edit update destroy)
  # load_and_authorize_resource

  def index
    @employees = User.joins(:roles).where(roles: { name: 'employee' })
  end

  def show
  end

  def new
    @employee = User.new
  end

  def edit
  end

  def create
    @employee = User.new(employee_params)
    @employee.add_role :employee
    @employee.password = Devise.friendly_token.first(32)

    respond_to do |format|
      if @employee.save(context: :employee)
        format.html { redirect_to employees_url, notice: 'Funcionário criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employees_url, notice: 'Funcionário atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @employee.destroy!
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Funcionário destruído com sucesso.' }
    end
  end

  private

  def set_employee
    @employee = User.joins(:roles).find_by(id: params[:id], roles: { name: 'employee' })
  end

  def employee_params
    params.require(:user).permit(:name, :email, :cpf, :rg)
  end
end
