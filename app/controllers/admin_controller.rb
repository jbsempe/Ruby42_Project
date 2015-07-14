class AdminController < ApplicationController
  layout "admin"
  before_action :require_login

  def require_login
    if current_user.nil?
      redirect_to login_path
    end
  end

  def set_locale
    I18n.locale = :fr
  end
end
