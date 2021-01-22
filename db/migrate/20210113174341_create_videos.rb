class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.references :user
      t.string :name
      t.string :video
      t.string :thumbnail

      t.timestamps
    end
  end
end
