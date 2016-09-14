class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  def manage
  end

end
