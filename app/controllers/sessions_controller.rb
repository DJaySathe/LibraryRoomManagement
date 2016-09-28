class SessionsController < ApplicationController
  def new
  end

  def create
  	libraryuser = Libraryuser.find_by(email: params[:session][:email].downcase)
    if libraryuser && libraryuser.authenticate(params[:session][:password])
      # Log the libraryuser in and redirect to the libraryuser's show page.
      log_in libraryuser
      redirect_to root_path
      
    else
      flash.now[:notice] = 'Invalid email/password combination'
      redirect_to login_path
  	end
  end

  def create_admin
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      # Log the libraryuser in and redirect to the libraryuser's show page.
      log_in_admin admin
      redirect_to root_path

    else
      flash.now[:notice] = 'Invalid email/password combination'
      redirect_to login_admin_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def destroy_admin
    log_out_admin
    redirect_to root_url
  end

end
