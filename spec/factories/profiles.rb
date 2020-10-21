FactoryBot.define do
  factory :profile do
    nickname { Faker::Name.first_name }
    current_motorcycle { Faker::Vehicle.make_and_model }
    motorcycle_history { Faker::Vehicle.make_and_model }
    dream_motorcycle { Faker::Vehicle.make_and_model }
    fav_touring_routes { Faker::Movies::HarryPotter.location }
    other_hobbies { Faker::Game.genre }
    message { Faker::Movies::HarryPotter.quote }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_img.jpg'), filename: 'test_img.jpg')
    end
  end
end
