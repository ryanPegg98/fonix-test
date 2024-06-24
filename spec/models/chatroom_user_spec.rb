require 'rails_helper'

RSpec.describe ChatroomUser, type: :model do
  describe "validations" do
    it { is_expected.to define_enum_for(:role).with_values(%i[user admin]) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:chatroom) }
    it { is_expected.to belong_to(:user) }
  end
end
