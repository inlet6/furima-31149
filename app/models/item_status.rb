class ItemStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '未開封'}
    { id: 3, name: '未使用に近い'}
    { id: 4, name: '目立ったキズ、汚れなし'}
]
end
