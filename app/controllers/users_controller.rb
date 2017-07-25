class UsersController < ApplicationController

  def show_signup #Get signup form
    render :signup
  end

  def signup #Create new user
    redirect_to '/deals'
  end

end
