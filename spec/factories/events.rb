FactoryBot.define do
  factory :event do
    title { Faker::Movies::HarryPotter.book }
    date { '2000-01-11' }
    prefecture_id { 1 }
    meeting_point { Faker::Movies::HarryPotter.location }
    details { Faker::Lorem.paragraphs }
    meetup_time { '08:00:00' }
    association :user
  end
end
