class SessionsController < ApplicationController

  def create
    #find the user using the params username and authenticate with the given password
    #if successful respond with the user and we are going to set the session
    #else render an error message provide an authorized status
    user = User.find_by_username(params[:username])
    #this depends on the has_secured_password methodin the usermodel to see if the user exists in the database
    if user&.authenticate(params[:password])
      #set the session to log user in keep track of the user
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      render json: "Invalid Credentilas. PLease signup!", status: :unauthorized
    end
  end

  #logout
  def destroy
    #removing the session user_id to forget the user from the database with logout button in the form
    session.delete :user_id
  end
end
