# frozen_string_literal: true

class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.string :name, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
