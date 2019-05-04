class CreateUserComics < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comics do |t|
      t.belongs_to :user
      t.belongs_to :comic
      t.timestamps
    end
  end
end
