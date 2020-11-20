class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy_info
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :item_status
  belongs_to :prefecture
  belongs_to :shipping_burden

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :details, length: { maximum: 1000 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_status_id
      validates :shipping_burden_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
    validates :price, inclusion: { in: 300..9_999_999 }
  end
end
