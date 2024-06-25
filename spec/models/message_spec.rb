# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:chatroom_user) }
  end
end
