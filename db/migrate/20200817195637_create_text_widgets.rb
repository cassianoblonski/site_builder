class CreateTextWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :text_widgets do |t|
      t.string :title
      t.string :content
      t.string :background_color
      t.integer :position
      t.references :website_config, null: false, foreign_key: true

      t.timestamps
    end
  end
end
