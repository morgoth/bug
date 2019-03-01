class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_admin

  helper_method :current_admin

  private

  def current_admin
    @current_admin ||= "John"
  end

  def require_admin
    redirect_to root_path, alert: "Nope" unless current_admin
  end
end
