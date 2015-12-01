class ApplicationController < ActionController::Base
  before_action :redirection
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirection
    if user_signed_in? && current_user.candidat.nil? && controller_name != "candidats" && action_name != "new"
      redirect_to new_candidat_path
    end
  end
end
