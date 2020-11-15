FactoryBot.define do
  factory :item do
    association :user

    name               { Faker::Lorem.characters(41) }
    details            { Faker::Base.regexify('[aあ]{1001}') }
    category_id        { 2 }
    item_status_id     { 2 }
    shipping_burden_id { 2 }
    prefecture_id      { 2 }
    days_to_ship_id    { 2 }
    price              { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
