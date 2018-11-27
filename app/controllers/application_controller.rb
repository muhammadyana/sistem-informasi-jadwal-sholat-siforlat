class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	protected  
    # def after_sign_in_path_for(resource)
    #   sign_in_url = new_user_session_url
    #   if request.referer == sign_in_url
    #     super
    #   else
    #     stored_location_for(resource) || request.referer || root_path
    #   end
		# end
		
		def after_sign_in_path_for(resource)
			logger.info("======== resource user = #{resource.to_json}")
			logger.info("======== mosque present? = #{resource.mosque.present?}")
			# If user dont have a mosque? redirect to create new mosque
			unless resource.mosque.present?
				new_user_mosque_path(resource)
			else
				stored_location_for(resource) || dashboard_path
			end
      
    end
end
