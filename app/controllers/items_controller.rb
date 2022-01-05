class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.find(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :delivery_id, :shipment_days_id, :shipment_source_id)
  end

end
