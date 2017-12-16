FactoryBot.define do
  factory :park do
    name { Faker::BossaNova.song }
    address { Faker::Address.street_address }
    description { Faker::Lorem.paragraph(2, true) }
  end
end