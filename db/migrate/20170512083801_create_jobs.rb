class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.integer :author_id
      t.text :description
      t.string :job_type
      t.integer :salary
      t.string :currency

      t.timestamps
    end
  end
end
