class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :name
      t.text :description
      t.integer :type_proposal
      t.references :user, index: true

      t.timestamps
    end
    add_foreign_key :proposals, :users
  end
end
