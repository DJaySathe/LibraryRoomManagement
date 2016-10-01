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
    @current_Libraryuser ||= Libraryuser.find_by(id: session[:libraryuser_id])
  end

  def current_admin
    @current_admin ||=Admin.find_by(id: session[:admin_id])
  end
  # Returns true if the libraryuser is logged in, false otherwise.

  #Authorize if admin is logged in, specifically for admin level actions 
  def authorize_admin
    redirect_to '/login_admin' unless current_admin
  end

  #Authorize if libraryuser is logged in, for admin level actions
  def authorize_Libraryuser
    redirect_to '/login' unless current_Libraryuser
  end

  #Authorize if either one is logged in, for actions that are common in both(e.g. booking)
  def authorize_either
    redirect_to '/login' unless current_Libraryuser || current_admin
  end

  def log_out
    session.delete(:libraryuser_id)
    reset_session
    @current_Libraryuser = nil
  end

  def log_out_admin
    session.delete(:admin_id)
    reset_session
    @current_admin = nil
  end

  def libraryuser_logged_in?
    !current_Libraryuser.nil?
  end


  def admin_logged_in?
    !current_admin.nil?
  end
end

