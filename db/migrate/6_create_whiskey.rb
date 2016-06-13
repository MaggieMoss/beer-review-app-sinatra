class CreateWhiskey< ActiveRecord::Migration
  def up
    create_table :whiskeys do |t|
      t.string :name
      t.string :image_url
      t.string :category
      t.string :distiller
      t.string :country
      t.string :abv
      t.integer :user_id
    end
  end

  def down
    drop_table :whiskeys
  end
end
