class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end
  def create
    @order_address = OrderAddress.new(order_item_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def order_item_params
      params.require(:order_address).permit(:zipcode, :shipment_source_id, :address1, :address2, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
    end
end
