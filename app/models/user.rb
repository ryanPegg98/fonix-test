# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validaions
  validates :name, presence: true

  # Associations
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
end
