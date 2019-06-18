# frozen_string_literal: true

class AddRememberTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :remember_digest, :string
  end
end
