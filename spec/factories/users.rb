FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nick_name             { Faker::Name.first_name }
    email                 { Faker::Internet.free_email }
    password              { 'makk00' }
    password_confirmation { password }
    first_name            { gimei.first.kanji }
    family_name           { gimei.last.kanji }
    first_name_kana       { gimei.first.katakana }
    family_name_kana      { gimei.last.katakana }
    birthday              { Faker::Date.between_except(from: 50.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
