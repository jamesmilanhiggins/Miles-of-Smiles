User.destroy_all


user = User.new
user.username = "james"
user.email = "james@gmail.com"
user.password = '123456'
user.admin = true
user.save!


5.times do |index|
  User.create!(username: Faker::HarryPotter.character,
                  email: Faker::Internet.email,
                  password: Faker::Crypto.md5)
                  # avatar: File.new('app/assets/images/missing.png'))
end

p "Created #{User.count} users"

Product.destroy_all

25.times do |index|
  Product.create!(name: Faker::Book.title,
                description: Faker::Hipster.sentence(10, false, 4),
                price: Faker::Number.between(1, 15),
                # avatar: File.new('app/assets/images/missing.png'),
                user_id: Faker::Number.between(1, 5))
end

p "Created #{Product.count} images"

Comment.destroy_all

150.times do |index|
  Comment.create!(author: Faker::HarryPotter.character,
                title: Faker::Hipster.sentence(2, false, 2),
                content: Faker::Hipster.sentence(10, false, 4),
                product_id: Faker::Number.between(1, 25))
end

p "Created #{Comment.count} comments"
