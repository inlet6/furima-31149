class Address < ApplicationRecord
  belongs_to :buy_info
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
