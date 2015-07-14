class Admin::PacksController < AdminController
  before_action :find_pack, only: [:show, :edit, :update, :destroy]

  def index
    @packs = Pack.all.page(params[:page])
  end

  def new
    @pack = Pack.new
  end

  def edit
  end

  def create
    @pack = Pack.new(pack_params)
    if @pack.save
      redirect_to admin_packs_path, notice: t('admin.packs.messages.new')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pack.update(pack_params)
      redirect_to admin_packs_path, notice: t('admin.packs.messages.edit')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pack.destroy
    redirect_to admin_packs_url, notice: t('admin.packs.messages.destroy')
  end

  private
  def find_pack
    @pack = Pack.find(params[:id])
  end

  def pack_params
    params.require(:pack).permit(*Pack.globalize_attribute_names, :image, :quantity,
      :format, :ingraving, :vinyl_colors, :label, :external_sleeve, :sleeve, :packaging, :weight)
  end
end
