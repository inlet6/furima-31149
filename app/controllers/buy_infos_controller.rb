class BuyInfosController < ApplicationController
  before_action :set_item, only: [ :index ]

  def index
    @buy_infos = BuyInfo.new

  end

  def create
    @buy_info = BuyInfo.new(buy_info_params)
    if @buy_info.valid?
      @buy_info.save
      return redirect_to root_path
    else
      render 'index'
      
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :details, :category_id, :item_status_id, :shipping_burden_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buy_info_params
    params.require(:buy_info).permit(:user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buy_info_id )
  end

end
