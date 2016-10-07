class StaticPagesController < ApplicationController
  def home
    @images = Dir.glob("app/assets/images/carousel/*.{png,jpg,jpeg,gif}")
  end
end
