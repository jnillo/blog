class AddTagsToPosts < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :tags, :string, nil: false
  end
end
