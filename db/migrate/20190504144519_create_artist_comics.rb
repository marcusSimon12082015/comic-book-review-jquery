class CreateArtistComics < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_comics do |t|
      t.belongs_to :comic
      t.belongs_to :artist
      t.timestamps
    end
  end
end
