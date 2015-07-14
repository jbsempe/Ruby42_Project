class PacksController < PublicController
  before_action :find_pack, only: [:show]

  def index
    @packs = Pack.all
  end

  def show
  end

  private

  def find_pack
    @pack = Pack.find(params[:id])
  end

  def pack_params
    params.require(:pack).permit(:title, :description, :format)
  end
end
