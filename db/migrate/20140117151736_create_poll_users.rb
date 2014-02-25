class CreatePollUsers < ActiveRecord::Migration
  def change
    create_table :poll_users do |t|
      t.references :poll, index: true
      t.references :user, index: true
      t.integer :status

      t.timestamps
    end
    add_foreign_key :poll_users, :polls
    add_foreign_key :poll_users, :users
  end
end
