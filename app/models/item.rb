class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :days_to_ship, :item_status, :prefecture, :shipping_burden

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
    validates :user
  end
end
