class AddTitleAttributesToWebsiteConfig < ActiveRecord::Migration[6.0]
  def change
    add_column :website_configs, :site_name, :string
    add_column :website_configs, :icon_url, :string
    add_column :website_configs, :banner_background_color, :string
  end
end
