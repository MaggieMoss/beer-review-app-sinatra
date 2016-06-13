class CreateBeer < ActiveRecord::Migration
  def up
    create_table :beers do |t|
      t.string :name
      t.string :image_url
      t.string :category
      t.string :brewer
      t.string :country
      t.string :abv
      t.string :beer_type
      t.integer :user_id
    end
  end

  def down
    drop_table :beers
  end
end