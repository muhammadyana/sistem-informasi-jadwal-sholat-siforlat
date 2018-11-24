class PagesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	# layout false
  def index
  end

  def schedule
  	
  end
end
