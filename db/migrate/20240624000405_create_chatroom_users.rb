# frozen_string_literal: true

class CreateChatroomUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :chatroom_users do |t|
      t.references :chatroom, null: false, foreign_key: { to_table: :chatrooms }
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.datetime :last_viewed_at, null: true
      t.integer :role, default: 0, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
