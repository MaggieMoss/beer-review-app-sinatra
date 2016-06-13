class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :beer_id
      t.text :remarks
    end
  end

  def down
    drop_table :comments
  end
end