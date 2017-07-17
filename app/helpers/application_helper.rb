module ApplicationHelper
  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to "Sign up",  new_user_registration_path, class: style) +
      " ".html_safe + # Temporary
      (link_to "Login", new_user_session_path, class: style)
      # Ruby tends to return the last item.
      # This is the solution to returning more than one thing.
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}! You are on the #{layout_name} layout."
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    SorensenViewTool::Renderer.copyright 'Hunter Sorensen', 'All rights reserved'
  end
end
