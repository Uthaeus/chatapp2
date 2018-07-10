class PagesController < ApplicationController
  before_action :require_login

  def home

  end


  private

  def require_login
    redirect_to new_session_path unless logged_in?
  end
  
end
