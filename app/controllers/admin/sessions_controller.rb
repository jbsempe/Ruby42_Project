class Admin::SessionsController < AdminController
  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_root_path
    else
      redirect_to admin_root_path, alert: t('admin.sessions.sign_in_error')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to admin_root_path, notice: t('admin.sessions.sign_out_confirmation')
  end
end
