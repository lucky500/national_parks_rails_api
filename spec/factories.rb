FactoryBot.define do
  factory :park do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    description { Faker::Lorem.paragraph(2, true) }
  end
end