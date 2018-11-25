ActiveAdmin.register Mosque do
# See permitted parameters documentation:
	permit_params :name, :address, :latitude, :longitude, :slug, :user_id
	before_action :only => [:show] do
	  @mosque = Mosque.friendly.find(params[:id])
	end
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
