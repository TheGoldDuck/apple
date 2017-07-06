module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, method: :delete
    else
      (link_to "Sign up",  new_user_registration_path) +
      "<br>".html_safe + # Temporary
      (link_to "Login", new_user_session_path)
      # Ruby tends to return the last item.
      # This is the solution to returning more than one thing.
    end
  end
end
