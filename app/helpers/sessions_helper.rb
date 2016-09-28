module SessionsHelper
	
  def log_in(libraryuser)
    session[:libraryuser_id] = libraryuser.id
    @libraryuser=libraryuser
  end

  def current_Libraryuser
    @current_user ||= Libraryuser.find_by(id: session[:libraryuser_id])
  end
  def admin

  end
  # Returns true if the libraryuser is logged in, false otherwise.
  def logged_in?
    !current_Libraryuser.nil?
  end

  def log_out
    session.delete(:libraryuser_id)
    @current_Libraryuser = nil
  end


  def member_logged_in?
    !current_Libraryuser.nil?
  end


  def admin_logged_in?
    !admin.nil?
  end
end

