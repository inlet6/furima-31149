FactoryBot.define do
  factory :user do
    nick_name             {"makk"}
    email                 {"makk@makk.com"}
    password              {"makkmakk0"}
    password_confirmation {password}
    first_name            {"マック"}
    family_name           {"巻島"}
    first_name_kana       {"マック"}
    family_name_kana      {"マキシマ"}
    birthday              {1,1,1}
  end
end