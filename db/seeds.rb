50.times do
  park = Park.create(
    name: Faker::Address.community,
    address: Faker::Address.street_name,
    description: Faker::Lorem.paragraph(2, true)
  )
end

