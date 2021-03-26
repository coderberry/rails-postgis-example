class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.string :email
      t.integer :sender_id
      t.string :token
      t.datetime :accepted_at

      t.timestamps
    end

    add_index :invites, [:sender_id, :token]
  end
end

