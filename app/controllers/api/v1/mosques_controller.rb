# encoding: utf-8
module Api
  module V1
    class MosquesController < ApplicationController

      def index
        render json: Mosque.all
      end
      
    end
  end
end
