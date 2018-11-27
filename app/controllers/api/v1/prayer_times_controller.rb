# encoding: utf-8

module Api
  module V1
    class PrayerTimesController < ApiController

      def index
        @schedules = SiforlatServices.get_schedules(current_user.mosque.latitude, current_user.mosque.longitude, params[:duration])
        render json: @schedules
      end
      
    end
  end
end
