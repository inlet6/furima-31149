FactoryBot.define do
  factory :item do
    name               {apex}
    image              {image_tag '/images/flag.png'}
    details            {cool}
    category_id        {2}
    item_status_id     {2}
    shipping_burden_id {2}
    prefecture_id      {2}
    days_to_ship_id    {2}
    price              {1000}
  end
end
