class AddPublishDateToResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :published, :timestamp, nil: false
    add_index :resources, :published
  end
end
