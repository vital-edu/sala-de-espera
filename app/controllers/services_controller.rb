class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @services = Service.where(employee_id: current_user.id)
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    @service.status = 1
    @service.employee = current_user

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Serviço criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Serviço atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Serviço destruído com sucesso.' }
    end
  end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:scheduled_time, :employee_id, :client_id, :service_category_id)
    end
end
