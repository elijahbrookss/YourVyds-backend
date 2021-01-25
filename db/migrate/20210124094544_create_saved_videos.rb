class CreateSavedVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_videos do |t|
      t.references :user
      t.references :video
      t.timestamps
    end
  end
end
