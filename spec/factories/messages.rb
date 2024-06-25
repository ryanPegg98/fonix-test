# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    chatroom_user { create(:chatroom_user) }
    content { Faker::Lorem.sentence }
  end
end
