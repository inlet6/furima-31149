class PayForm
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :buy_info

  with_options presence: true do
    validates :user
    validates :item
    validates :postal_code format: { with:/\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :building_name
    validates :phone_number
    validates :buy_info
  end

  def save
    buy_info = BuyInfo.create ( user_id: user_id, item_id: item_id )
    Address.create ( postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buy_info_id: buy_info.id )
    
  end
end