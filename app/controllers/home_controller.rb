class HomeController < ApplicationController
  def index
    @instagram = Instagram.user_recent_media("174431290", {:count => 1})
  end
end
