class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find_id, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if @item.order != nil || @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  def create
    @order_address = OrderAddress.new(order_item_params)
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_item_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def item_find_id
      @item = Item.find(params[:item_id])
    end

    def order_item_params
      params.require(:order_address).permit(:zipcode, :shipment_source_id, :address1, :address2, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end
end
