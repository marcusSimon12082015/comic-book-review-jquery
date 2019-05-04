class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.string :title
      t.date :release_date
      t.string :description
      t.belongs_to :publisher
      t.float :price
      t.integer :pages
      t.float :rating, default: 0
      t.string :comic_cover_image
      t.timestamps
    end
  end
end
