class AddingEmailAndReplytoToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :email, :string, nil: false
    rename_column :comments, :user, :name

    add_index :comments, :email
  end
end
