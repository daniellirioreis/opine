class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.references :proposal, index: true
      t.integer :status_poll, default: 0

      t.timestamps
    end
    add_foreign_key :polls, :proposals
  end
end
