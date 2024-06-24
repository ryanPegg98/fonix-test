FactoryBot.define do
  factory :message do
    chatroom_user { create(:chatroom_user) }
    content { Faker::Lorem.sentence }
  end
end
