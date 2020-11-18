class BuyInfosController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @pay_form = PayForm.new
  end

  def create
    @pay_form = PayForm.new(pay_form_params)
    if @pay_form.valid?
      @pay_form.save
      redirect_to root_path
    else
      render 'index'

    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_form_params
    params.require(:pay_form).permit(:user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buy_info)
  end
end
