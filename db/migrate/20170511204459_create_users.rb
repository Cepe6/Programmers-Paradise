class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.boolean :active, default: true

      t.string :username
      t.string :email
      t.string :password_digest

      t.string :position
      t.attachment :cv
      t.datetime :birthdate
      t.string :gender
      t.string :preffered_langs
      t.string :country

      t.integer :forum_points, default: 0
      t.string :feedbacks
      t.string :tutorials
      t.integer :tutorial_points, default: 0
      t.string :teaching_courses
      t.integer :teaching_points, default: 0


      t.timestamps
    end
  end
end
