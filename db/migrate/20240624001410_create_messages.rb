# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :chatroom_user, null: false, foreign_key: { to_table: :chatroom_users }
      t.text :content, null: false

      t.timestamps
    end
  end
end
