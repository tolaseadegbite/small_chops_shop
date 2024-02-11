# me = User.create!(
#     surname: 'John',
#     first_name: 'Doe',
#     email: 'john@doe.com',
#     password: '123456',
#     role: 'Super Admin',
#     address_line_1: 'Unknown number, General street, Challenge',
#     phone_number: Faker::Base.numerify('+23481########')
# )



# 20.times do
#     product = Product.create!(
#         user: User.first,
#         name: Faker::Food.dish + ('a'..'z').to_a.sample,
#         stock: (1..50).to_a.sample,
#         description: Faker::Lorem.paragraphs.join("\n"),
#         unit_price: (1000..7000).to_a.sample,
#         feature: false,
#         archive: false,
#         category_id: (1..5).to_a.sample
#     )
# end

# 20.times do
#     user = User.create!(
#         surname: Faker::Name.last_name,
#         first_name: Faker::Name.first_name,
#         username: Faker::Internet.user_name,
#         email: Faker::Internet.email,
#         password: '123456',
#         role: 'Normal',
#         address_line_1: Faker::Address.street_address,
#         phone_number: Faker::Base.numerify('+23481########')
#     )
# end

20.times do
    review = Review.create!(
        title: Faker::Lorem.words.join(" "),
        body: Faker::Lorem.paragraphs.join("\n"),
        rating: (1..5).to_a.sample,
        user: User.all.sample,
        product: Product.all.sample
    )
end