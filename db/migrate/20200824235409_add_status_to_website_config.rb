class AddStatusToWebsiteConfig < ActiveRecord::Migration[6.0]
  def change
    add_column :website_configs, :job_status, :string
  end
end
