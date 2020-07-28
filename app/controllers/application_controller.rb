class ApplicationController < ActionController::Base
  include Pundit

  def require_admin!
    admin = current_user.memberships.where(role: 2).any?
    return redirect_to dashboard_path unless admin
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end
