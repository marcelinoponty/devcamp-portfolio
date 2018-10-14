module ApplicationHelper
	def sample_helper
		
		content_tag :div, class: "my-special-class" do
		"Hi I'm a div tag"
		end

		content_tag(:h1, "Hi I'm a heading tag", class:"my-special-class2")

	end

	def login_helper
    if current_user.is_a?(GuestUser)
        (link_to "Register", new_user_registration_path) + 
        "<br>".html_safe +
        (link_to "Login", new_user_session_path)        
    else
        link_to "Logout",  destroy_user_session_path, method: :delete
    end 
	end

def source_helper
    if session[:source]
   		content_tag(:p, "Thanks for visiting me from #{session[:source]}", class:"source-greeting")
     end 
end

end
