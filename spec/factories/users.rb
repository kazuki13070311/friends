FactoryBot.define do
  factory :user do
    name {"テストユーザー"}
    email {"test@gmail.com"}
    image {"default.jpg"}
    sex {"男性"}
    model {"PS4"}
    profession {"タイタン"}
    clan {"sample clan"}
    level {"50"}
    lightlevel {"1000"}
    strength {"2.0"}
    voice {"あり"}
    style {"エンジョイ勢(PvP派)"}
    timezone {"21時〜24時"}
    profile {"どうもこんにちは！"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :user1, class: User do
    name {"テストユーザー1"}
    email {"test1@gmail.com"}
    image {"default.jpg"}
    sex {"女性"}
    model {"PS3"}
    profession {"ハンター"}
    clan {"test clan"}
    level {"30"}
    lightlevel {"100"}
    strength {"2.5"}
    voice {"あり"}
    style {"エンジョイ勢(PvP派)"}
    timezone {"21時〜24時"}
    profile {"どうもこんにちは！"}
    password {"password"}
    password_confirmation {"password"}
    trait :invalid do
      name nil
    end
  end

  factory :user2, class: User do
    name {"テストユーザー2"}
    email {"test2@gmail.com"}
    image {"default.jpg"}
    sex {"男性"}
    model {"PC"}
    profession {"ウォーロック"}
    clan {"test1 clan"}
    level {"20"}
    lightlevel {"200"}
    strength {"3.5"}
    voice {"あり"}
    style {"エンジョイ勢(PvP派)"}
    timezone {"21時〜24時"}
    profile {"どうもこんにちは！"}
    password {"password"}
    password_confirmation {"password"}
  end
end
