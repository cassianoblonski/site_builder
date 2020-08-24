class CreateWebsiteConfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :website_configs do |t|
      t.string :title_color
      t.string :background_color

      t.timestamps
    end
  end
end
