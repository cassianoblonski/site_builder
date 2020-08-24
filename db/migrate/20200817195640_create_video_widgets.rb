class CreateVideoWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :video_widgets do |t|
      t.string :url
      t.string :title
      t.integer :position
      t.references :website_config, null: false, foreign_key: true

      t.timestamps
    end
  end
end
