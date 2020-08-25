class CreateWebsiteBuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :website_builds do |t|
      t.text :html

      t.timestamps
    end
  end
end
