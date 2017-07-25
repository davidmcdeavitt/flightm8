class PagesController < ApplicationController

  def home #Home page
    render :home #Page with 'get started' & 'login' buttons
  end

  def show_login
    render :login
  end

  def login
    redirect_to '/deals'
  end

  def deals
    render :dashboard
  end

  def show_save_deal
    render :savedeal
  end

  def add_to_favorites
    redirect_to '/deals'
  end

end
