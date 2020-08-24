class CreateWeatherWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_widgets do |t|
      t.integer :lat
      t.integer :long
      t.integer :position
      t.references :website_config, null: false, foreign_key: true

      t.timestamps
    end
  end
end
