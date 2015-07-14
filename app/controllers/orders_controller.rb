class OrdersController < PublicController
  def index
    redirect_to packs_path
  end

  def show
    @order = Order.find(params[:id])
    respond_to do |format|
      format.pdf { render :layout => false } # Add this line
    end
  end

  def new
    @order = Order.new_from_pack(find_pack)
  end

  def price
    render json: { price: Order.new(price_params).price }
  end


  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order, format: 'pdf')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_pack
    Pack.find(params[:pack_id] || params[:order][:pack_id])
  end

  def price_params
    params.require(:order).permit(:quantity ,:format ,:ingraving, :vinyl_colors, :external_sleeve, :sleeve, :packaging, :weight, :label)
  end

  def order_params
    filtered_params.require(:order).permit(*order_permitted_attributes, client_attributes: client_permitted_attributes)
  end

  def order_permitted_attributes
    [:artist_name, :album_title, :label_name, :num_cat, :delivery_price, :status,
     :total_price, :quantity, :format, :ingraving, :vinyl_colors, :label, :external_sleeve,
     :sleeve, :packaging, :weight, :pack_id, :is_quote]
  end

  def client_permitted_attributes
    [:id, :email, :is_quote]
  end

  def filtered_params
    params[:order][:is_quote] = params[:order][:is_quote] == 'true'
    params[:order][:client_attributes][:is_quote] = params[:order][:is_quote]
    params
  end
end
