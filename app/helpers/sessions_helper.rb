module SessionsHelper
	
  def log_in(libraryuser)
    session[:libraryuser_id] = libraryuser.id
    @libraryuser=libraryuser
	redirect_to librayruser_path
  end

  def current_user
    @current_user ||= Libraryuser.find_by(id: session[:libraryuser_id])
  end

  # Returns true if the libraryuser is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:libraryuser_id)
    @current_user = nil
  end
end
