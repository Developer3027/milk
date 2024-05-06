class CreateThatches < ActiveRecord::Migration[7.1]
  def change
    create_table :thatches do |t|
      t.string :song_title
      t.string :artist
      t.date :year

      t.timestamps
    end
  end
end
