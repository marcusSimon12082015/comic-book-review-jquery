class CreateCharacterComics < ActiveRecord::Migration[5.2]
  def change
    create_table :character_comics do |t|
      t.belongs_to :character
      t.belongs_to :comic
      t.timestamps
    end
  end
end
