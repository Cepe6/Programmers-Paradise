class CreateTutorials < ActiveRecord::Migration[5.0]
  def change
    create_table :tutorials do |t|
      t.string :youtube_id
      t.string :youtube_name
      t.text :youtube_description
      t.integer :youtube_votes

      t.timestamps
    end
  end
end
