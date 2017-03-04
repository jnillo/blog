class PostChangeTypePublishedField < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :published, :datetime, nil: false
  end
end
