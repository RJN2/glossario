class SessionsController < Devise::SessionsController
	def create
    self.resource = warden.authenticate(auth_options)
    if resource && resource.active_for_authentication?
		  respond_to do |format|
		  	format.html {
			    set_flash_message(:notice, :signed_in) if is_flashing_format?
			    sign_in(resource_name, resource)
			    yield resource if block_given?
			    respond_with resource, location: after_sign_in_path_for(resource)
			 	}
			 	format.js {
			 		render js: "window.location.reload()"
				 	sign_in(resource_name, resource)
			 	}
			end
		else
			respond_to do |format|
				format.js {
					flash[:alert] = "Invalid email or password."
					render :template => "/registrations/devise_errors.js.erb"
					flash.discard
				}
			end
		end
  end
end