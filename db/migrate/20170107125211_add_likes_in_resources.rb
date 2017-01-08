class AddLikesInResources < ActiveRecord::Migration[5.0]
  def change
    add_column :resources, :likes, :integer, default: 0
  end
end
