class BuyInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user_id == current_user.id || @item != nil
    redirect_to root_path
    end
      @pay_form = PayForm.new
  end

  def create
    @pay_form = PayForm.new(pay_form_params)
    if @pay_form.valid?
      pay_item
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
    params.require(:pay_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: pay_form_params[:token],
      currency: 'jpy'
    )
  end
end
