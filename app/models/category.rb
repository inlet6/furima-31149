class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ACT'},
    { id: 3, name: 'RPG'},
    { id: 4, name: 'FPS'}
]

include ActiveHash::Associations
  has_many :items
end
