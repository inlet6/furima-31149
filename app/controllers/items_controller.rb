class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :details, :category_id, :item_status_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price, :user)
  end
end
