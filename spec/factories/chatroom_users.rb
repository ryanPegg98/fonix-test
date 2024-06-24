FactoryBot.define do
  factory :chatroom_user do
    chatroom { create(:chatroom) }
    user { create(:user) }
    last_viewed_at { Time.zone.now }
    role { 0 }
  end
end
