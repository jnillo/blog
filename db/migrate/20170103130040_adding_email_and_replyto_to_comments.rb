class AddingEmailAndReplytoToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :email, :string, nil: false
    add_column :comments, :reply_to_id, :integer
    rename_column :comments, :user, :name

    add_index :comments, :email
    add_index :comments, :reply_to_id
  end
end
