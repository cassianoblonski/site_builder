class CreateCalendarWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_widgets do |t|
      t.string :title
      t.date :day
      t.integer :position
      t.references :website_config, null: false, foreign_key: true

      t.timestamps
    end
  end
end
