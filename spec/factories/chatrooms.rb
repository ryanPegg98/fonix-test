FactoryBot.define do
  factory :chatroom do
    name { Faker::Artist.unique.name }
  end
end
