class Admin::OrdersController < AdminController
  before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.order(:id).page(params[:page])
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to admin_orders_path, notice: t('admin.orders.messages.edit')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to admin_orders_url, notice: t('admin.orders.messages.destroy')
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit( :artist_name, :album_title, :label_name, :num_cat,
      :delivery_price, :status, :total_price, :quantity, :format, :ingraving, :vinyl_colors,
      :label, :external_sleeve, :sleeve, :packaging, :weight, :pack_id, client_attributes: [:id, :email])
  end
end
