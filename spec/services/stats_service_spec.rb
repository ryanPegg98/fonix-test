# frozen_string_literal: true

RSpec.describe StatsService, type: :model do
  let!(:user) { create(:user) }
  let!(:user_two) { create(:user) }
  let!(:chatroom) { create(:chatroom) }

  let!(:chatroom_user) { create(:chatroom_user, user:, chatroom:) }
  let!(:chatroom_user_two) { create(:chatroom_user, user: user_two, chatroom:) }

  context 'with no messages' do
    describe '#build_stats' do
      subject(:service) { StatsService.new.send(:build_stats, user) }

      it 'should return an Array' do
        expect(subject).to be_an_instance_of Array
      end

      it 'should only have one item in the array' do
        expect(subject.size).to be(1)
      end

      it 'should have value for the mailer' do
        expect(subject.first[:chatroom]).to eq(chatroom)
        expect(subject.first[:message_count]).to be(0)
        expect(subject.first[:since_last_message]).to be(0)
        expect(subject.first[:users_last_message]).to be_present
      end
    end
  end

  context 'with messages' do
    let!(:message) { create(:message, chatroom_user: chatroom_user_two, content: 'Message Content') }
    let!(:message_two) { create(:message, chatroom_user: chatroom_user_two, content: 'Another Message Content') }

    describe '#build_stats' do
      subject(:service) { StatsService.new.send(:build_stats, user) }

      it 'should return an Array' do
        expect(subject).to be_an_instance_of Array
      end

      it 'should only have one item in the array' do
        expect(subject.size).to be(1)
      end

      it 'should have value for the mailer' do
        expect(subject.first[:chatroom]).to eq(chatroom)
        expect(subject.first[:message_count]).to be(2)
        expect(subject.first[:since_last_message]).to be(2)
        expect(subject.first[:users_last_message]).to be_present
      end
    end
  end
end
