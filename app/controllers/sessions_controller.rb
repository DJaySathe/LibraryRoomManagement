class SessionsController < ApplicationController
  def new
  end

  def create
  	libraryuser = Libraryuser.find_by(email: params[:session][:email].downcase)
    if libraryuser && libraryuser.authenticate(params[:session][:password])
      # Log the libraryuser in and redirect to the libraryuser's show page.
	  redirect_to
      log_in libraryuser
      
    else
      flash.now[:notice] = 'Invalid email/password combination'
      redirect_to login_path
  	end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
