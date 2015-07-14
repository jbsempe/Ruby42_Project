class Admin::UsersController < AdminController
  before_action :find_admin_user, only: [:show, :edit, :update]

  def show
    redirect_to edit_admin_user_path(params[:id])
  end

  def edit
  end

  def update
    if @admin_user.update(admin_user_params)
      redirect_to admin_root_path, notice: t('admin.users.edit')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def find_admin_user
    @admin_user = User.find(params[:id])
  end

  def admin_user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
