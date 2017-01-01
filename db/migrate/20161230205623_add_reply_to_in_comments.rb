class AddReplyToInComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :reply_to_id, :integer, default: nil
    add_index :comments, :reply_to_id
  end
end
