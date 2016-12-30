class AddLinkBetweenPostAndResource < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :resource_id, :integer
  end
end
