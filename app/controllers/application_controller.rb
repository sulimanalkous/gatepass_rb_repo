require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  # config.assets.paths << Rails.root.join("app", "assets", "fonts")

  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please login."
      redirect_to(access_login_path)
    end
  end
end
