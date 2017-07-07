FactoryGirl.define do
  factory :user do
    username('Bob')
    email('bob234@email.com')
    password('123456')
    admin true
    id 1
  end

  factory :product do
    name('Picture')
    description('Pretty picture')
    price 4
    image('http://www3.pcmag.com/media/images/520612-yuneec-typhoon-h-pro-inline.jpg?thumb=y')
    user_id 1
  end
end
