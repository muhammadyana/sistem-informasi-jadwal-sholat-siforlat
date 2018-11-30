module ApplicationHelper
	def gravatar_for(user, class_names=nil, options = { size: 500 })
  	gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  	size = options[:size]
  	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  	image_tag(gravatar_url, alt: user.full_name, class: class_names)
	end
end
