class MosquesController < InheritedResources::Base

  private

    def mosque_params
      params.require(:mosque).permit(:name, :address, :latitude, :longitude, :user_id)
    end
end

