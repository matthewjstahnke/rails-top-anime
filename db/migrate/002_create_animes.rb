class CreateAnimes < ActiveRecord::Migration[6.0]
    def change
        create_table :animes do |t|
            t.string :title
            t.string :genre
            t.string :release_year
            t.integer :episode_count
            t.integer :user_id
  
            t.timestamps
        end
    end
end