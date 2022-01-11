class OrdersController < ApplicationController
  def index
    @order = Order.new(order_params)
  end
  def create
  end

  private
  
  def order_params
    params.require(:order_address).permit(:zipcode, :shipment_source_id, :address1, :address2, :building_name, :phone_number, :order_id).merge(item_id: [:item_id], user_id: current_user.id)
  end

end
