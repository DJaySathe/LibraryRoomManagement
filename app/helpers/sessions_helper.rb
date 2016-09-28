module SessionsHelper
	
  def log_in(libraryuser)
    session[:libraryuser_id] = libraryuser.id
    @libraryuser=libraryuser
  end

  def log_in_admin(admin)
    session[:admin_id] = admin.id
    @admin=admin
  end

  def current_Libraryuser
    @current_user ||= Libraryuser.find_by(id: session[:libraryuser_id])
  end
  def current_admin
    @current_admin ||=Admin.find_by(id: session[:admin_id])
  end
  # Returns true if the libraryuser is logged in, false otherwise.

  def log_out
    session.delete(:libraryuser_id)
    @current_Libraryuser = nil
  end

  def log_out_admin
    session.delete(:admin_id)
    @current_admin = nil
  end

  def libraryuser_logged_in?
    !current_Libraryuser.nil?
  end


  def admin_logged_in?
    !current_admin.nil?
  end
end

