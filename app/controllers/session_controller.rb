class SessionController < ApplicationController

  def new
  end

  def create
    # finds the admin by the given username
    admin = Admin.find_by(username: params[:username])
    # if we found the admin and they gave us the right password
    if admin && admin.authenticate(params[:password])
      # store admin id in sessions
      session[:admin_id] = admin.id
      redirect_to("/")
    else
      # rerender the login form
      render(:new)
    end
  end

  def destroy
    # we can set the sessions user_id to nil
    session[:admin_id] = nil
    redirect_to(root_path)
  end
end