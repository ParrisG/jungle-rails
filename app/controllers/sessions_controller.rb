class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct:
    if user && user.authenticate(params[:password])
      #Save the user id inside the browser cookie.
      #This is how we keep the user logged in as they navigate
      session[:user_id] = user.id
      redirect_to '/'
    else
      #If the login doesn't work, send user back to login form
      redirect_to '/login'
    end
  end

  def destroy
    #removes the session cookie allowing user to log-out
    session[:user_id] = nil
    redirect_to '/login'
  end

end
