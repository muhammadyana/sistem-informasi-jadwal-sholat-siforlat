class PagesController < ApplicationController
	layout "layouts/landing"
	before_action :authenticate_user!, except: [:index]
	# layout false
  def index
  end

  def schedule
  	
  end
end
