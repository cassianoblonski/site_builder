class DropTitleWidgetsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :title_widgets
  end

  def down
    fail ActiveRecord::IrreversibleMigration

    create_table :title_widgets do |t|
      t.string :site_name
      t.string :icon_slug
      t.string :background_color
      t.references :website_config, null: false, foreign_key: true

      t.timestamps
    end
  end
end