class CreateVote < ActiveRecord::Migration
  def up
    create_table :votes do |t|
      t.integer :user_id
      t.integer :beer_id
    end
  end

  def down
    drop_table :votes
  end
end