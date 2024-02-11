# me = User.create!(
#     surname: 'John',
#     first_name: 'Doe',
#     email: 'john@doe.com',
#     password: '123456',
#     role: 'Super Admin',
#     address_line_1: 'Unknown number, General street, Challenge',
#     phone_number: Faker::Base.numerify('+23481########')
# )



20.times do
    product = Product.create!(
        user: User.first,
        name: Faker::Food.dish + ('a'..'z').to_a.sample,
        stock: (1..50).to_a.sample,
        description: Faker::Lorem.paragraphs.join("\n"),
        unit_price: (1000..7000).to_a.sample,
        feature: false,
        archive: false,
        category_id: (1..5).to_a.sample
    )
end