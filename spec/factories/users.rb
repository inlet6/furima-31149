FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nick_name             {Faker::Name.first_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {gimei.first.kanji}
    family_name           {gimei.family.kanji}
    first_name_kana       {gimei.first.katakana}
    family_name_kana      {gimei.family.katakana}
    birthday              {1,1,1}
  end
end