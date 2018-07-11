class PagesController < ApplicationController
  before_action :require_login
  before_action :redirection

  def home

  end


  private

  def require_login
    redirect_to new_session_path unless logged_in?
  end

  def redirection
    if current_user != nil
      redirect_to user_chats_path(user_id: current_user.id)
    end
  end
  
end
