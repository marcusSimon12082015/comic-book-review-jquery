class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :surname
      t.string :biography
      t.string :artist_image
      t.belongs_to :type
      t.timestamps
    end
  end
end
