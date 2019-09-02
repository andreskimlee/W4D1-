class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false

      t.timestamps
    end
      add_index :artworks, [:title, :artist_id], unique: true
      add_index :artworks, :artist_id
      #does the artist_id itself have to be unique? Does this affect each individual title and artist_id index, or only the combination (probably only the combination)
  end
end
