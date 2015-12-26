class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :user, nil: false
      t.text :content, nil: false
      t.integer :status, default: 1

      t.references :post

      t.timestamps
    end

    add_index :comments, :post_id
    add_index :comments, :user
  end
end
