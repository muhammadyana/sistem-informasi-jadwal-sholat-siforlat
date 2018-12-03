class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :check_user_mosque


  def index
  end

  private
  def check_user_mosque
  	redirect_to new_user_mosque_path(current_user) unless current_user.mosque.present?
  end

end
