class DaysToShip < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '明日発送'},
    { id: 3, name: '2〜3日後発送'},
    { id: 4, name: '4日後以降発送'}
]
include ActiveHash::Associations
  has_many :items
end
