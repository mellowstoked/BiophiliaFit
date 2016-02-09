class HomeController < ApplicationController
  def index
    @popular = Instagram.media_popular
  end
end
