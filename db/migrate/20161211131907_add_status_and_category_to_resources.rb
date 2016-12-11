class AddStatusAndCategoryToResources < ActiveRecord::Migration[5.0]
  def change
  	add_column :resources, :status, :boolean, default: true
    add_column :resources, :category, :string, nil: false
    add_index :resources, :category
    add_index :resources, :status
    add_index :resources, [:status, :category]
  end
end
