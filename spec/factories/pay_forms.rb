FactoryBot.define do
  factory :pay_form do
    postal_code {"111-1111"}
    prefecture_id {2}
    municipality {"1"}
    address {"1"}
    phone_number {"12345678901"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
