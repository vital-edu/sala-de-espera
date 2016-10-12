class ServiceCategoriesController < ApplicationController
  before_action :set_service_category, only: %i(show edit update destroy)
  load_and_authorize_resource

  def index
    @service_categories = ServiceCategory.all
  end

  def show
  end

  def new
    @service_category = ServiceCategory.new
  end

  def edit
  end

  def create
    @service_category = ServiceCategory.new(service_category_params)

    respond_to do |format|
      if @service_category.save
        format.html do
          redirect_to @service_category,
                      notice: 'Categoria de serviço criada com sucesso.'
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @service_category.update(service_category_params)
        format.html do
          redirect_to @service_category,
                      notice: 'Categoria de serviço atualizada com sucesso.'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @service_category.destroy!
    respond_to do |format|
      format.html do
        redirect_to service_categories_url, notice
        'Categoria de serviço destruída com sucesso.'
      end
    end
  end

  private

  def set_service_category
    @service_category = ServiceCategory.find(params[:id])
  end

  def service_category_params
    params.require(:service_category).permit(
      :name,
      :description,
      :price,
      :image
    )
  end
end
